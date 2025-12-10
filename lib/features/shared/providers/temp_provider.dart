import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hazard_app/features/shared/providers/states/temp_provider_state.dart';

final providerOfTemp =
    StateNotifierProvider.autoDispose<TempProvider, TempProviderState>(
      (ref) => TempProvider(
        ref: ref,
        initialState: TempProviderState(),
      ),
    );

class TempProvider extends StateNotifier<TempProviderState> {
  TempProvider({
    required final Ref ref,
    required final TempProviderState initialState,
  }) : _ref = ref,
       super(initialState);

  // ignore: unused_field
  final Ref _ref;
}
