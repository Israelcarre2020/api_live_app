import '../../../../core/http/http_impl.dart';
import '../models/chuck_model.dart';

class ChuckRemoteDataSource {
  final HttpImpl http;
  final String chuckUrl;

  ChuckRemoteDataSource(this.http, this.chuckUrl);

  Future<ChuckModel> getChuck() async {
    final httpInstance = http.instance();

    final resp = await httpInstance.get(chuckUrl);

    return ChuckModel.fromJson(resp.data);
  }
}
