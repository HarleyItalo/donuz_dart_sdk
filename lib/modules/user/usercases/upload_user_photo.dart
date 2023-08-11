import 'dart:io';

import '../../establishment/establishment_module.dart';
import '../user_module.dart';

abstract class UploadUserPhoto {
  Future<UploadUserImageModel?> call({required File image});
}

class UploadUserPhotoImpl extends UploadUserPhoto {
  final FindEstablishmentById _findEstablishmentById;
  final GetLoggedUserToken _getLoggedUserToken;
  final UserRepository _repository;

  UploadUserPhotoImpl(
    this._repository,
    this._findEstablishmentById,
    this._getLoggedUserToken,
  );

  @override
  Future<UploadUserImageModel?> call({required File image}) async {
    var response = await Future.wait(
        [_findEstablishmentById.currentId(), _getLoggedUserToken()]);

    for (var element in response) {
      if (element == null) return null;
    }
    return await _repository.uploadImage(
        image: image, appId: response.first!, tokenClient: response.last);
  }
}
