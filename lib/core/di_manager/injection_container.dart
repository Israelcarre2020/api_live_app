import '../../features/chucks/di/chuck_di.dart';

Future<void> injectDependencies() async {
  await ChuckInjector.injectDependencies();
}
