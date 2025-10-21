import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hazard_app/features/shared/enums/user_reports_status_types.dart';
import 'package:hazard_app/features/shared/models/alrt_media_model.dart';
import 'package:hazard_app/features/shared/utils/location_helper.dart';

part 'app_user_model.freezed.dart';
part 'app_user_model.g.dart';

@freezed
abstract class AppUser with _$AppUser {
  const AppUser._();

  const factory AppUser({
    /// The user's unique identifier.
    final String? id,

    /// The user's display name.
    final String? name,

    /// The user's email address.
    final String? email,

    /// The URL of the user's profile picture.
    @JsonKey(name: 'profilePicturePresignedUrl')
    final String? profilePictureUrl,

    /// The processed profile picture media.
    ///
    /// This field is not included in JSON serialization/deserialization and is generated using [profilePictureUrl].
    @JsonKey(includeFromJson: false, includeToJson: false)
    final AlrtMedia? processedProfilePicture,

    /// The user's latitude.
    final double? latitude,

    /// The user's longitude.
    final double? longitude,

    /// The name of the location associated with the user.
    final String? locationName,

    /// The experience points the user has accumulated.
    @Default(0) final int xpPoints,

    /// The user's reliability score, ranging from 0.0 to 1.0.
    @Default(0.0) final double reliabilityScore,

    /// The number of hazards the user has viewed.
    @Default(0) final int hazardsViewedCount,

    /// The number of hazards the user has reported.
    @Default(0) final int hazardsReportedCount,

    /// The number of upvotes the user has received on their reports.
    @Default(0) final int upvotesReceivedCount,

    /// The user's report verification status.
    @Default(UserReportsStatus.unverified)
    final UserReportsStatus reportsStatus,

    /// The timestamp when the user account was created.
    final DateTime? createdAt,
  }) = _AppUser;

  /// Calculates the distance in meters from the user's location to another geographical point.
  double? distanceTo(double otherLatitude, double otherLongitude) {
    if (latitude == null || longitude == null) {
      return null;
    }

    return calculateDistanceInMeters(
      latitude!,
      longitude!,
      otherLatitude,
      otherLongitude,
    );
  }

  /// Generates the initials from the user's name.
  String get initials {
    if (name?.isEmpty ?? true) {
      return 'U';
    }

    final nameParts = name!.trim().split(' ');
    if (nameParts.length == 1) {
      return nameParts[0][0].toUpperCase();
    } else {
      return (nameParts[0][0] + nameParts[1][0]).toUpperCase();
    }
  }

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}
