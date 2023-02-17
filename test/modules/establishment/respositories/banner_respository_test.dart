import 'dart:convert';

import 'package:donuz_dart_sdk/modules/common/common_module.dart';
import 'package:donuz_dart_sdk/modules/establishment/repositories/banner_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../json/establisment/banners_json.dart';
import '../../../mocks/common/services/http_service_mock.dart';

void main() async {
  HttpService httpService = HttpServiceMock();
  SharedPreferences.setMockInitialValues({});
  StorageService storageService =
      StorageService(await SharedPreferences.getInstance());
  group("BannerRepository", () {
    test("Deve buscar todos os banners do estabelecimento", () async {
      when(() => httpService.get("estabelishments/banners", appId: "2234"))
          .thenAnswer((_) async => jsonDecode(bannerJson));
      var repository = BannerRepositoryImpl(httpService, storageService);
      var response = await repository.getBannersFromEstablishment("2234");
      expect(response, isNotNull);
      expect(response, isNotEmpty);
      expect(response?.length, 2);
    });
    test("Deve retornar uma lista vazia", () async {
      when(() => httpService.get("estabelishments/banners", appId: "2234"))
          .thenAnswer((_) async => <String, dynamic>{});
      var repository = BannerRepositoryImpl(httpService, storageService);
      var response = await repository.getBannersFromEstablishment("2234");
      expect(response, isEmpty);
    });
  });
}
