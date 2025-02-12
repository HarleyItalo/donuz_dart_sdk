import '../../common/common_module.dart';
import '../establishment_module.dart';

abstract class ResourcesRepository {
  Future<HiredResourcesModel?> getResourcesHired({required String appId});
}

class ResourcesRepositoryImpl implements ResourcesRepository {
  final HttpService _httpService;
  ResourcesRepositoryImpl(
    this._httpService,
  );

  @override
  Future<HiredResourcesModel?> getResourcesHired(
      {required String appId}) async {
    var response = await _httpService.get("recurso/contratados", appId: appId);

    return HiredResourcesModel.fromJson(response);
  }
}
