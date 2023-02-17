import '../establishment_module.dart';

abstract class GetRegulation {
  Future<Regulation?> call();
}

class GetRegulationImpl extends GetRegulation {
  final RegulationRepository _repository;
  final FindEstablishmentById _establishmentById;

  GetRegulationImpl(
    this._repository,
    this._establishmentById,
  );

  @override
  Future<Regulation?> call() async {
    var appId = await _establishmentById.currentId();
    if (appId == null) {
      return null;
    }
    return await _repository.getRegulation(appId: appId);
  }
}
