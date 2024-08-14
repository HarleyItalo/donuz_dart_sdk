import 'package:donuz_dart_sdk/modules/nfe/models/action_model.dart';
import 'package:donuz_dart_sdk/modules/nfe/models/nfe_status_result_model.dart';
import 'package:donuz_dart_sdk/modules/nfe/usercases/create_nfe_to_run.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/nfe/nfe_repository_mock.dart';

void main() {
  var repository = NfeRepositoryMock();
  var findEstablishmentByIdMock = FindEstablismentByIdMock();

  var createNfeToRun =
      CreateNfeToRunImpl(repository, findEstablishmentByIdMock);
  group("CreateNfeToRun", () {
    test("Deve retornar os presentes disponiveis para o usuario", () async {
      var action = ActionModel(
          actionParamms:
              ActionParamms(cpf: '12345678909', nfeAccessKey: '123'));

      when(
        () => findEstablishmentByIdMock.currentId(),
      ).thenAnswer(
        (_) async => '2234',
      );
      when(
        () => repository.sendNfe(action: action),
      ).thenAnswer((_) async => (true, ""));

      var response = await createNfeToRun(action: action);
      expect(response, isNotNull);
    });
  });
}
