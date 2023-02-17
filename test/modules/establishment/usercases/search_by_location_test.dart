import 'package:donuz_dart_sdk/modules/common/common_module.dart';
import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../mocks/establishment/repositories/establishment_repository_mock.dart';

class FakeLocationCoordinates extends Fake implements LocationCoordinates {}

void main() async {
  final establishmentRepositoryMock = EstablishmentRepositoryMock();
  final searchByLocation = SearchByLocationImpl(establishmentRepositoryMock);

  setUpAll(() => registerFallbackValue(FakeLocationCoordinates()));
  group("Search by Location", () {
    test("Deve retornar os estabelecimentos baseados na localizacao", () async {
      when(() => establishmentRepositoryMock.findByLocation(any()))
          .thenAnswer((_) async => <Estabelecimento>[]);
      var response = await searchByLocation.call(
        LocationCoordinates.defaultInstance(),
      );
      expect(response, isNotNull);
    });
  });
}
