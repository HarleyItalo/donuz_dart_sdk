import '../../establishment/establishment_module.dart';

import '../user_module.dart';

abstract class GetUser {
  Future<User?> call();
}

class GetUserImpl extends GetUser {
  final FindEstablishmentById _findEstablishmentById;

  final GetLoggedUserToken _getLoggedUserToken;

  final UserRepository _repository;

  GetUserImpl(
      this._repository, this._findEstablishmentById, this._getLoggedUserToken);

  @override
  Future<User?> call() async {
    var appId = await _findEstablishmentById.currentId();
    if (appId == null) {
      return null;
    }
    var token = await _getLoggedUserToken();
    return _repository.getUser(tokenClient: token, appId: appId);
  }
}
