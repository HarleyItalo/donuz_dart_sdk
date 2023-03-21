import '../../common/common_module.dart';
import '../establishment_module.dart';

abstract class SettingsRepository {
  Future<Configuracoes?> findSetting(String appId, bool islogged);
}

class SettingsRepositoryImpl extends SettingsRepository {
  final HttpService httpService;

  SettingsRepositoryImpl(this.httpService);
  @override
  Future<Configuracoes?> findSetting(String appId, bool islogged) async {
    var json = await httpService
        .get("settings/${islogged ? 'meus-dados' : 'cadastro'}", appId: appId);

    var settings = SettingsModel.fromJson(json).configuracoes;

    return settings;
  }
}
