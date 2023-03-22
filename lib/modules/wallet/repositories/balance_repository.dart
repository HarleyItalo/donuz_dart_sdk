import '../../common/common_module.dart';
import '../wallet_module.dart';

abstract class BalanceRepository {
  Future<BalanceModel> getBalance({required String appId, String? tokenClient});
}

class BalanceRepositoryImpl extends BalanceRepository {
  final HttpService httpService;
  BalanceRepositoryImpl(
    this.httpService,
  );

  @override
  Future<BalanceModel> getBalance({
    required String appId,
    String? tokenClient,
  }) async {
    var result = await httpService.get("client/balance",
        appId: appId, tokenCliente: tokenClient);
    return BalanceModel.fromJson(result);
  }
}
