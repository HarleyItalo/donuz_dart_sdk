import 'package:donuz_dart_sdk/modules/establishment/models/custom_config_model.dart';

import '../../common/common_module.dart';
import '../establishment_module.dart';

abstract class SettingsRepository {
  Future<Configuracoes?> findSetting({required String appId, bool isLogged});

  Future<BaseResponseDonuzModel> setCustomConfig({
    required String appId,
    required Map<String, dynamic> data,
    required String key,
  });

  Future<CustomConfigModel?> getCustomConfig({
    required String appId,
    required String key,
  });
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

  @override
  Future<CustomConfigModel?> getCustomConfig({
    required String appId,
    required String key,
  }) async {
    var json = await httpService.get("custom/config",
        headers: {"custom-key": key}, appId: appId);

    return CustomConfigModel.fromJson(json);
  }

  @override
  Future<BaseResponseDonuzModel> setCustomConfig({
    required String appId,
    required Map<String, dynamic> data,
    required String key,
  }) async {
    var json = await httpService.post("custom/config", data,
        headers: {"custom-key": key}, appId: appId);

    return BaseResponseDonuzModel.fromJson(json);
  }
}
