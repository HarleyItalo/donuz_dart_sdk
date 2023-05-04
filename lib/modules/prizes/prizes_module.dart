//models
import 'package:donuz_dart_sdk/modules/base_module.dart';
import 'package:donuz_dart_sdk/modules/prizes/prizes_module.dart';

export 'models/prize_model.dart';
//repositories
export 'repositories/prize_repository.dart';
// usercases
export 'usercases/get_prizes.dart';

class PrizeModule extends BaseModule {
  PrizeModule({required super.instance});

  late GetPrizes getPrizes;
  @override
  Future init() async {
    getPrizes = await instance.getAsync<GetPrizes>();
  }

  @override
  Future injectModule() async {
    instance.registerLazySingletonAsync<GetPrizes>(
      () async => GetPrizesImpl(
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<PrizeRepository>(
      () async => PrizeRepositoryImpl(
        await instance.getAsync(),
      ),
    );
  }
}
