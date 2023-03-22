import '../../common/common_module.dart';
import '../../establishment/establishment_module.dart';
import '../user_module.dart';

abstract class UpdateUser {
  Future<BaseResponseDonuzModel> call({required User user});
}

class UpdateUserImpl extends UpdateUser {
  final FindEstablishmentById _findEstablishmentById;

  final UserRepository _repository;
  final GetLoggedUserToken _getLoggedUserToken;

  UpdateUserImpl(
    this._repository,
    this._findEstablishmentById,
    this._getLoggedUserToken,
  );

  @override
  Future<BaseResponseDonuzModel> call({required User user}) async {
    var response = await Future.wait(
        [_findEstablishmentById.currentId(), _getLoggedUserToken()]);

    for (var element in response) {
      if (element == null) {
        return BaseResponseDonuzModel(
            status: 500, mensagem: "Não foi possivel realizar sua requisição");
      }
    }

    return await _repository.updateUser(
      user: user,
      appId: response.first!,
      tokenClient: response.last,
    );
  }
}
