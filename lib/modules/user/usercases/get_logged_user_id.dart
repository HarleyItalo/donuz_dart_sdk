import '../user_module.dart';

abstract class GetLoggedUserId {
  Future<String?> call();
}

class GetLoggedUserIdImpl extends GetLoggedUserId {
  final LoginRepository _repository;
  GetLoggedUserIdImpl(this._repository);

  @override
  Future<String?> call() async {
    return await _repository.getLoggedUserId();
  }
}
