import 'dart:convert';

import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';
import 'package:donuz_dart_sdk/modules/user/user_module.dart';
import 'package:donuz_dart_sdk/modules/wallet/usercases/get_balance_by_id.dart';
import 'package:donuz_dart_sdk/modules/wallet/wallet_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../json/wallet/balance_json.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/user/user_cases/get_logged_user_token_mock.dart';
import '../../../mocks/wallet/repositories/point_respository_mock.dart';

void main() {
  final PointsRepository repositoryMock = PointsRepositoryMock();
  FindEstablishmentById findEstablismentByIdMock = FindEstablismentByIdMock();
  GetLoggedUserToken getLoggedUserToken = GetLoggedUserTokenMock();
  GetBalanceById getBalance =
      GetBalanceByIdImpl(repositoryMock, findEstablismentByIdMock);

  group("GetBalanceById", () {
    test('Deve retornar o saldo do cliente', () async {
      when(
        () => repositoryMock.getBalanceById(
          appId: '2234',
          clientId: '123',
        ),
      ).thenAnswer(
        (_) async => BalanceModel.fromJson(
          jsonDecode(balanceJson),
        ),
      );
      when(
        () => findEstablismentByIdMock.currentId(),
      ).thenAnswer(
        (_) async => "2234",
      );

      var response = await getBalance("123");
      expect(response?.saldo, isNotNull);
    });
  });
}
