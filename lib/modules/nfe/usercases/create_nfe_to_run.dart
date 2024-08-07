import 'package:donuz_dart_sdk/modules/nfe/models/action_model.dart';
import 'package:donuz_dart_sdk/modules/nfe/repositories/nfe_repository_model.dart';
import '../../establishment/establishment_module.dart';

abstract class CreateNfeToRun {
  Future<(bool, String?)> call({required ActionModel action});
}

class CreateNfeToRunImpl implements CreateNfeToRun {
  final NfeRepository _repository;
  final FindEstablishmentById _findEstablishmentById;
  CreateNfeToRunImpl(this._repository, this._findEstablishmentById);

  @override
  Future<(bool, String?)> call({required ActionModel action}) async {
    var establishmentId = await _findEstablishmentById.currentId();

    if (establishmentId == null) {
      return (false, "");
    }

    action.establishmentId = int.parse(establishmentId);

    return await _repository.sendNfe(action: action);
  }
}
