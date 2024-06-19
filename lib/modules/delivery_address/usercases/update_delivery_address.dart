import 'package:donuz_dart_sdk/modules/delivery_address/delivery_address_module.dart';

import '../../establishment/establishment_module.dart';
import '../../user/user_module.dart';

abstract class UpdateDeliveryAddress {
  Future<DeliveryAddressModel?> call(
      {required int deliveryAddressId,
      required DeliveryAddress deliveryAddress});
}

class UpdateDeliveryAddressImpl extends UpdateDeliveryAddress {
  final DeliveryAddressRepository _repository;
  final GetLoggedUserToken _getLoggedUserToken;
  final FindEstablishmentById _findEstablishmentById;
  final GetLoggedUserId _getLoggedUserId;

  UpdateDeliveryAddressImpl(this._repository, this._getLoggedUserToken,
      this._findEstablishmentById, this._getLoggedUserId);

  @override
  Future<DeliveryAddressModel?> call(
      {required int deliveryAddressId,
      required DeliveryAddress deliveryAddress}) async {
    var response = await Future.wait([
      _findEstablishmentById.currentId(),
      _getLoggedUserToken(),
      _getLoggedUserId()
    ]);

    for (var element in response) {
      if (element == null) return null;
    }

    await _repository.deleteAddress(
        addressId: deliveryAddressId,
        userId: int.parse(response[2]!),
        appId: response.first!,
        tokenClient: response[1]!);

    deliveryAddress.clienteId = int.parse(response[2]!);

    return _repository.createDeliveryAddress(
        deliveryAddress: deliveryAddress,
        appId: response.first!,
        tokenClient: response[1]!);
  }
}
