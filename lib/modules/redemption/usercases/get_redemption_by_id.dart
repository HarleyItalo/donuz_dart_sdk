import '../../establishment/establishment_module.dart';
import '../redemption_module.dart';

abstract class GetRedemptionById {
  Future<RescueModel?> call({
    required String rescueId,
  });
}

class GetRedemptionByIdImpl extends GetRedemptionById {
  final FindEstablishmentById _findEstablishmentById;
  final RescueRepository _repository;
  GetRedemptionByIdImpl(
    this._repository,
    this._findEstablishmentById,
  );

  @override
  Future<RescueModel?> call({
    required String rescueId,
  }) async {
    var response = await _findEstablishmentById.currentId();
    if (response == null) {
      return null;
    }

    var result = await _repository.getRescueById(id: rescueId, appId: response);

    return result;
  }
}
