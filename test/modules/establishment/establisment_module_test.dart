import 'package:donuz_dart_sdk/modules/common/common_module.dart';
import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../mocks/common/http_client_mock.dart';

void main() async {
  test('Inject Establisment Module', () async {
    var instance = GetIt.instance;
    SharedPreferences.setMockInitialValues({});
    CommomModule(
      instance,
      DonuzConfig(appId: '2234', donuzToken: '123'),
      HttpClientMock(),
    );
    EstablismentModule(instance);
    var establishimentRepository =
        await instance.getAsync<EstablishimentRepository>();
    expect(establishimentRepository, isNotNull);
    var regulationRepository = await instance.getAsync<RegulationRepository>();
    expect(regulationRepository, isNotNull);
    var settingsRepository = await instance.getAsync<SettingsRepository>();
    expect(settingsRepository, isNotNull);
  });
}
