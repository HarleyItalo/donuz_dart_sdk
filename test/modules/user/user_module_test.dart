import 'package:donuz_dart_sdk/modules/common/common_module.dart';
import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';
import 'package:donuz_dart_sdk/modules/user/user_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../mocks/common/http_client_mock.dart';

void main() async {
  test('Inject userModule Module', () async {
    var instance = GetIt.instance;
    SharedPreferences.setMockInitialValues({});
    CommomModule(
      instance,
      DonuzConfig(appId: '2234', donuzToken: '123'),
      HttpClientMock(),
    );
    var userModule = UserModule(instance: instance);
    userModule.init();
    await EstablismentModule(instance: instance).init();

    expect(userModule.deleteUser, isNotNull);
  });
}
