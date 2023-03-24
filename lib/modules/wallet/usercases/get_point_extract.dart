import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';

import '../../user/user_module.dart';
import '../wallet_module.dart';

abstract class GetPointExtract {
  Future<PointsModel?> call();
}

class GetPointExtractImpl extends GetPointExtract {
  final PointsRepository _repository;
  final FindEstablishmentById _findEstablishmentById;
  final GetLoggedUserToken _userToken;

  GetPointExtractImpl(
    this._repository,
    this._findEstablishmentById,
    this._userToken,
  );

  @override
  Future<PointsModel?> call() async {
    var response =
        await Future.wait([_findEstablishmentById.currentId(), _userToken()]);

    for (var element in response) {
      if (element == null) return null;
    }

    var result = await _repository.getPoints(
        appId: response.first!, tokenClient: response.last);
    return result;
  }
}
