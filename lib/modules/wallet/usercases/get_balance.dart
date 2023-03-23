import 'package:donuz_dart_sdk/modules/establishment/usercases/find_establishment_by_id.dart';
import '../../user/user_module.dart';
import '../wallet_module.dart';

abstract class GetBalance {
  Future<BalanceModel?> call();
}

class GetBalanceImpl extends GetBalance {
  final PointsRepository _repository;
  final FindEstablishmentById _findEstablishmentById;
  final GetLoggedUserToken _userToken;

  GetBalanceImpl(
    this._repository,
    this._findEstablishmentById,
    this._userToken,
  );

  @override
  Future<BalanceModel?> call() async {
    var response =
        await Future.wait([_findEstablishmentById.currentId(), _userToken()]);
    for (var element in response) {
      if (element == null) return null;
    }

    var result = await _repository.getBalance(
        appId: response.first.toString(),
        tokenClient: response.last.toString());
    return result;
  }
}
