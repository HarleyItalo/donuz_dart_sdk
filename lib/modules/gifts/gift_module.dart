import 'package:donuz_dart_sdk/modules/base_module.dart';
import 'package:donuz_dart_sdk/modules/gifts/usercases/change_gift_status.dart';
import 'package:donuz_dart_sdk/modules/gifts/usercases/get_gift_by_id.dart';
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
  late ChangeGiftStatus changeGiftStatus;
  late GetGiftById getGiftById;

  @override
  Future init() async {
    findGifts = await instance.getAsync();
    changeGiftStatus = await instance.getAsync();
    getGiftById = await instance.getAsync();
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
    instance.registerSingletonAsync<ChangeGiftStatus>(
      () async => ChangeGiftStatusImpl(
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerSingletonAsync<GetGiftById>(
      () async => GetGiftByIdImpl(
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
  }
}
