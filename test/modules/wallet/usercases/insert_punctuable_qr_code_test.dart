import 'package:donuz_dart_sdk/modules/common/common_module.dart';
import 'package:donuz_dart_sdk/modules/establishment/usercases/find_establishment_by_id.dart';
import 'package:donuz_dart_sdk/modules/user/usercases/get_logged_user_token.dart';
import 'package:donuz_dart_sdk/modules/wallet/wallet_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/user/user_cases/get_logged_user_token_mock.dart';
import '../../../mocks/wallet/repositories/point_respository_mock.dart';

void main() {
  final PointsRepository repositoryMock = PointsRepositoryMock();
  final FindEstablishmentById findEstablismentByIdMock =
      FindEstablismentByIdMock();
  final GetLoggedUserToken getLoggedUserTokenMock = GetLoggedUserTokenMock();
  final InsertPunctuableQrCode insertPunctuableQRCode =
      InsertPunctuableQrCodeImpl(
          repositoryMock, findEstablismentByIdMock, getLoggedUserTokenMock);
  group('InsertPunctuableQrCode', () {
    test('Deve inserir um qr code pontuavel', () async {
      when(
        () => findEstablismentByIdMock.currentId(),
      ).thenAnswer(
        (_) async => "2234",
      );
      when(
        () => getLoggedUserTokenMock(),
      ).thenAnswer(
        (_) async => "123",
      );
      when(
        () => repositoryMock.validadeQrCode(
            code: '123', tokenClient: '123', appId: '2234'),
      ).thenAnswer((invocation) async => BaseResponseDonuzModel(
          status: 200, mensagem: 'Requisicao finalizada com sucesso'));

      var response = await insertPunctuableQRCode(
        code: '123',
      );
      expect(response?.status, 200);
    });
  });
}
