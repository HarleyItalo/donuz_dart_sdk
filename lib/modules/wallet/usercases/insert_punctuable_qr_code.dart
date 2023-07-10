import '../../common/models/base_response_donuz_model.dart';
import '../../establishment/usercases/find_establishment_by_id.dart';
import '../../user/usercases/get_logged_user_token.dart';
import '../repositories/points_repository.dart';

abstract class InsertPunctuableQrCode {
  Future<BaseResponseDonuzModel?> call({required String code});
}

class InsertPunctuableQrCodeImpl implements InsertPunctuableQrCode {
  final PointsRepository _repository;
  final FindEstablishmentById _findEstablishmentById;
  final GetLoggedUserToken _userToken;

  InsertPunctuableQrCodeImpl(
      this._repository, this._findEstablishmentById, this._userToken);
  @override
  Future<BaseResponseDonuzModel?> call({required String code}) async {
    if (code.isEmpty) return null;
    var response =
        await Future.wait([_findEstablishmentById.currentId(), _userToken()]);

    for (var element in response) {
      if (element == null) return null;
    }
    return await _repository.validadeQrCode(
        code: code, tokenClient: response.last, appId: response.first!);
  }
}
