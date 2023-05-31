import 'package:donuz_dart_sdk/modules/gifts/gift_module.dart';

import '../../establishment/establishment_module.dart';
import '../../user/user_module.dart';

abstract class FindGifts {
  Future<GiftsModel?> call();
}

class FindGiftsImpl implements FindGifts {
  final GetLoggedUserToken _getLoggedUserToken;
  final GiftsRepository _repository;
  final FindEstablishmentById _findEstablishmentById;
  FindGiftsImpl(
      this._repository, this._findEstablishmentById, this._getLoggedUserToken);
  @override
  Future<GiftsModel?> call() async {
    var response = await Future.wait([
      _findEstablishmentById.currentId(),
      _getLoggedUserToken(),
    ]);

    for (var element in response) {
      if (element == null) {
        return null;
      }
    }

    return await _repository.findGifts(
        appId: response.first!, tokenCliente: response.last!);
  }
}
