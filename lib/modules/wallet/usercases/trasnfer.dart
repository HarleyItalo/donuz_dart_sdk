import '../../common/models/base_response_donuz_model.dart';
import '../../establishment/usercases/find_establishment_by_id.dart';
import '../repositories/points_repository.dart';

abstract class Trasnfer {
  Future<BaseResponseDonuzModel?> call({
    required String source,
    required String destination,
    required double value,
  });
}

class TrasnferImpl implements Trasnfer {
  final PointsRepository _repository;
  final FindEstablishmentById _findEstablishmentById;

  TrasnferImpl(
    this._repository,
    this._findEstablishmentById,
  );
  @override
  Future<BaseResponseDonuzModel?> call({
    required String source,
    required String destination,
    required double value,
  }) async {
    var appId = await _findEstablishmentById.currentId();

    if (source == destination) {
      return null;
    }
    if (value <= 0) {
      return null;
    }

    if (appId == null) {
      return null;
    }
    return await _repository.trasnfer(
      source: source,
      destination: destination,
      value: value,
      appId: appId,
    );
  }
}
