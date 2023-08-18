import 'dart:convert';
import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/establisment/branch_json.dart';
import '../../../mocks/establishment/repositories/branchs_repository_mock.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';

void main() async {
  final branchRepositoryMock = BranchRepositoryMock();
  final findEstablismentByIdMock = FindEstablismentByIdMock();
  final getBranchs =
      GetBranchsImpl(branchRepositoryMock, findEstablismentByIdMock);

  group("FindEstablismnetBanners", () {
    test("Deve Buscar todos as filiais de um estabelecimento", () async {
      when(() => branchRepositoryMock.getBranchs("2234")).thenAnswer(
          (_) async => BranchModel.fromJson(jsonDecode(branchJson)).filiais);
      when(() => findEstablismentByIdMock.currentId())
          .thenAnswer((_) async => "2234");

      var response = await getBranchs();
      expect(response, isNotNull);
      expect(response, isNotEmpty);
    });
    test(
        "Deve retornar uma lista vazia de filiais quando o estabelecimento for nulo",
        () async {
      when(() => findEstablismentByIdMock.currentId())
          .thenAnswer((_) async => null);

      var response = await getBranchs();
      expect(response, isEmpty);
    });
    test(
        "Deve retornar uma lista vazia caso o estabelecimento não tenha banners",
        () async {
      when(() => findEstablismentByIdMock.currentId())
          .thenAnswer((_) async => "2234");

      when(() => branchRepositoryMock.getBranchs("2234"))
          .thenAnswer((_) async => null);

      var response = await getBranchs();
      expect(response, isEmpty);
    });
  });
}
