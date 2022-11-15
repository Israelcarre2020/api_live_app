import '../../../core/config/remote_api_constants.dart';
import '../../../core/di_manager/di_manager.dart';
import '../../../core/http/http_impl.dart';
import '../data/data_source/chuck_data_source.dart';
import '../data/repositories/chuck_repository_impl.dart';
import '../domain/repositories/chuck_repository_contract.dart';
import '../domain/use_cases/get_chuck_use_case.dart';
import '../presentation/manager/chuck_cubit.dart';

abstract class ChuckInjector {
  static bool _isAlreadyInjected = false;

  static Future<void> injectDependencies() async {
    if (_isAlreadyInjected) {
      return;
    }

    DIManager.getIt.registerSingleton(HttpImpl());

    DIManager.getIt.registerSingleton(ChuckRemoteDataSource(
        DIManager.getIt<HttpImpl>(), RemoteApiConstants.chucknorrisUrl));

    DIManager.getIt.registerSingleton<ChuckRepositoryContact>(
        ChuckRepositoryImpl(DIManager.getIt<ChuckRemoteDataSource>()));

    DIManager.getIt.registerSingleton(
        GetChuckUseCase(DIManager.getIt<ChuckRepositoryContact>()));

    DIManager.getIt.registerSingleton(
        ChuckCubit(getChuckUseCase: DIManager.getIt<GetChuckUseCase>()));

    _isAlreadyInjected = true;
  }
}
