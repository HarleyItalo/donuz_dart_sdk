import '../../common/common_module.dart';
import '../wallet_module.dart';

abstract class PointsRepository {
  Future<PointsModel> getPoints(
      {required String appId, required String? tokenClient});
  Future<BalanceModel> getBalance(
      {required String appId, required String? tokenClient});
}

class PointsRepositoryImpl extends PointsRepository {
  final HttpService httpService;
  PointsRepositoryImpl(
    this.httpService,
  );

  @override
  Future<PointsModel> getPoints({
    required String appId,
    required String? tokenClient,
  }) async {
    var result = await httpService.get("points",
        appId: appId, tokenCliente: tokenClient);
    return PointsModel.fromJson(result);
  }

  @override
  Future<BalanceModel> getBalance({
    required String appId,
    required String? tokenClient,
  }) async {
    var result = await httpService.get(
      "client/balance",
      appId: appId,
      tokenCliente: tokenClient,
    );
    return BalanceModel.fromJson(result);
  }
}
