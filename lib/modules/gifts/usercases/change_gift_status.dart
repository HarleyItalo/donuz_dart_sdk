import 'package:donuz_dart_sdk/modules/common/extensions/enun_extension.dart';
import 'package:donuz_dart_sdk/modules/common/models/base_response_donuz_model.dart';
import 'package:donuz_dart_sdk/modules/gifts/gift_module.dart';
import 'package:donuz_dart_sdk/modules/gifts/models/gift_status_enum.dart';
import '../../establishment/establishment_module.dart';

abstract class ChangeGiftStatus {
  Future<BaseResponseDonuzModel?> call(
      {required int giftRedemptionId,
      required GiftStatus status,
      required int userId});
}

class ChangeGiftStatusImpl implements ChangeGiftStatus {
  final GiftsRepository _repository;
  final FindEstablishmentById _findEstablishmentById;
  ChangeGiftStatusImpl(this._repository, this._findEstablishmentById);

  @override
  Future<BaseResponseDonuzModel?> call(
      {required int giftRedemptionId,
      required GiftStatus status,
      int? userId}) async {
    var establishmentId = await _findEstablishmentById.currentId();

    if (establishmentId == null) {
      return null;
    }

    return await _repository.changeGiftStatus(
      giftRedemptionId: giftRedemptionId,
      status: status.enumToString(),
      userId: userId,
      appId: establishmentId,
    );
  }
}
