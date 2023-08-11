import 'dart:convert';
import 'dart:io';
import 'package:donuz_dart_sdk/modules/user/user_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/default_response_json.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/user/repositories/user_repository_mock.dart';
import '../../../mocks/user/user_cases/get_logged_user_token_mock.dart';

void main() {
  group("UploadUserPhoto", () {
    var findEstablishmentByIdMock = FindEstablismentByIdMock();
    var userRepositoryMock = UserRepositoryMock();
    var getLoggedUserTokenMock = GetLoggedUserTokenMock();

    var uploadUserPhoto = UploadUserPhotoImpl(
        userRepositoryMock, findEstablishmentByIdMock, getLoggedUserTokenMock);
    test("Deve atualizar fazer o upload de uma foto", () async {
      var file = File('assets/files/test.png');
      when(
        () => findEstablishmentByIdMock.currentId(),
      ).thenAnswer(
        (_) async => '2234',
      );
      when(() => getLoggedUserTokenMock()).thenAnswer((_) async => "123");
      when(
        () => userRepositoryMock.uploadImage(
            image: file, appId: "2234", tokenClient: '123'),
      ).thenAnswer((_) async =>
          UploadUserImageModel.fromJson(jsonDecode(defaultResponseJson)));

      var response = await uploadUserPhoto(image: file);
      expect(response, isNotNull);
      expect(response?.status, 200);
    });
  });
}
