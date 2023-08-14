import '../../establishment/establishment_module.dart';
import '../user_module.dart';

abstract class MakeLogin {
  Future<LoginModel?> call({
    required String username,
    required String password,
    String? playerId,
  });
}

class MakeLoginImpl extends MakeLogin {
  final LoginRepository _repository;
  final FindEstablishmentById _establishmentById;
  MakeLoginImpl(this._repository, this._establishmentById);

  @override
  Future<LoginModel?> call({
    required String username,
    required String password,
    String? playerId,
  }) async {
    if (username.isEmpty || password.isEmpty) {
      return null;
    }

    var appId = await _establishmentById.currentId();
    if (appId == null) {
      return null;
    }

    return await _repository.makeLogin(
      username: username,
      password: password,
      appId: appId,
      playerId: playerId,
    );
  }
}
