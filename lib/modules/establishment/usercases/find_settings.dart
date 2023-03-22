import '../../user/user_module.dart';
import '../establishment_module.dart';

abstract class GetEstablishmentSettings {
  Future<Configuracoes?> call();
}

class GetEstablishmentSettingsImpl extends GetEstablishmentSettings {
  final SettingsRepository _repository;
  final FindEstablishmentById _findEstablishmentById;
  final GetLoggedUserToken _getLoggedUserToken;
  GetEstablishmentSettingsImpl(
      this._repository, this._findEstablishmentById, this._getLoggedUserToken);

  @override
  Future<Configuracoes?> call() async {
    var response = await Future.wait(
        [_findEstablishmentById.currentId(), _getLoggedUserToken()]);

    var userToken = response.last;
    var establishmentId = response.first;
    if (establishmentId == null) {
      return null;
    }
    return _repository.findSetting(establishmentId, userToken != null);
  }
}
