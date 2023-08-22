import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';

abstract class EstablismentLogin {
  Future<AdminModel?> call({
    required String username,
    required String password,
  });
}

class EstablismentLoginImpl extends EstablismentLogin {
  final EstablishimentRepository _repository;
  EstablismentLoginImpl(this._repository);

  @override
  Future<AdminModel?> call({
    required String username,
    required String password,
  }) async {
    if (username.isEmpty || password.isEmpty) {
      return null;
    }
    return await _repository.login(username, password);
  }
}
