import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';

part 'temp_provider_state.freezed.dart';

@freezed
abstract class TempProviderState with _$TempProviderState {
  const factory TempProviderState({
    /// The state of getting temp data.
    @Default(GetTempDataState.initial())
    final GetTempDataState getTempDataState,
  }) = _TempProviderState;
}

@freezed
class GetTempDataState with _$GetTempDataState {
  const factory GetTempDataState.initial() = _GetTempDataStateInitial;
  const factory GetTempDataState.loading() = _GetTempDataStateLoading;
  const factory GetTempDataState.success(final dynamic result) =
      _GetTempDataStateSuccess;
  const factory GetTempDataState.error(final AppError error) =
      _GetTempDataStateError;
}
