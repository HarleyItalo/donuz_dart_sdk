import '../../common/common_module.dart';
import '../../establishment/establishment_module.dart';
import '../user_module.dart';

abstract class RegisterUser {
  Future<LoginModel?> call({required User user});
}

class RegisterUserImpl extends RegisterUser {
  final FindEstablishmentById _findEstablishmentById;

  final UserRepository _repository;
  final MakeLogin _makeLogin;

  RegisterUserImpl(
    this._repository,
    this._findEstablishmentById,
    this._makeLogin,
  );

  @override
  Future<LoginModel?> call({required User user}) async {
    var establishment = await _findEstablishmentById.currentId();
    if (establishment == null) {
      return null;
    }
    var sucess =
        await _repository.registerUser(user: user, appId: establishment);

    if (sucess.status != null &&
        sucess.status! >= 200 &&
        sucess.status! < 300) {
      return await _makeLogin(
          username: StringUtil.onlyNumbers(user.cpf),
          password: user.senha ?? '');
    }
    return LoginModel(status: sucess.status, mensagem: sucess.mensagem);
  }
}
