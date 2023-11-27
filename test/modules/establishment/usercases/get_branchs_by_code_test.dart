import 'dart:convert';
import 'package:donuz_dart_sdk/modules/establishment/models/branch_user_model.dart';
import 'package:donuz_dart_sdk/modules/establishment/usercases/locate_branch_with_code.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/establisment/branch_info_json.dart';
import '../../../mocks/establishment/repositories/branchs_repository_mock.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';

void main() async {
  final branchRepositoryMock = BranchRepositoryMock();
  final findEstablismentByIdMock = FindEstablismentByIdMock();
  final locateBranchWithCode =
      LocateBranchWithCodeImpl(branchRepositoryMock, findEstablismentByIdMock);

  group("LocateBranchWithCodeImpl", () {
    test("Deve retornar uma filial", () async {
      when(() => findEstablismentByIdMock.currentId())
          .thenAnswer((_) async => "2234");

      when(() =>
          branchRepositoryMock.locateBranchWithCode(
              code: "123", appId: "2234")).thenAnswer(
          (_) async => BranchUserModel.fromJson(jsonDecode(branchInfoJson)));

      var response = await locateBranchWithCode("123");
      expect(response, isA<UsuarioFilial>());
    });
  });
}
