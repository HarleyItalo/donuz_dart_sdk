import 'package:donuz_dart_sdk/modules/common/models/base_response_donuz_model.dart';

import '../establishment_module.dart';

abstract class SetCustomConfig {
  Future<BaseResponseDonuzModel?> call(
      {required String key, required Map<String, dynamic> data});
}

class SetCustomConfigImpl extends SetCustomConfig {
  final SettingsRepository _repository;
  final FindEstablishmentById _establishmentById;

  SetCustomConfigImpl(
    this._repository,
    this._establishmentById,
  );

  @override
  Future<BaseResponseDonuzModel?> call(
      {required String key, required Map<String, dynamic> data}) async {
    var appId = await _establishmentById.currentId();
    if (appId == null) {
      return null;
    }

    return await _repository.setCustomConfig(
        appId: appId, key: key, data: data);
  }
}
