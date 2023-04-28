import 'dart:convert';
import 'package:donuz_dart_sdk/modules/common/models/base_response_donuz_model.dart';
import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';
import 'package:donuz_dart_sdk/modules/wallet/wallet_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/default_response_json.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/wallet/repositories/point_respository_mock.dart';

void main() {
  final PointsRepository repositoryMock = PointsRepositoryMock();
  final FindEstablishmentById findEstablismentByIdMock =
      FindEstablismentByIdMock();

  InsertPoint insertPoint =
      InsertPointImpl(repositoryMock, findEstablismentByIdMock);

  group('Insert point', () {
    test("Deve retornar inserir um ponto", () async {
      when(
        () => repositoryMock.insertPoint(
            appId: '2234',
            userIdentification: '12345678909',
            description: 'Teste Insercao',
            value: 10.0),
      ).thenAnswer(
        (_) async => BaseResponseDonuzModel.fromJson(
          jsonDecode(defaultResponseJson),
        ),
      );
      when(
        () => findEstablismentByIdMock.currentId(),
      ).thenAnswer(
        (_) async => "2234",
      );

      var response = await insertPoint(
          userIdentification: '12345678909',
          description: 'Teste Insercao',
          value: 10.0);
      expect(response.status, 200);
    });

    test(
        "Deve falhar ao inserir um ponto caso nenhum estabelecimento esteja setado.",
        () async {
      when(
        () => findEstablismentByIdMock.currentId(),
      ).thenAnswer(
        (_) async => null,
      );

      var response = await insertPoint(
          userIdentification: '12345678909',
          description: 'Teste Insercao',
          value: 10.0);
      expect(response.status, 403);
    });
  });
}
