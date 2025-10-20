import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/features/shared/models/alrt_media_model.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/providers/repository_providers.dart';
import 'package:hazard_app/features/shared/repositories/media_repository.dart';
import 'package:hazard_app/features/shared/utils/either.dart';
import 'package:image_picker/image_picker.dart';

class MediaService {
  const MediaService(final Ref ref) : _ref = ref;

  final Ref _ref;
  MediaRepository get _mediaRepository => _ref.read(providerOfMediaRepository);

  /// Picks an image from the specified [source] (gallery or camera).
  Future<Either<AlrtMedia?, AppError>> pickImage({
    final ImageSource source = ImageSource.gallery,
  }) {
    return _mediaRepository.pickImage(source: source);
  }

  /// Picks a video from the specified [source] (gallery or camera).
  Future<Either<AlrtMedia?, AppError>> pickVideo({
    final ImageSource source = ImageSource.gallery,
  }) {
    return _mediaRepository.pickVideo(source: source);
  }

  /// Picks multiple images from the gallery.
  Future<Either<List<AlrtMedia>, AppError>> pickMedias() {
    return _mediaRepository.pickMedias();
  }
}
