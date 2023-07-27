import 'package:donuz_dart_sdk/modules/establishment/usercases/find_establishment_by_id.dart';
import 'package:donuz_dart_sdk/modules/wallet/models/ranking_model.dart';
import '../wallet_module.dart';

abstract class FindRanking {
  Future<RankingModel?> call();
}

class FindRankingImpl extends FindRanking {
  final PointsRepository _repository;
  final FindEstablishmentById _findEstablishmentById;

  FindRankingImpl(
    this._repository,
    this._findEstablishmentById,
  );

  @override
  Future<RankingModel?> call() async {
    var appId = await _findEstablishmentById.currentId();
    if (appId == null) {
      return null;
    }
    var result = await _repository.findRanking(
      appId: appId,
    );
    return result;
  }
}
