import '../user_module.dart';

abstract class MakeLogout {
  Future<bool> call();
}

class MakeLogoutImpl implements MakeLogout {
  final LoginRepository _repository;
  MakeLogoutImpl(this._repository);

  @override
  Future<bool> call() {
    return _repository.makeLogout();
  }
}
