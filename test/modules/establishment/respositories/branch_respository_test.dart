import 'dart:convert';
import 'package:donuz_dart_sdk/modules/common/common_module.dart';
import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/establisment/branch_json.dart';
import '../../../mocks/common/services/http_service_mock.dart';

void main() async {
  HttpService httpService = HttpServiceMock();
  group("BranchRepository", () {
    test("Deve buscar todos as filiais do estabelecimento", () async {
      when(() => httpService.get("estabelishment/branchs", appId: "2234"))
          .thenAnswer((_) async => jsonDecode(branchJson));
      var repository = BranchRepositoryImpl(httpService);
      var response = await repository.getBranchs("2234");
      expect(response, isNotNull);
      expect(response, isNotEmpty);
    });
  });
}
