import '../../establishment/establishment_module.dart';
import '../user_module.dart';

abstract class SendSmsBeforeRegistration {
  Future<bool?> call({required String phoneNumber});
}

class SendSmsBeforeRegistrationImpl implements SendSmsBeforeRegistration {
  final UserRepository _repository;
  final FindEstablishmentById _establishmentById;
  SendSmsBeforeRegistrationImpl(this._repository, this._establishmentById);

  @override
  Future<bool?> call({required String phoneNumber}) async {
    if (phoneNumber.isEmpty) {
      return false;
    }
    var appId = await _establishmentById.currentId();
    if (appId == null) {
      return null;
    }
    return await _repository.sendSmsBeforeRegistration(
        phoneNumber: phoneNumber, appId: appId);
  }
}
