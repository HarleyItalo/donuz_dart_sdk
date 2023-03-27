import 'dart:convert';

import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';
import 'package:donuz_dart_sdk/modules/user/user_module.dart';
import 'package:donuz_dart_sdk/modules/wallet/wallet_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../json/wallet/extract_json.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/user/user_cases/get_logged_user_token_mock.dart';
import '../../../mocks/wallet/repositories/point_respository_mock.dart';

void main() {
  final PointsRepository repositoryMock = PointsRepositoryMock();
  final FindEstablishmentById findEstablismentByIdMock =
      FindEstablismentByIdMock();
  final GetLoggedUserToken getLoggedUserToken = GetLoggedUserTokenMock();

  GetPointExtract getPointExtract = GetPointExtractImpl(
      repositoryMock, findEstablismentByIdMock, getLoggedUserToken);

  group('GetExtract', () {
    test("Deve retornar o extrato do cliente", () async {
      when(
        () => repositoryMock.getPoints(
          appId: '2234',
          tokenClient: '123',
        ),
      ).thenAnswer(
        (_) async => PointsModel.fromJson(
          jsonDecode(extractJson),
        ),
      );
      when(
        () => findEstablismentByIdMock.currentId(),
      ).thenAnswer(
        (_) async => "2234",
      );
      when(
        () => getLoggedUserToken(),
      ).thenAnswer(
        (_) async => "123",
      );
      var response = await getPointExtract();
      expect(response?.pontos, isNotEmpty);
    });
  });
}
