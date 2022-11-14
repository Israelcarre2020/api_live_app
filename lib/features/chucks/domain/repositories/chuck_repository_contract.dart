import '../../data/models/chuck_model.dart';

abstract class ChuckRepositoryContact {
  Future<ChuckModel> getChuck();
}
