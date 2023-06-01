import '../../establishment/establishment_module.dart';
import '../models/prize_model.dart';
import '../prizes_module.dart';

abstract class GetPrizeById {
  Future<PrizeInfo?> call(String prizeId);
}

class GetPrizeByIdImpl implements GetPrizeById {
  final PrizeRepository _repository;
  final FindEstablishmentById _findEstablishmentById;
  GetPrizeByIdImpl(this._repository, this._findEstablishmentById);
  @override
  Future<PrizeInfo?> call(String prizeId) async {
    var establisment = await _findEstablishmentById.currentId();
    if (establisment == null) return null;

    return await _repository.getPrizeById(prizeId, establisment);
  }
}
