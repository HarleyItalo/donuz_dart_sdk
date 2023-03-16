import '../../common/common_module.dart';
import '../user_module.dart';

abstract class UserRepository {
  Future<User?> getUser({
    String? tokenClient,
    required String appId,
  });
  Future<BaseResponseDonuzModel> registerUser({
    required User user,
    required String appId,
  });
  Future<BaseResponseDonuzModel> updateUser({
    required User user,
    String? tokenClient,
    required String appId,
  });
  Future<BaseResponseDonuzModel> deleteUser({
    required String userId,
    required String appId,
    required String token,
  });
}

class UserRepositoryImpl extends UserRepository {
  HttpService httpService;

  UserRepositoryImpl(
    this.httpService,
  );

  @override
  Future<User?> getUser({String? tokenClient, required String appId}) async {
    if (tokenClient == null) {
      return null;
    }
    var json = await httpService.get("client/$tokenClient", appId: appId);
    var user = UserModel.fromJson(json);
    return user.client;
  }

  @override
  Future<BaseResponseDonuzModel> registerUser(
      {required User user, required String appId}) async {
    var json = <String, dynamic>{};

    json = user.toJson();
    json['origem_cadastro_cliente'] = 'app';

    var result = await httpService.post(
      "client",
      json,
      appId: appId,
    );
    return BaseResponseDonuzModel.fromJson(result);
  }

  @override
  Future<BaseResponseDonuzModel> updateUser(
      {required User user, String? tokenClient, required String appId}) async {
    var result = await httpService.put(
      "client",
      user.toJson(),
      appId: appId,
      tokenCliente: tokenClient,
    );
    return BaseResponseDonuzModel.fromJson(result);
  }

  @override
  Future<BaseResponseDonuzModel> deleteUser({
    required String userId,
    required String appId,
    required String token,
  }) async {
    var json = await httpService.delete(
      "client/$userId",
      tokenCliente: token,
      appId: appId,
    );
    return BaseResponseDonuzModel.fromJson(json);
  }
}
