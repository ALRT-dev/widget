import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/shared/enums/alrt_media_types.dart';
import 'package:hazard_app/features/shared/models/alrt_media_model.dart';
import 'package:hazard_app/features/shared/views/widgets/video_thumbnail.dart';
import 'package:hazard_app/others/app_colors.dart';

class CreateReportMediasListItem extends ConsumerStatefulWidget {
  const CreateReportMediasListItem({
    super.key,
    required this.media,
  });

  /// The media item (image/video) to be displayed.
  final AlrtMedia media;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateReportMediasListItemState();
}

class _CreateReportMediasListItemState
    extends ConsumerState<CreateReportMediasListItem> {
  @override
  Widget build(BuildContext context) {
    return switch (widget.media.type) {
      AlrtMediaType.image => _imageBuilder(),
      AlrtMediaType.video => _videoBuilder(),
      _ => const SizedBox.shrink(),
    };
  }

  Widget _imageBuilder() {
    return Container(
      width: 100.spMin,
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(20.r),
        image: widget.media.type != AlrtMediaType.image
            ? null
            : DecorationImage(
                image: FileImage(File(widget.media.value)),
                fit: BoxFit.cover,
              ),
      ),
    );
  }

  Widget _videoBuilder() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.spMin),
      child: VideoThumbnail(
        videoMedia: widget.media,
        playIconSize: 35.0,
      ),
    );
  }
}
