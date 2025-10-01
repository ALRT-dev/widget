import 'package:freezed_annotation/freezed_annotation.dart';

part 'hazard_search_params.freezed.dart';
part 'hazard_search_params.g.dart';

@freezed
abstract class HazardSearchParams with _$HazardSearchParams {
  const factory HazardSearchParams({
    final String? searchString,
    @Default(<String>[]) final List<String> categoryIds,
  }) = _HazardSearchParams;

  factory HazardSearchParams.fromJson(Map<String, dynamic> json) =>
      _$HazardSearchParamsFromJson(json);
}
