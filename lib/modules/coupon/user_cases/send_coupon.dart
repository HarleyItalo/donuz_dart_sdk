import '../../establishment/establishment_module.dart';
import '../../user/user_module.dart';
import '../coupon_module.dart';

abstract class SendCoupon {
  Future<bool> call({
    required String user,
    required String url,
  });
}

class SendCouponImpl extends SendCoupon {
  final CouponRepository _repository;
  final GetLoggedUserToken _getLoggedUserToken;
  final FindEstablishmentById _findEstablishmentById;

  SendCouponImpl(
    this._repository,
    this._getLoggedUserToken,
    this._findEstablishmentById,
  );

  @override
  Future<bool> call({
    required String user,
    required String url,
  }) async {
    if (url.isEmpty) return false;
    if (user.isEmpty) return false;
    var response = await Future.wait(
        [_findEstablishmentById.currentId(), _getLoggedUserToken()]);

    for (var element in response) {
      if (element == null) return false;
    }

    var result = await _repository.sendCoupon(
      url: url,
      appId: response.first!,
      user: user,
      token: response.last!,
    );
    return result;
  }
}
