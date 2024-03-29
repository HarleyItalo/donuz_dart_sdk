import 'package:donuz_dart_sdk/modules/establishment/models/admin_model.dart';
import 'package:donuz_dart_sdk/modules/establishment/models/dashboard_model.dart';

import '../../common/common_module.dart';
import '../constants/establishiment_constants.dart';
import '../models/establishment_model.dart';

abstract class EstablishimentRepository {
  Future<List<Estabelecimento>> findByLocation(
      LocationCoordinates currentLocation);
  Future<List<Estabelecimento>> findByName(String name);
  Future<AdminModel> login(String username, String password);
  Future<Estabelecimento?> findById(String id);
  Future<DashboardModel> dashboardData(String appId);
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

    return establishments;
  }

  @override
  Future<List<Estabelecimento>> findByName(String name) async {
    Map<String, dynamic> body = <String, String>{
      "nome": name,
    };
    var json = await httpService.post("estabelishments", body);
    var establishments = EstabelishmentModel.fromJson(json).estabelecimentos;
    return establishments;
  }

  @override
  Future<List<Estabelecimento>> findBySlug(String slug) async {
    Map<String, dynamic> body = <String, String>{
      "slug": slug,
    };
    var json = await httpService.post("estabelishments", body);
    var establishments = EstabelishmentModel.fromJson(json).estabelecimentos;
    return establishments;
  }

  @override
  Future<List<Estabelecimento>> findMyLocals(String token) async {
    var json = await httpService.get(
      "my-locals",
      tokenCliente: token,
    );
    var establishments = EstabelishmentModel.fromJson(json).estabelecimentos;
    return establishments;
  }

  @override
  Future<AdminModel> login(String username, String password) async {
    var json = await httpService.post("estabelishment/login", {
      "login": username,
      "senha": password,
    });
    return AdminModel.fromJson(json);
  }

  @override
  Future<DashboardModel> dashboardData(String appId) async {
    var json = await httpService.get("dashboard/count", appId: appId);
    return DashboardModel.fromJson(json);
  }
}
