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
  Future<PointsModel> getPoints({
    required String appId,
    required String? tokenClient,
  });
  Future<BalanceModel> getBalance({
    required String appId,
    required String? tokenClient,
  });

  Future<BalanceModel> getBalanceById({
    required String appId,
    required String clientId,
  });

  Future<BaseResponseDonuzModel> validadePunctuableCode({
    required String code,
    required String? tokenClient,
    String? value,
    required String appId,
  });

  Future<BaseResponseDonuzModel> validadeQrCode({
    required String code,
    required String? tokenClient,
    required String appId,
  });
  Future<RankingModel> findRanking({
    required String appId,
  });
  Future<PointsRulesModel> getPointsRule({
    required String appId,
  });

  Future<BaseResponseDonuzModel> transfer({
    required String source,
    required String destination,
    required String appId,
    required double value,
  });
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

  @override
  Future<BaseResponseDonuzModel> validadePunctuableCode({
    required String code,
    required String? tokenClient,
    String? value,
    required String appId,
  }) async {
    var result = await httpService.post(
        'computableCode', {"codigo": code, "valor": value},
        appId: appId, tokenCliente: tokenClient);
    return BaseResponseDonuzModel.fromJson(result);
  }

  @override
  Future<BaseResponseDonuzModel> validadeQrCode({
    required String code,
    required String? tokenClient,
    required String appId,
  }) async {
    var result = await httpService.post(
        'qrcode',
        {
          "codigo": code,
        },
        appId: appId,
        tokenCliente: tokenClient);
    return BaseResponseDonuzModel.fromJson(result);
  }

  @override
  Future<RankingModel> findRanking({required String appId}) async {
    var response = await httpService.get(
      'points/ranking',
      appId: appId,
    );
    return RankingModel.fromJson(response);
  }

  @override
  Future<BaseResponseDonuzModel> transfer({
    required String source,
    required String destination,
    required double value,
    required String appId,
  }) async {
    var response = await httpService.post(
      'points/donate',
      {
        "valor": value,
        "cpf": destination,
        "cpf_origem": source,
      },
      appId: appId,
    );
    return BaseResponseDonuzModel.fromJson(response);
  }

  @override
  Future<PointsRulesModel> getPointsRule({required String appId}) async {
    var json = await httpService.get('points/rules', appId: appId);
    return PointsRulesModel.fromJson(json);
  }

  @override
  Future<BalanceModel> getBalanceById(
      {required String appId, required String clientId}) async {
    var result = await httpService.get(
      "client/balance/$clientId",
      appId: appId,
    );
    return BalanceModel.fromJson(result);
  }
}
