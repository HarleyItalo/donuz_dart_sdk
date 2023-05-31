import 'package:donuz_dart_sdk/modules/user/user_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/user/repositories/user_repository_mock.dart';
import '../../../mocks/user/user_cases/get_logged_user_token_mock.dart';

void main() {
  group("UpdateNotificationToken", () {
    var findEstablishmentByIdMock = FindEstablismentByIdMock();
    var userRepositoryMock = UserRepositoryMock();
    var getLoggedUserTokenMock = GetLoggedUserTokenMock();
    var updateNotificationToken = UpdateNotificationTokenImpl(
        userRepositoryMock, findEstablishmentByIdMock, getLoggedUserTokenMock);
    test("Deve marcar uma notificacao como lida", () async {
      when(
        () => findEstablishmentByIdMock.currentId(),
      ).thenAnswer(
        (_) async => '2234',
      );
      when(
        () => getLoggedUserTokenMock(),
      ).thenAnswer(
        (_) async => "123",
      );
      when(
        () => userRepositoryMock.updateNotificationToken(
          playerId: "123",
          appId: "2234",
          tokenClient: '123',
        ),
      ).thenAnswer((_) async => true);
      var response = updateNotificationToken(playerId: "123");
      expect(response, isNotNull);
    });
  });
}
