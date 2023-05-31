import '../../establishment/establishment_module.dart';
import '../user_module.dart';

abstract class MarkAsReadNotification {
  Future<bool> call({required String notificationId});
}

class MarkAsReadNotificationImpl extends MarkAsReadNotification {
  final FindEstablishmentById _findEstablishmentById;

  final UserRepository _repository;

  MarkAsReadNotificationImpl(
    this._repository,
    this._findEstablishmentById,
  );

  @override
  Future<bool> call({required String notificationId}) async {
    var establishment = await _findEstablishmentById.currentId();
    if (establishment == null) {
      return false;
    }
    var response = await _repository.markAsReadNotification(
        notificationId: notificationId, appId: establishment);

    return response;
  }
}
