import 'dart:convert';
import 'package:donuz_dart_sdk/modules/user/user_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/user/user_notifications_json.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/user/repositories/user_repository_mock.dart';

void main() {
  group("GetUserNotifications", () {
    var findEstablishmentByIdMock = FindEstablismentByIdMock();
    var userRepositoryMock = UserRepositoryMock();
    var getUserNotifications =
        GetUserNotificationsImpl(userRepositoryMock, findEstablishmentByIdMock);
    test("Deve buscar todas as notificacoes", () async {
      when(
        () => findEstablishmentByIdMock.currentId(),
      ).thenAnswer(
        (_) async => '2234',
      );
      when(
        () => userRepositoryMock.findNotifications(
          userId: "123",
          appId: "2234",
        ),
      ).thenAnswer((_) async =>
          UserNotificationModel.fromJson(jsonDecode(userNotificationJson)));
      var response = getUserNotifications(userId: '123');
      expect(response, isNotNull);
    });
  });
}
