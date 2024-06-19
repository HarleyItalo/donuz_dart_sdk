import 'package:donuz_dart_sdk/modules/delivery_address/delivery_address_module.dart';

import '../../establishment/establishment_module.dart';
import '../../user/user_module.dart';

abstract class CreateDeliveryAddress {
  Future<DeliveryAddressModel?> call({
    required DeliveryAddress deliveryAddress,
  });
}

class CreateDeliveryAddressImpl extends CreateDeliveryAddress {
  final DeliveryAddressRepository _repository;
  final GetLoggedUserToken _getLoggedUserToken;
  final GetLoggedUserId _getLoggedUserId;
  final FindEstablishmentById _findEstablishmentById;

  CreateDeliveryAddressImpl(this._repository, this._getLoggedUserToken,
      this._findEstablishmentById, this._getLoggedUserId);

  @override
  Future<DeliveryAddressModel?> call({
    required DeliveryAddress deliveryAddress,
  }) async {
    var response = await Future.wait([
      _findEstablishmentById.currentId(),
      _getLoggedUserToken(),
      _getLoggedUserId()
    ]);

    for (var element in response) {
      if (element == null) return null;
    }

    deliveryAddress.clienteId = int.parse(response[2].toString());

    return await _repository.createDeliveryAddress(
        deliveryAddress: deliveryAddress,
        appId: response.first!,
        tokenClient: response[1]!);
  }
}
