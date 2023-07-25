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
  group("UpdateUser", () {
    var findEstablishmentByIdMock = FindEstablismentByIdMock();
    var userRepositoryMock = UserRepositoryMock();
    var getLoggedUserTokenMock = GetLoggedUserTokenMock();

    var updateUser = UpdateUserImpl(
        userRepositoryMock, findEstablishmentByIdMock, getLoggedUserTokenMock);
    test("Deve atualizar um usuario", () async {
      var userData = UserModel.fromJson(jsonDecode(userDataJson));
      userData.client?.senha = "123";
      userData.client?.camposAdicionais?.texto['865'] = 'teste';

      when(
        () => findEstablishmentByIdMock.currentId(),
      ).thenAnswer(
        (_) async => '2234',
      );
      when(() => getLoggedUserTokenMock()).thenAnswer((_) async => "123");
      when(
        () => userRepositoryMock.updateUser(
            user: userData.client!, appId: "2234", tokenClient: '123'),
      ).thenAnswer((_) async => BaseResponseDonuzModel(
          status: 201, mensagem: "Requisicao finalizada com sucesso"));

      var response = await updateUser(
        user: userData.client!,
      );
      expect(response, isNotNull);
      expect(userData.client?.camposAdicionais?.texto['865'], 'teste');
    });
    test("Deve falhar ao atualizar um usuario", () async {
      var userData = UserModel.fromJson(jsonDecode(userDataJson));
      userData.client?.senha = "123";

      when(
        () => findEstablishmentByIdMock.currentId(),
      ).thenAnswer(
        (_) async => null,
      );
      when(() => getLoggedUserTokenMock()).thenAnswer((_) async => "123");
      when(
        () => userRepositoryMock.updateUser(
            user: userData.client!, appId: "2234", tokenClient: '123'),
      ).thenAnswer((_) async => BaseResponseDonuzModel(
          status: 201, mensagem: "Requisicao finalizada com sucesso"));

      var response = await updateUser(
        user: userData.client!,
      );
      expect(response, isNotNull);
      expect(response.status, 500);
    });
  });
}
