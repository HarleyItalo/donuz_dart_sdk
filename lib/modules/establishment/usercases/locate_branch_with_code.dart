import 'package:donuz_dart_sdk/modules/establishment/models/branch_user_model.dart';

import '../establishment_module.dart';

abstract class LocateBranchWithCode {
  Future<UsuarioFilial?> call(String code);
}

class LocateBranchWithCodeImpl extends LocateBranchWithCode {
  final BranchRepository _repository;
  final FindEstablishmentById _findEstablishmentById;

  LocateBranchWithCodeImpl(
    this._repository,
    this._findEstablishmentById,
  );

  @override
  Future<UsuarioFilial?> call(String code) async {
    var currentId = await _findEstablishmentById.currentId();
    if (currentId == null) {
      return null;
    }
    var result =
        await _repository.locateBranchWithCode(code: code, appId: currentId);
    return result.usuarioFilial;
  }
}
