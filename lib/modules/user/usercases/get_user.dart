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
    var response = await Future.wait(
        [_findEstablishmentById.currentId(), _getLoggedUserToken()]);
    for (var element in response) {
      if (element == null) return null;
    }
    return _repository.getUser(
        tokenClient: response.last, appId: response.first!);
  }
}
