import '../../common/common_module.dart';
import '../models/coupon_status.dart';

abstract class CouponRepository {
  Future<bool> sendCoupon({
    required String user,
    required String url,
    required String appId,
    required String token,
  });

  Future<CouponStatusModel> couponStatus({
    required String user,
    required String appId,
  });
}

class CouponRepositoryImpl extends CouponRepository {
  final HttpService httpService;
  final BaseConfig config;
  CouponRepositoryImpl(
    this.httpService,
    this.config,
  );
  @override
  Future<bool> sendCoupon(
      {required String user,
      required String url,
      required String appId,
      required String token}) async {
    var json = await httpService.post(
      "${config.couponServer}/nfce",
      {
        "url": url,
        "codigoCliente": user,
        "estabelecimentoId": appId,
        'TokenCliente': token
      },
      headers: {
        "estabelecimentoId": appId,
        "token": config.donuzToken,
        "content-type": "application/json"
      },
      useDonuzToken: false,
    );
    var response = BaseResponseDonuzModel.fromJson(json);
    return response.status == 200;
  }

  @override
  Future<CouponStatusModel> couponStatus({
    required String user,
    required String appId,
  }) async {
    var response = await httpService.get(
      "${config.couponServer}/nfce/$user",
      headers: {
        "estabelecimentoId": appId,
        "token": config.donuzToken,
        "content-type": "application/json"
      },
      useDonuzToken: false,
    );
    return CouponStatusModel.fromJson(response);
  }
}
