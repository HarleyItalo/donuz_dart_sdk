import '../../user/user_module.dart';
import '../establishment_module.dart';

abstract class GetEstablishmentSettings {
  Future<Configuracoes?> call();
}

class GetEstablishmentSettingsImpl extends GetEstablishmentSettings {
  final SettingsRepository _repository;
  final FindEstablishmentById findEstablishmentById;
  final GetLoggedUserToken getLoggedUserToken;
  GetEstablishmentSettingsImpl(
      this._repository, this.findEstablishmentById, this.getLoggedUserToken);

  @override
  Future<Configuracoes?> call() async {
    var establishmentId = await findEstablishmentById.currentId();
    if (establishmentId == null) {
      return null;
    }
    var userToken = await getLoggedUserToken();

    return _repository.findSetting(establishmentId, userToken != null);
  }
}
