import '../user_module.dart';

abstract class GetLoggedUserToken {
  Future<String?> call();
}

class GetLoggedUserTokenImpl extends GetLoggedUserToken {
  final LoginRepository _repository;
  GetLoggedUserTokenImpl(this._repository);

  @override
  Future<String?> call() async {
    return await _repository.getLoggedUserToken();
  }
}
