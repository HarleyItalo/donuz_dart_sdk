import '../../establishment/establishment_module.dart';
import '../coupon_module.dart';

abstract class CouponStatus {
  Future<CouponStatusModel?> call({
    required String user,
  });
}

class CouponStatusImpl extends CouponStatus {
  final CouponRepository _repository;
  final FindEstablishmentById _findEstablishmentById;

  CouponStatusImpl(
    this._repository,
    this._findEstablishmentById,
  );

  @override
  Future<CouponStatusModel?> call({
    required String user,
  }) async {
    var appId = await _findEstablishmentById.currentId();
    if (appId == null) return null;
    return _repository.couponStatus(
      appId: appId,
      user: user,
    );
  }
}
