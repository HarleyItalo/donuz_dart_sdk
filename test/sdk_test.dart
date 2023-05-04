import 'package:donuz_dart_sdk/donuz_dart_sdk.dart';
import 'package:donuz_dart_sdk/modules/common/config/config.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/common/http_client_mock.dart';

void main() {
  test('Deve retornar um servico', () {
    var sdk = DonuzSDK(
      config: DonuzConfig(appId: '2234', donuzToken: '123'),
      client: HttpClientMock(),
    );

    expect(sdk.establismentModule, isNotNull);
  });
}
