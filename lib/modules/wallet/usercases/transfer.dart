import 'package:donuz_dart_sdk/modules/user/usercases/get_user.dart';

import '../../common/models/base_response_donuz_model.dart';
import '../../establishment/usercases/find_establishment_by_id.dart';
import '../repositories/points_repository.dart';

abstract class Transfer {
  Future<BaseResponseDonuzModel?> call({
    required String destination,
    required double value,
  });
}

class TransferImpl implements Transfer {
  final PointsRepository _repository;
  final FindEstablishmentById _findEstablishmentById;
  final GetUser _getUser;

  TransferImpl(
    this._repository,
    this._findEstablishmentById,
    this._getUser,
  );
  @override
  Future<BaseResponseDonuzModel?> call({
    required String destination,
    required double value,
  }) async {
    var appId = await _findEstablishmentById.currentId();
    var user = await _getUser();
    if (user?.cpf == null) {
      return null;
    }

    if (value <= 0) {
      return null;
    }

    if (appId == null) {
      return null;
    }
    return await _repository.transfer(
      source: user!.cpf!,
      destination: destination,
      value: value,
      appId: appId,
    );
  }
}
