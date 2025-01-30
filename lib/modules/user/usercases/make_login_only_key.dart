import '../../establishment/establishment_module.dart';
import '../user_module.dart';

abstract class MakeLoginOnlyKey {
  Future<LoginModel?> call({
    required String key,
    String? playerId,
  });
}

class MakeLoginOnlyKeyImpl extends MakeLoginOnlyKey {
  final LoginRepository _repository;
  final FindEstablishmentById _establishmentById;
  MakeLoginOnlyKeyImpl(this._repository, this._establishmentById);

  @override
  Future<LoginModel?> call({
    required String key,
    String? playerId,
  }) async {
    if (key.isEmpty) {
      return null;
    }

    var appId = await _establishmentById.currentId();
    if (appId == null) {
      return null;
    }

    return await _repository.makeLoginOnlyKey(
      key: key,
      appId: appId,
      playerId: playerId,
    );
  }
}
