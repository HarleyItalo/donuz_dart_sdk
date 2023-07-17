import 'package:donuz_dart_sdk/modules/app/models/app_config_model.dart';
import '../../common/common_module.dart';

abstract class AppConfigRepository {
  Future<AppConfigModel> findAppConfig({
    required String appId,
  });
}

class AppConfigRepositoryImpl extends AppConfigRepository {
  final HttpService httpService;

  AppConfigRepositoryImpl(this.httpService);

  @override
  Future<AppConfigModel> findAppConfig({
    required String appId,
  }) async {
    var response = await httpService.get(
      "app/config",
      appId: appId,
    );
    return AppConfigModel.fromJson(response);
  }
}
