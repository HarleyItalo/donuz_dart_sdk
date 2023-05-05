// models
export 'models/rescue_model.dart';

// repositories
export 'repositories/rescue_repository.dart';

// usercases
export 'usercases/get_all_rescues.dart';
export 'usercases/get_avaliable_vouchers.dart';
export 'usercases/rescue_prize.dart';

import 'package:donuz_dart_sdk/modules/base_module.dart';
import 'redemption_module.dart';

class RedemptionModule extends BaseModule {
  RedemptionModule({required super.instance});
  late GetAllRescues getAllRescues;
  late GetAvaliableVouchers getAvaliableVouchers;
  late RescuePrize rescuePrize;

  @override
  Future init() async {
    getAllRescues = await instance.getAsync();
    getAvaliableVouchers = await instance.getAsync();
    rescuePrize = await instance.getAsync();
  }

  @override
  Future injectModule() async {
    instance.registerLazySingletonAsync<RescueRepository>(
      () async => RescueRepositoryImpl(
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<GetAllRescues>(
      () async => GetAllRescuesImpl(
        await instance.getAsync(),
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<GetAvaliableVouchers>(
      () async => GetAvaliableVouchersImpl(
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<RescuePrize>(
      () async => RescuePrizeImpl(
        await instance.getAsync(),
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
  }
}
