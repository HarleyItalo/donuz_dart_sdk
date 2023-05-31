import 'package:donuz_dart_sdk/modules/base_module.dart';
import 'coupon_module.dart';
//models
export 'models/coupon_status.dart';
//repositories
export 'repositories/coupon_repository.dart';
//usercases
export 'package:donuz_dart_sdk/modules/coupon/user_cases/coupon_status.dart';
export 'package:donuz_dart_sdk/modules/coupon/user_cases/send_coupon.dart';

class CouponModule extends BaseModule {
  CouponModule({required super.instance});

  late CouponStatus status;
  late SendCoupon sendCoupon;

  @override
  Future init() async {
    status = await instance.getAsync();
    sendCoupon = await instance.getAsync();
  }

  @override
  Future injectModule() async {
    instance.registerLazySingletonAsync<CouponRepository>(
      () async => CouponRepositoryImpl(
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<CouponStatus>(
      () async => CouponStatusImpl(
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<SendCoupon>(
      () async => SendCouponImpl(
        await instance.getAsync(),
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
  }
}
