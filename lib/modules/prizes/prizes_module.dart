import 'package:donuz_dart_sdk/modules/base_module.dart';
import 'package:donuz_dart_sdk/modules/prizes/prizes_module.dart';
import 'package:donuz_dart_sdk/modules/prizes/usercases/get_prize_categories.dart';
//models
export 'models/prize_category_model.dart';
export 'models/prizes_model.dart';
//repositories
export 'repositories/prize_repository.dart';
// usercases
export 'usercases/get_prize_by_id.dart';
export 'usercases/get_prizes.dart';

class PrizeModule extends BaseModule {
  PrizeModule({required super.instance});

  late GetPrizes getPrizes;
  late GetPrizeById getPrizeById;
  late GetPrizesCategories getPrizesCategories;
  @override
  Future init() async {
    getPrizes = await instance.getAsync();
    getPrizeById = await instance.getAsync();
    getPrizesCategories = await instance.getAsync();
  }

  @override
  Future injectModule() async {
    instance.registerLazySingletonAsync<PrizeRepository>(
      () async => PrizeRepositoryImpl(
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<GetPrizes>(
      () async => GetPrizesImpl(
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<GetPrizeById>(
      () async => GetPrizeByIdImpl(
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<GetPrizesCategories>(
      () async => GetPrizesCategoriesImpl(
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
  }
}
