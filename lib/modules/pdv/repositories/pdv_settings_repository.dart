import '../../common/common_module.dart';
import '../pdv_module.dart';

abstract class PdvSettingsRepository {
  Future<PdvSettings?> getPdvSettingsFromEstablishment(String appId);
}

class PdvSettingsRepositoryImpl extends PdvSettingsRepository {
  final HttpService httpService;
  PdvSettingsRepositoryImpl(
    this.httpService,
  );

  @override
  Future<PdvSettings?> getPdvSettingsFromEstablishment(String appId) async {
    var json = await httpService.get("pdv-settings", appId: appId);
    var response = PdvSettingModel.fromJson(json).pdvSettings;

    return response;
  }
}
