//constants
export 'constants/establishiment_constants.dart';
// models
export 'models/banners_model.dart';
export 'models/regulation_model.dart';
export 'models/establishment_model.dart';
export 'models/settings_model.dart';
// repositories
export 'repositories/banner_repository.dart';
export 'repositories/establishment_repository.dart';
export 'repositories/regulation_repository.dart';
export 'repositories/settings_repository.dart';
// user cases
export 'usercases/find_establishment_by_id.dart';
export 'usercases/find_establishment_banners.dart';
export 'usercases/get_regulation.dart';
export 'usercases/search_by_location.dart';
export 'usercases/search_by_name.dart';
export 'usercases/search_my_locales.dart';

import 'package:donuz_dart_sdk/modules/base_module.dart';
import 'establishment_module.dart';

class EstablismentModule extends BaseModule {
  EstablismentModule(instance) : super(instance: instance);

  @override
  void injectModule() {
    instance.registerLazySingletonAsync<EstablishimentRepository>(
      () async => EstablishimentRepositoryImpl(
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<RegulationRepository>(
      () async => RegulationRepositoryImpl(
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<SettingsRepository>(
      () async => SettingsRepositoryImpl(
        await instance.getAsync(),
      ),
    );
  }
}
