import '../models/establishment_model.dart';
import '../repositories/establishment_repository.dart';

abstract class SearchMyLocales {
  Future<List<Estabelecimento>> call(String token);
}

class SearchMyLocalesImpl extends SearchMyLocales {
  final EstablishimentRepository _repository;

  SearchMyLocalesImpl(this._repository);

  @override
  Future<List<Estabelecimento>> call(String token) async {
    return await _repository.findMyLocals(token);
  }
}
