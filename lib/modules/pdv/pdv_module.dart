import 'package:donuz_dart_sdk/modules/base_module.dart';
import 'package:donuz_dart_sdk/modules/pdv/pdv_module.dart';

export 'usercases/get_pdv_settings.dart';
export 'models/pdv_settings_model.dart';
export 'repositories/pdv_settings_repository.dart';

class PdvModule extends BaseModule {
  PdvModule({required super.instance});

  late GetPdvSettings pdvSettings;
  @override
  Future init() async {
    pdvSettings = await instance.getAsync();
  }

  @override
  Future injectModule() async {
    instance.registerLazySingletonAsync<PdvSettingsRepository>(
      () async => PdvSettingsRepositoryImpl(
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<GetPdvSettings>(
      () async => GetPdvSettingsImpl(
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
  }
}
