import 'dart:convert';
import 'package:donuz_dart_sdk/modules/common/common_module.dart';
import 'package:donuz_dart_sdk/modules/establishment/usercases/find_establishment_by_id.dart';
import 'package:donuz_dart_sdk/modules/user/models/user_model.dart';
import 'package:donuz_dart_sdk/modules/user/usercases/get_user.dart';
import 'package:donuz_dart_sdk/modules/wallet/wallet_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/user/user_data_json.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/user/user_cases/get_user_mock.dart';
import '../../../mocks/wallet/repositories/point_respository_mock.dart';

void main() {
  final PointsRepository repositoryMock = PointsRepositoryMock();
  final FindEstablishmentById findEstablismentByIdMock =
      FindEstablismentByIdMock();
  final GetUser getUserMock = GetUserMock();
  final Transfer transfer =
      TransferImpl(repositoryMock, findEstablismentByIdMock, getUserMock);
  group('Transfer', () {
    test('Deve Transferir uma pontuacao', () async {
      when(
        () => findEstablismentByIdMock.currentId(),
      ).thenAnswer(
        (_) async => "2234",
      );
      when(
        () => getUserMock(),
      ).thenAnswer((_) async {
        var response = UserModel.fromJson(
          jsonDecode(userDataJson),
        );
        return response.client;
      });
      when(
        () => repositoryMock.transfer(
          source: '12345678909',
          destination: '0123456789',
          value: 10,
          appId: '2234',
        ),
      ).thenAnswer((invocation) async => BaseResponseDonuzModel(
          status: 200, mensagem: 'Requisicao finalizada com sucesso'));

      var response = await transfer(
        destination: '0123456789',
        value: 10,
      );
      expect(response?.status, 200);
    });
  });
}
