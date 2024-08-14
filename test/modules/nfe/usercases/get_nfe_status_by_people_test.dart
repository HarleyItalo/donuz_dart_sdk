import 'dart:convert';
import 'package:donuz_dart_sdk/modules/nfe/models/nfe_status_result_model.dart';
import 'package:donuz_dart_sdk/modules/nfe/usercases/get_nfe_status_by_people.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/nfe/get_nfe_status_json.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/nfe/nfe_repository_mock.dart';

void main() {
  var repository = NfeRepositoryMock();
  var findEstablishmentByIdMock = FindEstablismentByIdMock();

  var getNfeStatusByPeople =
      GetNfeStatusByPeopleImpl(repository, findEstablishmentByIdMock);

  group("GetNfeStatusByPeople", () {
    test("Deve retornar as nfe do usuario", () async {
      when(
        () => findEstablishmentByIdMock.currentId(),
      ).thenAnswer(
        (_) async => '2234',
      );
      when(
        () => repository.getNfeActionResult(
            cpf: '12345678909', establismentId: '2234'),
      ).thenAnswer((_) async =>
          NfeStatusResultModel.fromJson(jsonDecode(getNfeStatusJson)));

      var response = await getNfeStatusByPeople(
        cpf: '12345678909',
      );
      expect(response, isNotNull);
    });
    test("Deve retornar as nfe do usuario", () async {
      when(
        () => findEstablishmentByIdMock.currentId(),
      ).thenAnswer(
        (_) async => null,
      );
      when(
        () => repository.getNfeActionResult(
            cpf: '12345678909', establismentId: '2234'),
      ).thenAnswer((_) async =>
          NfeStatusResultModel.fromJson(jsonDecode(getNfeStatusJson)));

      var response = await getNfeStatusByPeople(
        cpf: '12345678909',
      );

      expect(response, isNotNull);
    });
  });
}
