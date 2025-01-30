import '../../common/common_module.dart';
import '../user_module.dart';

abstract class LoginRepository {
  Future<String?> getLoggedUserToken();
  Future<String?> getLoggedUserId();
  Future<LoginModel?> makeLogin({
    required String appId,
    required String username,
    required String password,
    String? playerId,
  });
  Future<String?> rememberPassword({
    required String email,
    required String appId,
  });
  Future<bool> makeLogout();
  Future<LoginModel?> makeLoginOnlyKey({
    required String key,
    required String appId,
    String? playerId,
  });
}

class LoginRepositoryImpl extends LoginRepository {
  final HttpService httpService;
  final StorageService storageService;
  LoginRepositoryImpl(this.httpService, this.storageService);

  @override
  Future<String?> getLoggedUserToken() async {
    if (!await storageService.existsKey(loginTokenKey)) {
      return null;
    }
    return await storageService.getString(loginTokenKey);
  }

  @override
  Future<LoginModel?> makeLogin({
    required String appId,
    required String username,
    required String password,
    String? playerId,
  }) async {
    var data = <String, dynamic>{};
    data['login'] = username;
    data['player_id'] = playerId;
    data['senha'] = password;
    var json = await httpService.post(
      "clients/login",
      data,
      appId: appId,
    );
    var login = LoginModel.fromJson(json);
    if (login.status != 200) {
      return null;
    }
    storageService.setData(clientIdKey, login.cliente.toString(),
        serialize: false);
    storageService.setData(loginTokenKey, login.token, serialize: false);
    return login;
  }

  @override
  Future<String?> rememberPassword({
    required String email,
    required String appId,
  }) async {
    var body = <String, dynamic>{};
    body['email'] = email;
    var result =
        await httpService.post("clients/forgotPassword", body, appId: appId);
    var response = BaseResponseDonuzModel.fromJson(result);
    return response.mensagem;
  }

  @override
  Future<LoginModel?> makeLoginOnlyKey({
    required String key,
    required String appId,
    String? playerId,
  }) async {
    var body = <String, dynamic>{};
    body['login'] = key;
    body['player_id'] = playerId;
    var result =
        await httpService.post("clients/loginOnlyEmail", body, appId: appId);
    var login = LoginModel.fromJson(result);
    if (login.status != 200) {
      return null;
    }
    storageService.setData(clientIdKey, login.cliente.toString(),
        serialize: false);
    storageService.setData(loginTokenKey, login.token, serialize: false);
    return login;
  }

  @override
  Future<bool> makeLogout() async {
    return await storageService.clearAll();
  }

  @override
  Future<String?> getLoggedUserId() async {
    if (!await storageService.existsKey(clientIdKey)) {
      return null;
    }
    return await storageService.getString(clientIdKey);
  }
}
