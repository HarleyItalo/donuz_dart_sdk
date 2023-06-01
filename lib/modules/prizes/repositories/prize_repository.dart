import 'package:donuz_dart_sdk/modules/prizes/models/prize_category_model.dart';
import 'package:donuz_dart_sdk/modules/prizes/models/prize_model.dart';

import '../../common/common_module.dart';
import '../models/prizes_model.dart';

abstract class PrizeRepository {
  Future<List<Prize>?> getPrizes(String appId);
  Future<PrizeInfo?> getPrizeById(String prizeId, String appId);
  Future<PrizeCategoryModel> getPrizesCategories(String appId);
}

class PrizeRepositoryImpl extends PrizeRepository {
  final HttpService httpService;

  PrizeRepositoryImpl(this.httpService);

  @override
  Future<List<Prize>?> getPrizes(String appId) async {
    var response = await httpService.get("prizes", appId: appId);
    return PrizesModel.fromJson(response).premios;
  }

  @override
  Future<PrizeInfo?> getPrizeById(String prizeId, String appId) async {
    var response = await httpService.get("prizes/$prizeId", appId: appId);
    return PrizeInfoModel.fromJson(response).prize;
  }

  @override
  Future<PrizeCategoryModel> getPrizesCategories(String appId) async {
    var response = await httpService.get("prizes/categories", appId: appId);
    return PrizeCategoryModel.fromJson(response);
  }
}
