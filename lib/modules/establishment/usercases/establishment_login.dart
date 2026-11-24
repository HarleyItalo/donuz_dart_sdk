import 'package:donuz_dart_sdk/modules/common/config/config.dart';
import 'package:donuz_dart_sdk/modules/common/services/storage_service.dart';
import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';

abstract class EstablismentLogin {
  Future<AdminModel?> call({
    required String username,
    required String password,
  });
}

class EstablismentLoginImpl extends EstablismentLogin {
  final EstablishimentRepository _repository;
  final BaseConfig config;
  final StorageService storage;
  EstablismentLoginImpl(this._repository, this.config, this.storage);

  @override
  Future<AdminModel?> call({
    required String username,
    required String password,
  }) async {
    if (username.isEmpty || password.isEmpty) {
      return null;
    }
    var response = await _repository.login(username, password);
    if (response.token != null && response.token!.isNotEmpty) {
      config.donuzToken = response.token!;
      config.appId = response.estabelecimento?.idAdmin.toString();
      await storage.setDataTimmed('donuzToken', response.token!,
          time: Duration(days: 20));
      await storage.setDataTimmed(
          'appId', response.estabelecimento?.idAdmin.toString() ?? '',
          time: Duration(days: 20));
    }
    return response;
  }
}
