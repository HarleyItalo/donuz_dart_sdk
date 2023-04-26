import '../../common/common_module.dart';
import '../wallet_module.dart';

abstract class PointsRepository {
  Future<BaseResponseDonuzModel> insertPoint({
    required String userIdentification,
    required double value,
    required String description,
    required String appId,
    String? productCode,
    String? control,
    int? filialId,
    String? ruleId,
    int? userId,
  });
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
  Future<BaseResponseDonuzModel> insertPoint(
      {required String userIdentification,
      required double value,
      required String description,
      required String appId,
      String? productCode,
      String? control,
      int? filialId,
      String? ruleId,
      int? userId}) async {
    final pointModel = PointInsertModel(
      cliente: userIdentification,
      valor: value.toString(),
      dataDeInsercao: DateTime.now(),
      descricao: description,
      codigoDoProduto: productCode,
      controle: control,
      filialId: filialId,
      usuarioId: userId,
      regra: ruleId,
    );

    final result = await httpService.post(
      'points',
      pointModel.toJson(),
      appId: appId,
    );
    return BaseResponseDonuzModel.fromJson(result);
  }

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
