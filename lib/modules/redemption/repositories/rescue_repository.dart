import 'package:donuz_dart_sdk/modules/redemption/models/redemptions_by_date_model.dart';

import '../../common/common_module.dart';
import '../models/rescue_model.dart';

abstract class RescueRepository {
  Future<List<Rescue>?> getRescuesFromClient(
      {required String tokenCliente, required String appId});

  Future<RescueModel> getRescueById(
      {required String id, required String appId});
  Future<RescueModel> makeRescue(
      {required int idPrize,
      required int quantity,
      required String appId,
      required String tokenCliente,
      String? deliveryAddressId});
  Future<RescueModel> changeVoucherStatus({
    required int idRedeemption,
    required String newStatus,
    required String appId,
    String? adminUserID,
  });
  Future<RedemptionsByDateModel> redemptionsByDate(
      {required String appId, required DateTime startDate, int page = 0});
}

class RescueRepositoryImpl extends RescueRepository {
  final HttpService httpService;
  RescueRepositoryImpl(
    this.httpService,
  );

  @override
  Future<List<Rescue>?> getRescuesFromClient(
      {required String tokenCliente, required String appId}) async {
    var json = await httpService.get(
      "redeemptions",
      appId: appId,
      tokenCliente: tokenCliente,
    );
    var resgates = RescueModel.fromJson(json).resgates;
    return resgates;
  }

  @override
  Future<RescueModel> makeRescue(
      {required int idPrize,
      required int quantity,
      required String appId,
      required String tokenCliente,
      String? deliveryAddressId}) async {
    var data = <String, dynamic>{};
    data["id_premio"] = idPrize;
    data["quantidade"] = quantity;
    data["endereco_entrega_id"] = deliveryAddressId;
    var response = await httpService.post(
      "redeemptions",
      data,
      tokenCliente: tokenCliente,
      appId: appId,
    );
    return RescueModel.fromJson(response);
  }

  @override
  Future<RescueModel> changeVoucherStatus({
    required int idRedeemption,
    required String newStatus,
    required String appId,
    String? adminUserID,
  }) async {
    var json = await httpService.put(
      "voucher",
      {
        "id_pedido": idRedeemption,
        "status": newStatus,
        "usuario_id": adminUserID
      },
      appId: appId,
    );
    return RescueModel.fromJson(json);
  }

  @override
  Future<RedemptionsByDateModel> redemptionsByDate(
      {required String appId,
      required DateTime startDate,
      int page = 0}) async {
    var json = await httpService.get(
        "vouchersBydate?initDate=${startDate.year}-${startDate.month}-${startDate.day}&page=$page",
        appId: appId);

    return RedemptionsByDateModel.fromJson(json);
  }

  @override
  Future<RescueModel> getRescueById({
    required String id,
    required String appId,
  }) async {
    var json = await httpService.get("redeemption/$id", appId: appId);

    return RescueModel.fromJson(json);
  }
}
