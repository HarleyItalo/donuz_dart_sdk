import 'package:donuz_dart_sdk/modules/redemption/models/redemptions_by_date_model.dart';

import '../../establishment/usercases/find_establishment_by_id.dart';
import '../redemption_module.dart';

abstract class RedemptionsByDate {
  Future<RedemptionsByDateModel?> call(
      {required DateTime initialDate, int page = 0});
}

class RedemptionsByDateImpl extends RedemptionsByDate {
  final FindEstablishmentById _findEstablishmentById;
  final RescueRepository _repository;
  RedemptionsByDateImpl(this._findEstablishmentById, this._repository);

  @override
  Future<RedemptionsByDateModel?> call(
      {required DateTime initialDate, int page = 0}) async {
    var response = await _findEstablishmentById.currentId();
    if (response == null) {
      return null;
    }

    return _repository.redemptionsByDate(
      appId: response,
      startDate: initialDate,
      page: page,
    );
  }
}
