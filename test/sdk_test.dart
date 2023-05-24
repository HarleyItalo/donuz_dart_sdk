import 'package:donuz_dart_sdk/donuz_dart_sdk.dart';
import 'package:donuz_dart_sdk/modules/common/common_module.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mocks/common/http_client_mock.dart';

void main() {
  test('Deve retornar o SDK pronto para o uso', () async {
    SharedPreferences.setMockInitialValues({});
    WidgetsFlutterBinding.ensureInitialized();
    var sdk = DonuzSDK(
      config: DonuzConfig(appId: '2234', donuzToken: '123'),
      client: HttpClientMock(),
    );
    await sdk.init();

    expect(sdk.establisment, isNotNull);
    expect(sdk.establisment.findEstablishmentById, isNotNull);
  });
  test('Deve retornar o SDK pronto para o uso', () async {
    SharedPreferences.setMockInitialValues({});
    WidgetsFlutterBinding.ensureInitialized();
    GetIt.instance.reset(dispose: false);
    var sdk = DonuzSDK(
      config: DonuzConfig(appId: '2234', donuzToken: '123'),
    );
    await sdk.init();

    expect(sdk.establisment, isNotNull);
    expect(sdk.establisment.findEstablishmentById, isNotNull);
  });
}
