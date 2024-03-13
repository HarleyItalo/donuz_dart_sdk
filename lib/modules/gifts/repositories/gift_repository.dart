import '../../common/common_module.dart';
import '../gift_module.dart';

abstract class GiftsRepository {
  Future<GiftsModel?> findGifts(
      {required String appId, required String tokenCliente});

  Future<BaseResponseDonuzModel?> changeGiftStatus({
    required int giftRedemptionId,
    required String status,
    required String appId,
    int? userId,
  });
}

class GiftsRepositoryImpl extends GiftsRepository {
  final HttpService httpService;

  GiftsRepositoryImpl(
    this.httpService,
  );

  @override
  Future<GiftsModel?> findGifts(
      {required String appId, required String tokenCliente}) async {
    var response = await httpService.get(
      'gifts',
      appId: appId,
      tokenCliente: tokenCliente,
    );
    return GiftsModel.fromJson(response);
  }

  @override
  Future<BaseResponseDonuzModel?> changeGiftStatus({
    required int giftRedemptionId,
    required String status,
    required String appId,
    int? userId,
  }) async {
    var data = {
      "id_presente": giftRedemptionId,
      "status": status,
      "usuario_id": userId
    };

    var response = await httpService.put("gift", data, appId: appId);

    return BaseResponseDonuzModel.fromJson(response);
  }
}
