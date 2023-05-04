import '../../common/common_module.dart';
import '../establishment_module.dart';

abstract class SettingsRepository {
  Future<Configuracoes?> findSetting({required String appId, bool isLogged});
}

class SettingsRepositoryImpl extends SettingsRepository {
  final HttpService httpService;

  SettingsRepositoryImpl(this.httpService);
  @override
  Future<Configuracoes?> findSetting(
      {required String appId, bool isLogged = false}) async {
    var json = await httpService
        .get("settings/${isLogged ? 'meus-dados' : 'cadastro'}", appId: appId);

    var settings = SettingsModel.fromJson(json).configuracoes;

    return settings;
  }
}
