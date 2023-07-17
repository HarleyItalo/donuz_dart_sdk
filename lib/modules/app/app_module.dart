import 'package:donuz_dart_sdk/modules/app/repositories/app_config_repository.dart';
import 'package:donuz_dart_sdk/modules/app/usercases/find_app_config.dart';
import 'package:donuz_dart_sdk/modules/base_module.dart';

export 'models/app_config_model.dart';
export 'repositories/app_config_repository.dart';
export 'usercases/find_app_config.dart';

class AppModule extends BaseModule {
  AppModule({required super.instance});

  late FindAppConfig findAppConfig;

  @override
  Future init() async {
    findAppConfig = await instance.getAsync();
  }

  @override
  Future injectModule() async {
    instance.registerLazySingletonAsync<AppConfigRepository>(
      () async => AppConfigRepositoryImpl(
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<FindAppConfig>(
      () async => FindAppConfigImpl(
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
  }
}
