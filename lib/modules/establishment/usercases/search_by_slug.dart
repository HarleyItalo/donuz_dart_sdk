import '../models/establishment_model.dart';
import '../repositories/establishment_repository.dart';

abstract class SearchBySlug {
  Future<List<Estabelecimento>> call(String slug);
}

class SearchBySlugImpl extends SearchBySlug {
  final EstablishimentRepository _repository;

  SearchBySlugImpl(this._repository);

  @override
  Future<List<Estabelecimento>> call(String slug) async {
    if (slug.isEmpty) {
      return <Estabelecimento>[];
    }
    return await _repository.findBySlug(slug);
  }
}
