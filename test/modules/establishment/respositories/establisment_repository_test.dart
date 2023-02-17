import 'dart:convert';
import 'package:donuz_dart_sdk/modules/common/common_module.dart';
import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../json/establisment/establishment_by_name_json.dart';
import '../../../json/establisment/establishment_json.dart';
import '../../../json/establisment/establishments_json.dart';
import '../../../mocks/common/services/http_service_mock.dart';

void main() async {
  final httpService = HttpServiceMock();
  SharedPreferences.setMockInitialValues({});
  final storageService = StorageService(await SharedPreferences.getInstance());

  EstablishimentRepository repository =
      EstablishimentRepositoryImpl(httpService, storageService);
  group("EstablishmentRepository", () {
    test(
      "Deve retornar os estabelecimentos passando Lat e Long",
      () async {
        when(
          () => httpService.post("estabelishments",
              {"latitude": "-23.5489", "longitude": "-46.6388"}),
        ).thenAnswer((_) async => jsonDecode(establismentsJson));
        var response = await repository
            .findByLocation(LocationCoordinates.defaultInstance());
        expect(response, isNotNull);
      },
    );
    test(
      "Deve retornar uma lista vazia de estabelecimentos",
      () async {
        when(
          () => httpService.post("estabelishments",
              {"latitude": "-23.5489", "longitude": "-46.6388"}),
        ).thenAnswer((_) async => {});
        var response = await repository
            .findByLocation(LocationCoordinates.defaultInstance());
        expect(response, isNotNull);
        expect(response, isEmpty);
      },
    );
    test(
      "Deve retornar os estabelecimentos passando o nome",
      () async {
        when(
          () => httpService.post("estabelishments", {"nome": "encanto"}),
        ).thenAnswer((_) async => jsonDecode(establishmentByNameJson));
        var response = await repository.findByName("encanto");
        expect(response.isNotEmpty, true);
      },
    );
    test(
      "Deve retornar uma lista vazia de estabelecimentos",
      () async {
        when(
          () => httpService.post("estabelishments", {"nome": "encanto"}),
        ).thenAnswer((_) async => {});
        var response = await repository.findByName("encanto");
        expect(response.isEmpty, true);
      },
    );
    test(
      "Deve retornar os estabelecimentos passando o id",
      () async {
        when(
          () => httpService.get("estabelishment", appId: "2234"),
        ).thenAnswer((_) async => jsonDecode(establishimentJson));
        var response = await repository.findById("2234");
        expect(response, isNotNull);
        expect(response?.estabelecimento?.isNotEmpty, true);
      },
    );
    test(
      "Deve retornar nenhum estabelecimento",
      () async {
        when(
          () => httpService.get("estabelishment", appId: "2234"),
        ).thenAnswer((_) async => {});
        var response = await repository.findById("2234");
        expect(response, isNull);
      },
    );
    test(
      "Deve buscar os estabelecimentos em que o usuario esta logado.",
      () async {
        when(
          () => httpService.get("my-locals", tokenCliente: "123"),
        ).thenAnswer((_) async => jsonDecode(establishmentByNameJson));
        var response = await repository.findMyLocals("123");
        expect(response, isNotNull);
        expect(response.isNotEmpty, true);
      },
    );
    test(
      "Deve retornar uma lista vazia de locais logado",
      () async {
        when(
          () => httpService.get("my-locals", tokenCliente: "123"),
        ).thenAnswer((_) async => {});
        var response = await repository.findMyLocals("123");
        expect(response, isEmpty);
      },
    );
  });
}
