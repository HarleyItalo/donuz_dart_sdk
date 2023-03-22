import '../../common/common_module.dart';
import '../wallet_module.dart';

abstract class PointsRepository {
  Future<PointsModel> getPoints({required String appId, String? tokenClient});
}

class PointsRepositoryImpl extends PointsRepository {
  final HttpService httpService;
  PointsRepositoryImpl(
    this.httpService,
  );

  @override
  Future<PointsModel> getPoints({
    required String appId,
    String? tokenClient,
  }) async {
    var result = await httpService.get("points",
        appId: appId, tokenCliente: tokenClient);
    return PointsModel.fromJson(result);
  }
}
