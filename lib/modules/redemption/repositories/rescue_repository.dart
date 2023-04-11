import '../../common/common_module.dart';
import '../models/rescue_model.dart';

abstract class RescueRepository {
  Future<List<Rescue>?> getRescuesFromClient(
      {required String tokenCliente, required String appId});
  Future<RescueModel> makeRescue({
    required int idPrize,
    required int quantity,
    required String appId,
    required String tokenCliente,
  });
}

class RescueRepositoryImpl extends RescueRepository {
  final HttpService httpService;
  RescueRepositoryImpl(
    this.httpService,
  );

  @override
  Future<List<Rescue>?> getRescuesFromClient(
      {required String tokenCliente, required String appId}) async {
    var json = await httpService.get("redeemptions",
        appId: appId, tokenCliente: tokenCliente);
    var resgates = RescueModel.fromJson(json).resgates;
    return resgates;
  }

  @override
  Future<RescueModel> makeRescue({
    required int idPrize,
    required int quantity,
    required String appId,
    required String tokenCliente,
  }) async {
    var data = <String, dynamic>{};
    data["id_premio"] = idPrize;
    data["quantidade"] = quantity;
    var response = await httpService.post("redeemptions", data,
        tokenCliente: tokenCliente, appId: appId);
    return RescueModel.fromJson(response);
  }
}
