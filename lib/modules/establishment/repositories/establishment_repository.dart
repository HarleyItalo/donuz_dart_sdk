import '../../common/common_module.dart';
import '../constants/establishiment_constants.dart';
import '../models/establishment_model.dart';

abstract class EstablishimentRepository {
  Future<List<Estabelecimento>> findByLocation(
      LocationCoordinates currentLocation);
  Future<List<Estabelecimento>> findByName(String name);
  Future<Estabelecimento?> findById(String id);
  Future<List<Estabelecimento>> findMyLocals(String token);
  Future<List<Estabelecimento>> findBySlug(String slug);
}

class EstablishimentRepositoryImpl extends EstablishimentRepository {
  final HttpService httpService;
  final StorageService _storageService;
  EstablishimentRepositoryImpl(this.httpService, this._storageService);

  @override
  Future<Estabelecimento?> findById(String id) async {
    var establishment = await httpService.get(
      "estabelishment",
      appId: id,
    );
    _storageService.setDataTimmed(
      "$establishmentStoreKey-$id",
      establishment,
    );
    var estabelecimento =
        EstabelishmentModel.fromJson(establishment).estabelecimento;
    return estabelecimento;
  }

  @override
  Future<List<Estabelecimento>> findByLocation(
      LocationCoordinates currentLocation) async {
    Map<String, String> body = <String, String>{
      "latitude": currentLocation.latitude.toString(),
      "longitude": currentLocation.longitude.toString(),
    };

    var json = await httpService.post("estabelishments", body);
    var establishments = EstabelishmentModel.fromJson(json).estabelecimentos;

    return establishments ?? <Estabelecimento>[];
  }

  @override
  Future<List<Estabelecimento>> findByName(String name) async {
    Map<String, dynamic> body = <String, String>{
      "nome": name,
    };
    var json = await httpService.post("estabelishments", body);
    var establishments = EstabelishmentModel.fromJson(json).estabelecimentos;
    return establishments ?? <Estabelecimento>[];
  }

  @override
  Future<List<Estabelecimento>> findBySlug(String slug) async {
    Map<String, dynamic> body = <String, String>{
      "slug": slug,
    };
    var json = await httpService.post("estabelishments", body);
    var establishments = EstabelishmentModel.fromJson(json).estabelecimentos;
    return establishments ?? <Estabelecimento>[];
  }

  @override
  Future<List<Estabelecimento>> findMyLocals(String token) async {
    var json = await httpService.get(
      "my-locals",
      tokenCliente: token,
    );
    var establishments = EstabelishmentModel.fromJson(json).estabelecimentos;
    return establishments ?? <Estabelecimento>[];
  }
}
