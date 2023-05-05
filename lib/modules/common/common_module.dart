// configs
import 'package:donuz_dart_sdk/modules/base_module.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
export 'config/config.dart';
export 'package:http/http.dart';
// models
export 'models/location_coordinates_model.dart';
export 'models/base_response_donuz_model.dart';

// services
export 'services/storage_service.dart';
export 'services/http_service.dart';

//utils
export 'utils/string_util.dart';
export 'package:get_it/get_it.dart';
import 'common_module.dart';

class CommomModule extends BaseModule {
  CommomModule(instance, this.config, this.client) : super(instance: instance);
  final BaseConfig config;
  final http.Client client;

  @override
  Future injectModule() async {
    instance.registerLazySingletonAsync<HttpService>(
      () async => HttpService(client, config),
    );
    instance.registerLazySingletonAsync<StorageService>(
      () async => StorageService(
        await SharedPreferences.getInstance(),
      ),
    );
    instance.registerLazySingletonAsync<BaseConfig>(() async => config);
  }

  @override
  Future init() async {}
}
