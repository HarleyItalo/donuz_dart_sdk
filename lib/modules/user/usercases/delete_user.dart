import '../../common/common_module.dart';
import '../../establishment/establishment_module.dart';
import '../user_module.dart';

abstract class DeleteUser {
  Future<BaseResponseDonuzModel> call({required User user});
}

class DeleteUserImpl extends DeleteUser {
  final FindEstablishmentById _findEstablishmentById;

  final UserRepository _repository;
  final GetLoggedUserToken _getLoggedUserToken;

  DeleteUserImpl(
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
    if (token == null) {
      return BaseResponseDonuzModel(
          status: 500,
          mensagem: "Você não está logado, faça o login e tente novamente.");
    }
    return await _repository.deleteUser(
        appId: appId, token: token, userId: user.idCliente.toString());
  }
}
