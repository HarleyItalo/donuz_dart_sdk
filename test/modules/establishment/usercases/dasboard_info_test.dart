import 'dart:convert';

import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';
import 'package:donuz_dart_sdk/modules/establishment/models/dashboard_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/establisment/dashboard_json.dart';
import '../../../mocks/establishment/repositories/establishment_repository_mock.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';

void main() async {
  final establishmentRepositoryMock = EstablishmentRepositoryMock();
  final findEstablismentByIdMock = FindEstablismentByIdMock();
  final dashboardInfo = DashboardInfoImpl(
    establishmentRepositoryMock,
    findEstablismentByIdMock,
  );

  group("DashboardInfo", () {
    test("Deve retornar os dados da dashboard", () async {
      when(() => findEstablismentByIdMock.currentId())
          .thenAnswer((_) async => "2234");
      when(() => establishmentRepositoryMock.dashboardData("2234")).thenAnswer(
          (_) async => DashboardInfoModel.fromJson(jsonDecode(dashboardJson)));
      var response = await dashboardInfo();
      expect(response, isNotNull);
    });
  });
}
