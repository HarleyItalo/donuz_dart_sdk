import '../../establishment/establishment_module.dart';
import '../wallet_module.dart';

abstract class GetPointsRule {
  Future<PointsRulesModel?> call();
}

class GetPointsRuleImpl extends GetPointsRule {
  final PointsRepository _repository;
  final FindEstablishmentById _findEstablishmentById;

  GetPointsRuleImpl(
    this._repository,
    this._findEstablishmentById,
  );

  @override
  Future<PointsRulesModel?> call() async {
    var response = await _findEstablishmentById.currentId();
    if (response == null) {
      return null;
    }

    var result = await _repository.getPointsRule(
      appId: response,
    );
    return result;
  }
}
