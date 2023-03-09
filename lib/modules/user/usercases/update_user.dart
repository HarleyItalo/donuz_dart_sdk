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
    var appId = await _findEstablishmentById.currentId();
    if (appId == null) {
      return BaseResponseDonuzModel(
          status: 500,
          mensagem: "Não foi possivel determinar seu estabelecimento");
    }
    var token = await _getLoggedUserToken();
    return await _repository.updateUser(
      user: user,
      appId: appId,
      tokenClient: token,
    );
  }
}
