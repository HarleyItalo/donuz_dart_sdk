import '../establishment_module.dart';
import '../models/custom_config_model.dart';

abstract class GetCustomConfig {
  Future<CustomConfigModel?> call({required String key});
}

class GetCustomConfigImpl extends GetCustomConfig {
  final SettingsRepository _repository;
  final FindEstablishmentById _establishmentById;

  GetCustomConfigImpl(
    this._repository,
    this._establishmentById,
  );

  @override
  Future<CustomConfigModel?> call({required String key}) async {
    var appId = await _establishmentById.currentId();
    if (appId == null) {
      return null;
    }

    return _repository.getCustomConfig(appId: appId, key: key);
  }
}
