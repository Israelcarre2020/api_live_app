import '../../domain/repositories/chuck_repository_contract.dart';
import '../data_source/chuck_data_source.dart';
import '../models/chuck_model.dart';

class ChuckRepositoryImpl implements ChuckRepositoryContact {
  final ChuckRemoteDataSource remoteDataSource;

  ChuckRepositoryImpl(this.remoteDataSource);

  @override
  Future<ChuckModel> getChuck() async {
    return remoteDataSource.getChuck();
  }
}
