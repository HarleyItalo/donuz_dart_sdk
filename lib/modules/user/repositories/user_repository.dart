import '../../common/common_module.dart';

import '../user_module.dart';

abstract class UserRepository {
  Future<User?> getUser({
    String? userInfo,
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
  Future<bool> sendSmsBeforeRegistration({
    required String phoneNumber,
    required String appId,
  });
  Future<UserNotificationModel?> findNotifications({
    required String appId,
    required String userId,
  });
  Future<bool> updateNotificationToken({
    required String playerId,
    required String appId,
    required String tokenClient,
  });
  Future<bool> markAsReadNotification({
    required String notificationId,
    required String appId,
  });
}

class UserRepositoryImpl extends UserRepository {
  HttpService httpService;

  UserRepositoryImpl(
    this.httpService,
  );

  @override
  Future<User?> getUser({String? userInfo, required String appId}) async {
    if (userInfo == null) {
      return null;
    }
    var json = await httpService.get("client/$userInfo", appId: appId);
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

  @override
  Future<bool> sendSmsBeforeRegistration({
    required String phoneNumber,
    required String appId,
  }) async {
    final result = await httpService.post(
        'sms/sendToAnonymous',
        {
          "celular": phoneNumber,
        },
        appId: appId);
    final response = BaseResponseDonuzModel.fromJson(result);
    return response.status == 200;
  }

  @override
  Future<UserNotificationModel?> findNotifications({
    required String appId,
    required String userId,
  }) async {
    var response =
        await httpService.get("client/$userId/notifications", appId: appId);
    return UserNotificationModel.fromJson(response);
  }

  @override
  Future<bool> markAsReadNotification({
    required String notificationId,
    required String appId,
  }) async {
    var result = await httpService.put(
      'notification/$notificationId/readed',
      {},
      appId: appId,
    );
    var notifications = BaseResponseDonuzModel.fromJson(result);
    return notifications.status == 200;
  }

  @override
  Future<bool> updateNotificationToken(
      {required String playerId,
      required String appId,
      required String tokenClient}) async {
    var result = await httpService.post(
        'notification/updateTokenNotification', {'player_id': playerId},
        tokenCliente: tokenClient, appId: appId);
    var response = BaseResponseDonuzModel.fromJson(result);

    return (response.status == 200);
  }
}
