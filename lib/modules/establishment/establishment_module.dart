//constants
export 'constants/establishiment_constants.dart';
// models
export 'models/banners_model.dart';
export 'models/regulation_model.dart';
export 'models/establishment_model.dart';
export 'models/settings_model.dart';
export 'models/branchs_model.dart';
export 'models/admin_model.dart';
// repositories
export 'repositories/banner_repository.dart';
export 'repositories/establishment_repository.dart';
export 'repositories/regulation_repository.dart';
export 'repositories/settings_repository.dart';
export 'repositories/branch_repository.dart';
// user cases
export 'usercases/find_establishment_by_id.dart';
export 'usercases/find_establishment_banners.dart';
export 'usercases/get_regulation.dart';
export 'usercases/search_by_location.dart';
export 'usercases/search_by_name.dart';
export 'usercases/search_my_locales.dart';
export 'usercases/get_establishment_settings.dart';
export 'usercases/search_by_slug.dart';
export 'usercases/get_branchs.dart';
export 'usercases/establishment_login.dart';
export 'usercases/dashboard_statistics.dart';

import 'package:donuz_dart_sdk/modules/base_module.dart';
import 'package:donuz_dart_sdk/modules/establishment/usercases/get_custom_config.dart';
import 'package:donuz_dart_sdk/modules/establishment/usercases/locate_branch_with_code.dart';
import 'package:donuz_dart_sdk/modules/establishment/usercases/set_custom_config.dart';
import 'establishment_module.dart';

class EstablismentModule extends BaseModule {
  late FindEstablishmentById findEstablishmentById;
  late FindEstablishmentBanners findEstablishmentBanners;
  late GetEstablishmentSettings getEstablishmentSettings;
  late SearchByLocation searchByLocation;
  late GetRegulation getRegulation;
  late SearchByName searchByName;
  late SearchMyLocales searchMyLocales;
  late SearchBySlug searchBySlug;
  late GetBranchs findBranchs;
  late EstablismentLogin login;
  late DashboardStatistics dashboardStatistics;
  late LocateBranchWithCode locateBranchWithCode;
  late SetCustomConfig setCustomConfig;
  late GetCustomConfig getCustomConfig;

  EstablismentModule({required super.instance});

  @override
  Future injectModule() async {
    instance.registerLazySingletonAsync<EstablishimentRepository>(
      () async => EstablishimentRepositoryImpl(
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<BannerRepository>(
      () async => BannerRepositoryImpl(
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
    instance.registerLazySingletonAsync<BranchRepository>(
      () async => BranchRepositoryImpl(
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<FindEstablishmentById>(
      () async => FindEstablishmentByIdImpl(
        await instance.getAsync(),
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<FindEstablishmentBanners>(
      () async => FindEstablishmentBannersImpl(
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<GetEstablishmentSettings>(
      () async => GetEstablishmentSettingsImpl(
        await instance.getAsync(),
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<GetRegulation>(
      () async => GetRegulationImpl(
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<SearchByLocation>(
      () async => SearchByLocationImpl(
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<SearchByName>(
      () async => SearchByNameImpl(
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<SearchMyLocales>(
      () async => SearchMyLocalesImpl(
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<SearchBySlug>(
      () async => SearchBySlugImpl(
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<GetBranchs>(
      () async => GetBranchsImpl(
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<EstablismentLogin>(
      () async => EstablismentLoginImpl(
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<DashboardStatistics>(
      () async => DashboardStatisticsImpl(
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<LocateBranchWithCode>(
      () async => LocateBranchWithCodeImpl(
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<GetCustomConfig>(
      () async => GetCustomConfigImpl(
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<SetCustomConfig>(
      () async => SetCustomConfigImpl(
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
  }

  @override
  Future init() async {
    findEstablishmentById = await instance.getAsync();
    findEstablishmentBanners = await instance.getAsync();
    getEstablishmentSettings = await instance.getAsync();
    searchByLocation = await instance.getAsync();
    searchByName = await instance.getAsync();
    getRegulation = await instance.getAsync();
    searchMyLocales = await instance.getAsync();
    searchBySlug = await instance.getAsync();
    findBranchs = await instance.getAsync();
    login = await instance.getAsync();
    dashboardStatistics = await instance.getAsync();
    locateBranchWithCode = await instance.getAsync();
    getCustomConfig = await instance.getAsync();
    setCustomConfig = await instance.getAsync();
  }
}
