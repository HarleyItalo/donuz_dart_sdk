import '../models/establishment_model.dart';
import '../repositories/establishment_repository.dart';

abstract class SearchByName {
  Future<List<Estabelecimento>> call(String name);
}

class SearchByNameImpl extends SearchByName {
  final EstablishimentRepository _repository;

  SearchByNameImpl(this._repository);

  @override
  Future<List<Estabelecimento>> call(String name) async {
    if (name.isEmpty) {
      return <Estabelecimento>[];
    }
    return await _repository.findByName(name);
  }
}
