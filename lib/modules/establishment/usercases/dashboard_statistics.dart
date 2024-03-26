import 'package:donuz_dart_sdk/modules/establishment/models/dashboard_model.dart';
import '../establishment_module.dart';

abstract class DashboardStatistics {
  Future<DashboardModel?> call();
}

class DashboardStatisticsImpl extends DashboardStatistics {
  final EstablishimentRepository _repository;
  final FindEstablishmentById _findEstablishmentById;

  DashboardStatisticsImpl(
    this._repository,
    this._findEstablishmentById,
  );

  @override
  Future<DashboardModel?> call() async {
    var appId = await _findEstablishmentById.currentId();
    if (appId == null) {
      return null;
    }
    return _repository.dashboardData(appId);
  }
}
