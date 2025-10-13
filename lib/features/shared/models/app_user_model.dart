import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user_model.freezed.dart';
part 'app_user_model.g.dart';

@freezed
abstract class AppUser with _$AppUser {
  const factory AppUser({
    /// The user's unique identifier.
    final String? id,

    /// The user's display name.
    final String? name,

    /// The user's email address.
    final String? email,

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

    /// The timestamp when the user account was created.
    final DateTime? createdAt,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}
