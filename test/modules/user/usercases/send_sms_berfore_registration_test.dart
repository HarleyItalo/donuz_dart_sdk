import 'package:donuz_dart_sdk/modules/user/usercases/send_sms_before_registration.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/user/repositories/user_repository_mock.dart';

void main() {
  group("SendSmsBeforeRegistration", () {
    var repository = UserRepositoryMock();
    var establishmentId = FindEstablismentByIdMock();
    var sendSmsBeforeRegistration =
        SendSmsBeforeRegistrationImpl(repository, establishmentId);
    test("Deve enviar a Sms", () async {
      when(
        () => repository.sendSmsBeforeRegistration(
            phoneNumber: "9999999999", appId: "2234"),
      ).thenAnswer((_) async => true);
      when(
        () => establishmentId.currentId(),
      ).thenAnswer((_) async => "2234");
      var response = await sendSmsBeforeRegistration(phoneNumber: "9999999999");
      expect(response, true);
    });
  });
}
