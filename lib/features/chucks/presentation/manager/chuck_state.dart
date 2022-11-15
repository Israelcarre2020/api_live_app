part of 'chuck_cubit.dart';

@freezed
abstract class ChuckState with _$ChuckState {
  const factory ChuckState.loading() = _Loading;
  const factory ChuckState.error(String message) = _Error;
  const factory ChuckState.loadedChucks(List<ChuckModel> chucks) =
      _LoadedChucks;
  const factory ChuckState.initial() = _Initial;
}
