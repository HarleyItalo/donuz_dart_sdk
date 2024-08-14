import 'package:donuz_dart_sdk/modules/nfe/models/nfe_status_result_model.dart';
import 'package:donuz_dart_sdk/modules/nfe/repositories/nfe_repository_model.dart';
import '../../establishment/establishment_module.dart';

abstract class GetNfeStatusByPeople {
  Future<NfeStatusResultModel> call({required String cpf});
}

class GetNfeStatusByPeopleImpl implements GetNfeStatusByPeople {
  final NfeRepository _repository;
  final FindEstablishmentById _findEstablishmentById;
  GetNfeStatusByPeopleImpl(this._repository, this._findEstablishmentById);

  @override
  Future<NfeStatusResultModel> call({required String cpf}) async {
    var establishmentId = await _findEstablishmentById.currentId();

    if (establishmentId == null) {
      return NfeStatusResultModel();
    }

    return await _repository.getNfeActionResult(
        cpf: cpf, establismentId: establishmentId);
  }
}
