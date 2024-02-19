import 'package:donuz_dart_sdk/modules/establishment/usercases/find_establishment_by_id.dart';
import '../wallet_module.dart';

abstract class GetBalanceById {
  Future<BalanceModel?> call(String clientId);
}

class GetBalanceByIdImpl extends GetBalanceById {
  final PointsRepository _repository;
  final FindEstablishmentById _findEstablishmentById;

  GetBalanceByIdImpl(
    this._repository,
    this._findEstablishmentById,
  );

  @override
  Future<BalanceModel?> call(String clientId) async {
    var response = await _findEstablishmentById.currentId();

    if (response == null) return null;

    var result = await _repository.getBalanceById(
      appId: response.toString(),
      clientId: clientId,
    );

    return result;
  }
}
