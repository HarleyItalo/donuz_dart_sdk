import 'package:donuz_dart_sdk/modules/user/usercases/get_logged_user_token.dart';

import '../models/establishment_model.dart';
import '../repositories/establishment_repository.dart';

abstract class SearchMyLocales {
  Future<List<Estabelecimento>> call();
}

class SearchMyLocalesImpl extends SearchMyLocales {
  final EstablishimentRepository _repository;
  final GetLoggedUserToken getLoggedUserToken;

  SearchMyLocalesImpl(this._repository, this.getLoggedUserToken);

  @override
  Future<List<Estabelecimento>> call() async {
    var token = await getLoggedUserToken();
    if (token == null) {
      return <Estabelecimento>[];
    }
    return await _repository.findMyLocals(token);
  }
}
