import 'package:donuz_dart_sdk/modules/common/common_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../mocks/common/http_client_mock.dart';

void main() async {
  test('Inject Common Module', () async {
    var instance = GetIt.instance;
    SharedPreferences.setMockInitialValues({});
    CommomModule(
      instance,
      DonuzConfig(appId: '2234', donuzToken: '123'),
      HttpClientMock(),
    );
    var config = await instance.getAsync<BaseConfig>();
    var storageService = await instance.getAsync<StorageService>();
    var httpService = await instance.getAsync<HttpService>();
    expect(storageService, isNotNull);
    expect(httpService, isNotNull);
    expect(config.donuzToken, '123');
  });
}
