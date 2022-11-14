import '../../../../core/generic_use_case/generic_use_case.dart';
import '../../data/models/chuck_model.dart';
import '../repositories/chuck_repository_contract.dart';

class GetChuckUseCase implements UseCase<Future<ChuckModel>, void> {
  final ChuckRepositoryContact repository;

  GetChuckUseCase(this.repository);

  @override
  Future<ChuckModel> call(_) async {
    return repository.getChuck();
  }
}

//TODO: CATCH THE ERRORS ON CUBIT
