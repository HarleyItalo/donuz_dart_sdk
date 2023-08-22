import '../../establishment/establishment_module.dart';
import '../redemption_module.dart';

abstract class ChangeVoucherStatus {
  Future<RescueModel?> call({
    required int redeemptionId,
    required String newStatus,
    required String appId,
  });
}

class ChangeVoucherStatusImpl extends ChangeVoucherStatus {
  final FindEstablishmentById _findEstablishmentById;
  final RescueRepository _repository;
  ChangeVoucherStatusImpl(
    this._repository,
    this._findEstablishmentById,
  );

  @override
  Future<RescueModel?> call(
      {required int redeemptionId,
      required String newStatus,
      required String appId,
      String? adminUserId}) async {
    var response = await _findEstablishmentById.currentId();
    if (response == null || newStatus.isEmpty) {
      return null;
    }

    var result = await _repository.changeVoucherStatus(
        idRedeemption: redeemptionId,
        newStatus: newStatus,
        adminUserID: adminUserId,
        appId: appId);

    return result;
  }
}
