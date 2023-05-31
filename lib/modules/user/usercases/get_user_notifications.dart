import '../../establishment/establishment_module.dart';
import '../user_module.dart';

abstract class GetUserNotifications {
  Future<UserNotificationModel?> call({required String userId});
}

class GetUserNotificationsImpl extends GetUserNotifications {
  final FindEstablishmentById _findEstablishmentById;
  final UserRepository _repository;

  GetUserNotificationsImpl(
    this._repository,
    this._findEstablishmentById,
  );

  @override
  Future<UserNotificationModel?> call({required String userId}) async {
    var establishment = await _findEstablishmentById.currentId();
    if (establishment == null) {
      return null;
    }
    var response = await _repository.findNotifications(
        userId: userId, appId: establishment);

    return response;
  }
}
