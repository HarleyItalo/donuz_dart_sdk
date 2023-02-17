import '../../common/common_module.dart';
import '../establishment_module.dart';

abstract class SearchByLocation {
  Future<List<Estabelecimento>> call(LocationCoordinates coordinates);
}

class SearchByLocationImpl extends SearchByLocation {
  final EstablishimentRepository _repository;
  SearchByLocationImpl(this._repository);

  @override
  Future<List<Estabelecimento>> call(LocationCoordinates coordinates) {
    return _repository.findByLocation(coordinates);
  }
}
