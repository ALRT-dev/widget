import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/shared/enums/alrt_media_source_types.dart';
import 'package:hazard_app/features/shared/enums/video_priority_types.dart';
import 'package:hazard_app/features/shared/models/alrt_media_model.dart';
import 'package:hazard_app/features/shared/providers/currently_playing_video_priorities_provider.dart';
import 'package:hazard_app/features/shared/providers/mute_video_provider.dart';
import 'package:hazard_app/features/shared/providers/service_providers.dart';
import 'package:hazard_app/features/shared/views/widgets/round_button.dart';
import 'package:hazard_app/features/shared/views/widgets/spinner.dart';
import 'package:hazard_app/others/app_colors.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:media_kit/media_kit.dart';

class MediaKitVideoPlayer extends ConsumerStatefulWidget {
  /// Displays the video media using the native player.
  const MediaKitVideoPlayer({
    super.key,
    required this.videoMedia,
    required this.priority,
    this.withPlayIcon = false,
    this.playButtonPositionedWidget,
    this.playIconSize = 50.0,
    this.withMuteButton = false,
    this.muteButtonPositionedWidget,
    this.muteButtonKey,
    this.autoPlay = true,
  });

  /// The video to display.
  final AlrtMedia videoMedia;

  /// The priority of the video to be played.
  /// This can be used to determine which video to play when there are multiple videos stacked on top of each other.
  ///
  /// Eg. A video is playing in a screen, and another video is playing in a dialog on top of the screen. In this case, the video in the dialog should have a higher priority than the video in the screen
  /// so that the video in the dialog is played and the video in the screen is paused.
  final VideoPriority priority;

  /// Whether to show the play icon or not.
  final bool withPlayIcon;

  /// The Positioned widget to cover the play button.
  final Positioned Function(Widget)? playButtonPositionedWidget;

  /// The size of the play icon.
  final double playIconSize;

  /// Whether to show the mute button or not.
  final bool withMuteButton;

  /// The Positioned widget to cover the mute button.
  final Positioned Function(Widget)? muteButtonPositionedWidget;

  /// The key of the mute button.
  final GlobalKey? muteButtonKey;

  /// Whether to autoplay the video or not.
  final bool autoPlay;

  @override
  ConsumerState<MediaKitVideoPlayer> createState() =>
      MediaKitVideoPlayerState();
}

class MediaKitVideoPlayerState extends ConsumerState<MediaKitVideoPlayer> {
  Player? _player;
  VideoController? _videoController;
  late AlrtMedia _videoMedia;
  bool _isInitialized = false;

  @override
  void dispose() {
    _player?.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant MediaKitVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.autoPlay != widget.autoPlay) {
      if (mounted) {
        if (widget.autoPlay) {
          _playVideoIfHighestPriority();
        } else {
          _player?.pause();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _listenToMuteVideoState();
    _listenToCurrentlyPlayingVideoPriorities();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          if (_videoController != null)
            IgnorePointer(
              child: Video(
                controller: _videoController!,
                fit: BoxFit.cover,
              ),
            ),
          if (!_isInitialized)
            Center(
              child: Spinner(
                color: AppColors.white,
              ),
            ),
          if (widget.withPlayIcon && _isInitialized)
            widget.playButtonPositionedWidget?.call(_playIconBuilder()) ??
                Center(
                  child: _playIconBuilder(),
                ),
          if (widget.withMuteButton && _isInitialized)
            widget.muteButtonPositionedWidget?.call(_volumeButtonBuilder()) ??
                Positioned(
                  right: 20,
                  bottom: 40,
                  child: _volumeButtonBuilder(),
                ),
        ],
      ),
    );
  }

  Widget _playIconBuilder() {
    return RoundButton(
      backgroundColor: AppColors.black,
      size: widget.playIconSize,
      elevation: 3.0,
      icon: Icon(
        Icons.play_arrow_rounded,
        color: AppColors.white,
        size: (widget.playIconSize - 15.0).spMin,
      ),
    );
  }

  Widget _volumeButtonBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final isMuted = ref.watch(
          providerOfMuteVideo.select(
            (value) => value.isMuted,
          ),
        );
        return RoundButton(
          key: widget.muteButtonKey,
          backgroundColor: AppColors.black.withValues(alpha: 0.5),
          size: 28.spMin,
          elevation: 3.0,
          onPressed: _toggleMute,
          icon: Icon(
            isMuted ? Icons.volume_off_rounded : Icons.volume_up_rounded,
            color: AppColors.white,
            size: 18.spMin,
          ),
        );
      },
    );
  }

  /// Listens to the changes of the mute value and performs actions accordingly.
  void _listenToMuteVideoState() {
    ref.listen(
      providerOfMuteVideo.select((value) => value.isMuted),
      (prev, next) {
        if (prev != next && _player != null) {
          if (next) {
            _player?.setVolume(0.0);
          } else {
            _player?.setVolume(100.0);
          }
        }
      },
    );
  }

  /// Listens to the changes of the currently playing video priorities and pauses/plays the video accordingly.
  void _listenToCurrentlyPlayingVideoPriorities() {
    ref.listen<List<VideoPriority>>(
      providerOfCurrentlyPlayingVideoPriorities,
      (prev, currentlyPlayingVideosPriorities) {
        if (prev != currentlyPlayingVideosPriorities && _player != null) {
          if (currentlyPlayingVideosPriorities.isEmpty) {
            // if there are no currently playing video priorities, pause the video.
            _player?.pause();
          } else {
            final highestPriority = currentlyPlayingVideosPriorities.reduce((
              value,
              element,
            ) {
              return value.index > element.index ? value : element;
            });
            if (widget.priority == highestPriority) {
              // if the current video's priority is the highest, play the video.
              if (widget.autoPlay) {
                _player?.play();
              }
            } else {
              // if the current video's priority is not the highest, pause the video.
              _player?.pause();
            }
          }
        }
      },
    );
  }

  /// Initializes the media kit player and loads the video.
  void _initializePlayer() async {
    _player = Player();
    _videoController = VideoController(_player!);

    _videoMedia = widget.videoMedia;
    if (_videoMedia.source == AlrtMediaSource.networkUrl) {
      final cacheManagerService = ref.read(providerOfCacheManagerService);
      final getVideoFromCache = await cacheManagerService
          .getSingleFileFromCache(key: _videoMedia.id);
      if (!mounted) return;

      final videoFile = getVideoFromCache.whenSuccess(
        (success) => success,
      );

      if (videoFile == null) {
        cacheManagerService.getSingleFile(
          url: _videoMedia.value,
        );
      } else {
        _videoMedia = _videoMedia.copyWith(
          value: videoFile.path,
          source: AlrtMediaSource.file,
        );
      }
    }

    await _player?.open(Media(_videoMedia.value));
    if (!mounted) return;

    final isMuted = ref.read(
      providerOfMuteVideo.select(
        (value) => value.isMuted,
      ),
    );
    _player?.setVolume(
      isMuted ? 0.0 : 100.0,
    );

    if (widget.autoPlay) {
      _playVideoIfHighestPriority();
    }

    setState(() {
      _isInitialized = true;
    });

    _player?.stream.completed.listen((completed) async {
      if (completed) {
        // when the playback has ended, start playing again if autoPlay is true.
        if (widget.autoPlay) {
          await _player?.seek(Duration.zero);
          _player?.play();
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  /// Plays the video if its priority is the highest among the currently playing videos.
  void _playVideoIfHighestPriority() {
    final currentlyPlayingVideosPriorities = ref.read(
      providerOfCurrentlyPlayingVideoPriorities,
    );
    if (currentlyPlayingVideosPriorities.isEmpty) {
      _player?.play();
    } else {
      final highestPriority = currentlyPlayingVideosPriorities.reduce((
        value,
        element,
      ) {
        return value.index > element.index ? value : element;
      });
      if (widget.priority.index >= highestPriority.index) {
        _player?.play();
      } else {
        _player?.pause();
      }
    }
  }

  /// Toggles the mute value.
  void _toggleMute() {
    ref.read(providerOfMuteVideo.notifier).toggleIsMuted();
  }
}
