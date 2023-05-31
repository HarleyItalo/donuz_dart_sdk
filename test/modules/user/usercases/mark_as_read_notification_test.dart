import 'package:donuz_dart_sdk/modules/user/user_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/user/repositories/user_repository_mock.dart';

void main() {
  group("MarkAsReadNotification", () {
    var findEstablishmentByIdMock = FindEstablismentByIdMock();
    var userRepositoryMock = UserRepositoryMock();
    var markAsReadNotification = MarkAsReadNotificationImpl(
        userRepositoryMock, findEstablishmentByIdMock);
    test("Deve marcar uma notificacao como lida", () async {
      when(
        () => findEstablishmentByIdMock.currentId(),
      ).thenAnswer(
        (_) async => '2234',
      );
      when(
        () => userRepositoryMock.markAsReadNotification(
          notificationId: "123",
          appId: "2234",
        ),
      ).thenAnswer((_) async => true);
      var response = markAsReadNotification(notificationId: "123");
      expect(response, isNotNull);
    });
  });
}
