import 'package:donuz_dart_sdk/modules/common/services/storage_service.dart';
import 'package:donuz_dart_sdk/modules/login/repositories/login_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../mocks/common/services/http_service_mock.dart';

void main() async {
  final httpService = HttpServiceMock();
  SharedPreferences.setMockInitialValues({});
  final storageService = StorageService(await SharedPreferences.getInstance());
  final LoginRepository loginRepository =
      LoginRepositoryImpl(httpService, storageService);

  group("LoginRepository", () {
    test("Deve fazer o login", () async {});
  });
}
