import 'package:donuz_dart_sdk/modules/establishment/repositories/resources_repository.dart';

import '../establishment_module.dart';

abstract class GetHiredResources {
  Future<HiredResourcesModel?> call();
}

class GetHiredResourcesImpl extends GetHiredResources {
  final ResourcesRepository _repository;
  final FindEstablishmentById _establishmentById;

  GetHiredResourcesImpl(
    this._repository,
    this._establishmentById,
  );

  @override
  Future<HiredResourcesModel?> call() async {
    var appId = await _establishmentById.currentId();
    if (appId == null) {
      return null;
    }
    return await _repository.getResourcesHired(appId: appId);
  }
}
