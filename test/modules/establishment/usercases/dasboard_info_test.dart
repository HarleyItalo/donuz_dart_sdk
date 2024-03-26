import 'dart:convert';

import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';
import 'package:donuz_dart_sdk/modules/establishment/models/dashboard_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/establisment/dashboard_json.dart';
import '../../../mocks/establishment/repositories/establishment_repository_mock.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';

void main() async {
  final establishmentRepositoryMock = EstablishmentRepositoryMock();
  final findEstablismentByIdMock = FindEstablismentByIdMock();
  final dashboardStatistics = DashboardStatisticsImpl(
    establishmentRepositoryMock,
    findEstablismentByIdMock,
  );

  group("DashboardStatistics", () {
    test("Deve retornar os dados da dashboard", () async {
      when(() => findEstablismentByIdMock.currentId())
          .thenAnswer((_) async => "2234");
      when(() => establishmentRepositoryMock.dashboardData("2234")).thenAnswer(
          (_) async => DashboardModel.fromJson(jsonDecode(dashboardJson)));
      var response = await dashboardStatistics();
      expect(response, isNotNull);
    });
  });
}
