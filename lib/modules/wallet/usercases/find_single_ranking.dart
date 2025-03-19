import 'package:donuz_dart_sdk/modules/wallet/models/single_ranking_model.dart';

import '../../establishment/establishment_module.dart';
import '../../user/user_module.dart';
import '../wallet_module.dart';

abstract class FindSingleRanking {
  Future<SingleRankingModel?> call();
}

class FindSingleRankingImpl extends FindSingleRanking {
  final PointsRepository _repository;
  final FindEstablishmentById _findEstablishmentById;
  final GetLoggedUserId _getLoggedUserId;

  FindSingleRankingImpl(
      this._repository, this._findEstablishmentById, this._getLoggedUserId);

  @override
  Future<SingleRankingModel?> call() async {
    var personId = await _getLoggedUserId();
    var appId = await _findEstablishmentById.currentId();
    if (appId == null) {
      return null;
    }
    var result = await _repository.findSingleRanking(
        appId: appId, personId: personId ?? "1");
    return result;
  }
}
