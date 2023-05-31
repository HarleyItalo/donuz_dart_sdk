import '../../establishment/establishment_module.dart';
import '../user_module.dart';

abstract class UpdateNotificationToken {
  Future<bool> call({required String playerId});
}

class UpdateNotificationTokenImpl extends UpdateNotificationToken {
  final FindEstablishmentById _findEstablishmentById;
  final GetLoggedUserToken _getLoggedUserToken;
  final UserRepository _repository;

  UpdateNotificationTokenImpl(
    this._repository,
    this._findEstablishmentById,
    this._getLoggedUserToken,
  );

  @override
  Future<bool> call({required String playerId}) async {
    var response = await Future.wait(
        [_findEstablishmentById.currentId(), _getLoggedUserToken()]);

    for (var element in response) {
      if (element == null) return false;
    }
    var success = await _repository.updateNotificationToken(
        playerId: playerId,
        appId: response.first!,
        tokenClient: response.last!);

    return success;
  }
}
