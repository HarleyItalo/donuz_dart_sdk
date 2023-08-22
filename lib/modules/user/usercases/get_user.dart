import '../../establishment/establishment_module.dart';

import '../user_module.dart';

abstract class GetUser {
  Future<User?> call({String? user});
}

class GetUserImpl extends GetUser {
  final FindEstablishmentById _findEstablishmentById;

  final GetLoggedUserToken _getLoggedUserToken;

  final UserRepository _repository;

  GetUserImpl(
      this._repository, this._findEstablishmentById, this._getLoggedUserToken);

  @override
  Future<User?> call({String? user}) async {
    var response = await Future.wait(
        [_findEstablishmentById.currentId(), _getLoggedUserToken()]);
    var establisment = response.first;
    if (establisment == null) {
      return null;
    }
    var userCode = user ?? response.last;
    if (userCode == null) {
      return null;
    }
    return _repository.getUser(userInfo: userCode, appId: establisment);
  }
}
