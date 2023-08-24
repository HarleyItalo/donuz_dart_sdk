import 'package:donuz_dart_sdk/modules/establishment/models/dashboard_info.dart';
import '../establishment_module.dart';

abstract class DashboardInfo {
  Future<DashboardInfoModel?> call();
}

class DashboardInfoImpl extends DashboardInfo {
  final EstablishimentRepository _repository;
  final FindEstablishmentById _findEstablishmentById;

  DashboardInfoImpl(
    this._repository,
    this._findEstablishmentById,
  );

  @override
  Future<DashboardInfoModel?> call() async {
    var appId = await _findEstablishmentById.currentId();
    if (appId == null) {
      return null;
    }
    return _repository.dashboardData(appId);
  }
}
