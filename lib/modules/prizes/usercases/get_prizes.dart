import '../../establishment/establishment_module.dart';
import '../prizes_module.dart';

abstract class GetPrizes {
  Future<List<Prize>?> call();
}

class GetPrizesImpl implements GetPrizes {
  final PrizeRepository _repository;
  final FindEstablishmentById _findEstablishmentById;
  GetPrizesImpl(this._repository, this._findEstablishmentById);
  @override
  Future<List<Prize>?> call() async {
    var establisment = await _findEstablishmentById.currentId();
    if (establisment == null) return null;

    return await _repository.getPrizes(establisment);
  }
}
