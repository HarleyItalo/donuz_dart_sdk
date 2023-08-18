import '../establishment_module.dart';

abstract class GetBranchs {
  Future<List<Filial>> call();
}

class GetBranchsImpl extends GetBranchs {
  final BranchRepository _repository;
  final FindEstablishmentById _findEstablishmentById;

  GetBranchsImpl(
    this._repository,
    this._findEstablishmentById,
  );

  @override
  Future<List<Filial>> call() async {
    var currentId = await _findEstablishmentById.currentId();
    if (currentId == null) {
      return <Filial>[];
    }
    var result = await _repository.getBranchs(currentId);
    return result ?? <Filial>[];
  }
}
