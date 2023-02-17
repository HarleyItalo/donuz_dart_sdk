import 'dart:convert';

import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../json/establisment/banners_json.dart';
import '../../../mocks/establishment/repositories/banner_repositoy_mock.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';

void main() async {
  final bannerRepositoryMock = BannerRepositoryMock();
  final findEstablismentByIdMock = FindEstablismentByIdMock();
  final findEstablishmentBanners = FindEstablishmentBannersImpl(
      bannerRepositoryMock, findEstablismentByIdMock);

  group("FindEstablismnetBanners", () {
    test("Deve Buscar todos os banners de um estabelecimento", () async {
      when(() => bannerRepositoryMock.getBannersFromEstablishment("2234"))
          .thenAnswer((_) async =>
              BannerModel.fromJson(jsonDecode(bannerJson)).banners);
      when(() => findEstablismentByIdMock.currentId())
          .thenAnswer((_) async => "2234");

      var response = await findEstablishmentBanners();
      expect(response, isNotNull);
      expect(response, isNotEmpty);
    });
    test(
        "Deve retornar uma lista vazia de banners quando o estabelecimento for nulo",
        () async {
      when(() => findEstablismentByIdMock.currentId())
          .thenAnswer((_) async => null);

      var response = await findEstablishmentBanners();
      expect(response, isEmpty);
    });
    test(
        "Deve retornar uma lista vazia caso o estabelecimento não tenha banners",
        () async {
      when(() => findEstablismentByIdMock.currentId())
          .thenAnswer((_) async => "2234");

      when(() => bannerRepositoryMock.getBannersFromEstablishment("2234"))
          .thenAnswer((_) async => null);

      var response = await findEstablishmentBanners();
      expect(response, isEmpty);
    });
  });
}
