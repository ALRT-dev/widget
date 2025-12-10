import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';

part 'notifications_feed_provider_state.freezed.dart';

@freezed
abstract class NotificationsFeedProviderState
    with _$NotificationsFeedProviderState {
  const factory NotificationsFeedProviderState({
    /// The search string to filter hazards by their title or description.
    @Default('') final String searchString,

    /// The list of hazards in the notifications feed.
    @Default(<Hazard>[]) final List<Hazard> hazards,

    /// The state of fetching the notifications feed.
    @Default(GetNotificationsFeed.initial())
    final GetNotificationsFeed getNotificationsFeed,
  }) = _NotificationsFeedProviderState;
}

@freezed
class GetNotificationsFeed with _$GetNotificationsFeed {
  const factory GetNotificationsFeed.initial() = _GetNotificationsFeedInitial;
  const factory GetNotificationsFeed.loading() = _GetNotificationsFeedLoading;
  const factory GetNotificationsFeed.success(
    final List<Hazard> hazards,
  ) = _GetNotificationsFeedSuccess;
  const factory GetNotificationsFeed.error(
    final AppError error,
  ) = _GetNotificationsFeedError;
}
