import 'dart:convert';
import 'package:donuz_dart_sdk/modules/common/models/base_response_donuz_model.dart';
import 'package:donuz_dart_sdk/modules/user/user_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/user/user_data_json.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/user/repositories/user_repository_mock.dart';
import '../../../mocks/user/user_cases/get_logged_user_token_mock.dart';

void main() {
  group("DeleteUser", () {
    var findEstablishmentByIdMock = FindEstablismentByIdMock();
    var userRepositoryMock = UserRepositoryMock();
    var getLoggedUserTokenMock = GetLoggedUserTokenMock();

    var deleteUser = DeleteUserImpl(
        userRepositoryMock, findEstablishmentByIdMock, getLoggedUserTokenMock);
    test("Deve remover um usuario", () async {
      var userData = UserModel.fromJson(jsonDecode(userDataJson));
      userData.client?.senha = "123";

      when(
        () => findEstablishmentByIdMock.currentId(),
      ).thenAnswer(
        (_) async => '2234',
      );
      when(() => getLoggedUserTokenMock()).thenAnswer((_) async => "123");
      when(
        () => userRepositoryMock.deleteUser(
            userId: "1992410", appId: "2234", token: '123'),
      ).thenAnswer((_) async => BaseResponseDonuzModel(
          status: 201, mensagem: "Requisicao finalizada com sucesso"));

      var response = await deleteUser(
        user: userData.client!,
      );
      expect(response, isNotNull);
    });
    test("Deve falhar ao remover  um usuario", () async {
      var userData = UserModel.fromJson(jsonDecode(userDataJson));
      userData.client?.senha = "123";

      when(
        () => findEstablishmentByIdMock.currentId(),
      ).thenAnswer(
        (_) async => null,
      );
      when(() => getLoggedUserTokenMock()).thenAnswer((_) async => "123");
      when(
        () => userRepositoryMock.deleteUser(
            userId: "1992410", appId: "2234", token: '123'),
      ).thenAnswer((_) async => BaseResponseDonuzModel(
          status: 201, mensagem: "Requisicao finalizada com sucesso"));

      var response = await deleteUser(
        user: userData.client!,
      );
      expect(response, isA<BaseResponseDonuzModel>());
      expect(response.status, 500);
    });
    test("Deve falhar ao remover  um usuario", () async {
      var userData = UserModel.fromJson(jsonDecode(userDataJson));
      userData.client?.senha = "123";

      when(
        () => findEstablishmentByIdMock.currentId(),
      ).thenAnswer(
        (_) async => "2234",
      );
      when(() => getLoggedUserTokenMock()).thenAnswer((_) async => null);
      when(
        () => userRepositoryMock.deleteUser(
            userId: "1992410", appId: "2234", token: '123'),
      ).thenAnswer((_) async => BaseResponseDonuzModel(
          status: 201, mensagem: "Requisicao finalizada com sucesso"));

      var response = await deleteUser(
        user: userData.client!,
      );
      expect(response, isA<BaseResponseDonuzModel>());
      expect(response.status, 500);
    });
  });
}
