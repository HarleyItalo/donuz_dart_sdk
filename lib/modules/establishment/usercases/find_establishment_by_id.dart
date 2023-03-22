import 'package:donuz_dart_sdk/modules/common/common_module.dart';

import '../establishment_module.dart';

abstract class FindEstablishmentById {
  Future<String?> currentId();
  Future<Estabelecimento?> call({String? id});
}

class FindEstablishmentByIdImpl extends FindEstablishmentById {
  final EstablishimentRepository _repository;
  final BaseConfig _config;
  final StorageService _storageService;

  FindEstablishmentByIdImpl(
    this._repository,
    this._config,
    this._storageService,
  );

  @override
  Future<Estabelecimento?> call({String? id}) async {
    id ??= _config.appId;
    await _storageService.setData("currentId", id, serialize: false);
    return await _repository.findById(id);
  }

  @override
  Future<String?> currentId() async {
    return await _storageService.getString("currentId");
  }
}
