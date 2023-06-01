import '../../establishment/establishment_module.dart';
import '../prizes_module.dart';

abstract class GetPrizesCategories {
  Future<PrizeCategoryModel?> call(String prizeId);
}

class GetPrizesCategoriesImpl implements GetPrizesCategories {
  final PrizeRepository _repository;
  final FindEstablishmentById _findEstablishmentById;
  GetPrizesCategoriesImpl(this._repository, this._findEstablishmentById);
  @override
  Future<PrizeCategoryModel?> call(String prizeId) async {
    var establisment = await _findEstablishmentById.currentId();
    if (establisment == null) return null;

    return await _repository.getPrizesCategories(establisment);
  }
}
