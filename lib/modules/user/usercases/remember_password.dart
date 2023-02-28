import '../../establishment/establishment_module.dart';
import '../user_module.dart';

abstract class RememberPassword {
  Future<String?> call(String email);
}

class RememberPasswordImpl implements RememberPassword {
  final LoginRepository _repository;
  final FindEstablishmentById _establishmentById;
  RememberPasswordImpl(this._repository, this._establishmentById);

  @override
  Future<String?> call(String email) async {
    if (email.isEmpty) {
      return null;
    }
    var appId = await _establishmentById.currentId();
    if (appId == null) {
      return null;
    }
    return _repository.rememberPassword(email: email, appId: appId);
  }
}
