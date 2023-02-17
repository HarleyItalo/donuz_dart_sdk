import '../establishment_module.dart';

abstract class FindEstablishmentBanners {
  Future<List<Banners>> call();
}

class FindEstablishmentBannersImpl extends FindEstablishmentBanners {
  final BannerRepository _repository;
  final FindEstablishmentById _findEstablishmentById;

  FindEstablishmentBannersImpl(
    this._repository,
    this._findEstablishmentById,
  );

  @override
  Future<List<Banners>> call() async {
    var currentId = await _findEstablishmentById.currentId();
    if (currentId == null) {
      return <Banners>[];
    }
    var result = await _repository.getBannersFromEstablishment(currentId);
    return result ?? <Banners>[];
  }
}
