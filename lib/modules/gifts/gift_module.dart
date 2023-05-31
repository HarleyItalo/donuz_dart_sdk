import 'package:donuz_dart_sdk/modules/base_module.dart';
import 'gift_module.dart';
//models
export 'models/gifts_model.dart';
// repositories
export 'repositories/gift_repository.dart';
// usercases
export 'usercases/find_gifts.dart';

class GiftModule extends BaseModule {
  GiftModule({required super.instance});

  late FindGifts findGifts;

  @override
  Future init() async {
    findGifts = await instance.getAsync();
  }

  @override
  Future injectModule() async {
    instance.registerLazySingletonAsync<GiftsRepository>(
      () async => GiftsRepositoryImpl(
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<FindGifts>(
      () async => FindGiftsImpl(
        await instance.getAsync(),
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
  }
}
