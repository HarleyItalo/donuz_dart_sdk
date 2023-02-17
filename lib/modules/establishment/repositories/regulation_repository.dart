import '../../common/common_module.dart';
import '../establishment_module.dart';

abstract class RegulationRepository {
  Future<Regulation?> getRegulation({required String appId});
}

class RegulationRepositoryImpl implements RegulationRepository {
  final HttpService _httpService;
  final StorageService _storageService;
  RegulationRepositoryImpl(this._httpService, this._storageService);

  @override
  Future<Regulation?> getRegulation({required String appId}) async {
    var regulation =
        await _storageService.getDataTimmed("$regulationStoreKey-$appId");
    if (regulation == null) {
      regulation = await _httpService.get(
          "estabelishment?fields=descricao_programa,regulamento",
          appId: appId);
      _storageService.setDataTimmed(
        "$regulationStoreKey-$appId",
        regulation,
      );
    }
    var model = RegulationModel.fromJson(regulation);
    return model.regulation;
  }
}
