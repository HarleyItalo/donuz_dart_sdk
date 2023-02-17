import '../../common/common_module.dart';
import '../establishment_module.dart';

abstract class BannerRepository {
  Future<List<Banners>?> getBannersFromEstablishment(String appId);
}

class BannerRepositoryImpl extends BannerRepository {
  final HttpService httpService;
  final StorageService _storageService;
  BannerRepositoryImpl(
    this.httpService,
    this._storageService,
  );

  @override
  Future<List<Banners>?> getBannersFromEstablishment(String appId) async {
    var json = await _storageService.getDataTimmed("$bannersStoreKey-$appId");
    json ??= await httpService.get("estabelishments/banners", appId: appId);
    var response = BannerModel.fromJson(json).banners;

    _storageService.setDataTimmed("$bannersStoreKey-$appId", response);
    return response;
  }
}
