import 'package:donuz_dart_sdk/modules/app/models/app_config_model.dart';
import 'package:donuz_dart_sdk/modules/app/repositories/app_config_repository.dart';
import '../../establishment/establishment_module.dart';

abstract class FindAppConfig {
  Future<AppConfig?> call();
}

class FindAppConfigImpl implements FindAppConfig {
  final AppConfigRepository _repository;
  final FindEstablishmentById _findEstablishmentById;

  FindAppConfigImpl(this._repository, this._findEstablishmentById);
  @override
  Future<AppConfig?> call() async {
    var establisment = await _findEstablishmentById.currentId();
    if (establisment == null) return null;

    var result = await _repository.findAppConfig(appId: establisment);
    return result.appConfig;
  }
}
