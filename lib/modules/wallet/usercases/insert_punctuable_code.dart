import '../../common/models/base_response_donuz_model.dart';
import '../../establishment/usercases/find_establishment_by_id.dart';
import '../../user/usercases/get_logged_user_token.dart';
import '../repositories/points_repository.dart';

abstract class InsertPunctuableCode {
  Future<BaseResponseDonuzModel?> call({required String code, String? value});
}

class InsertPunctuableCodeImpl implements InsertPunctuableCode {
  final PointsRepository _repository;
  final FindEstablishmentById _findEstablishmentById;
  final GetLoggedUserToken _userToken;

  InsertPunctuableCodeImpl(
      this._repository, this._findEstablishmentById, this._userToken);
  @override
  Future<BaseResponseDonuzModel?> call(
      {required String code, String? value}) async {
    if (code.isEmpty) return null;
    var response =
        await Future.wait([_findEstablishmentById.currentId(), _userToken()]);

    for (var element in response) {
      if (element == null) return null;
    }
    return await _repository.validadePunctuableCode(
      code: code,
      value: value,
      tokenClient: response.last,
      appId: response.first!,
    );
  }
}
