import '../../establishment/establishment_module.dart';
import '../../user/user_module.dart';
import '../redemption_module.dart';

abstract class GetAllRescues {
  Future<List<Rescue>?> call();
}

class GetAllRescuesImpl extends GetAllRescues {
  final FindEstablishmentById _findEstablishmentById;
  final GetLoggedUserToken _getLoggedUserToken;
  final RescueRepository _repository;
  GetAllRescuesImpl(
    this._repository,
    this._findEstablishmentById,
    this._getLoggedUserToken,
  );

  @override
  Future<List<Rescue>?> call() async {
    var response = await Future.wait(
        [_findEstablishmentById.currentId(), _getLoggedUserToken()]);

    for (var element in response) {
      if (element == null) return null;
    }

    var result = await _repository.getRescuesFromClient(
        tokenCliente: response.last!, appId: response.first!);

    return result;
  }
}
