import '../../establishment/establishment_module.dart';
import '../pdv_module.dart';

abstract class GetPdvSettings {
  Future<PdvSettings?> call();
}

class GetPdvSettingsImpl extends GetPdvSettings {
  final PdvSettingsRepository _repository;
  final FindEstablishmentById _findEstablishmentById;

  GetPdvSettingsImpl(
    this._repository,
    this._findEstablishmentById,
  );

  @override
  Future<PdvSettings?> call() async {
    var currentId = await _findEstablishmentById.currentId();
    if (currentId == null) return null;

    return _repository.getPdvSettingsFromEstablishment(currentId);
  }
}
