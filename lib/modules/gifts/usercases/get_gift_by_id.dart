import 'package:donuz_dart_sdk/modules/gifts/gift_module.dart';

import '../../establishment/establishment_module.dart';

abstract class GetGiftById {
  Future<GiftsModel?> call(String id);
}

class GetGiftByIdImpl implements GetGiftById {
  final GiftsRepository _repository;
  final FindEstablishmentById _findEstablishmentById;
  GetGiftByIdImpl(this._repository, this._findEstablishmentById);
  @override
  Future<GiftsModel?> call(String id) async {
    var response = await _findEstablishmentById.currentId();

    if (response == null) {
      return null;
    }

    return await _repository.getGiftById(appId: response, id: id);
  }
}
