import '../../common/common_module.dart';
import '../models/prize_model.dart';

abstract class PrizeRepository {
  Future<List<Prize>?> getPrizes(String appId);
}

class PrizeRepositoryImpl extends PrizeRepository {
  final HttpService httpService;

  PrizeRepositoryImpl(this.httpService);

  @override
  Future<List<Prize>?> getPrizes(String appId) async {
    var response = await httpService.get("prizes", appId: appId);
    var prizes = PrizeModel.fromJson(response).premios;

    return prizes;
  }
}
