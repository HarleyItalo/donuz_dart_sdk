import 'package:donuz_dart_sdk/modules/delivery_address/delivery_address_module.dart';

import '../../establishment/establishment_module.dart';
import '../../user/user_module.dart';

abstract class DeleteDeliveryAddress {
  Future<DeliveryAddressModel?> call({
    required int addressId,
  });
}

class DeleteDeliveryAddressImpl extends DeleteDeliveryAddress {
  final DeliveryAddressRepository _repository;
  final GetLoggedUserToken _getLoggedUserToken;
  final FindEstablishmentById _findEstablishmentById;
  final GetLoggedUserId _getLoggedUserId;

  DeleteDeliveryAddressImpl(
    this._repository,
    this._getLoggedUserToken,
    this._findEstablishmentById,
    this._getLoggedUserId,
  );

  @override
  Future<DeliveryAddressModel?> call({
    required int addressId,
  }) async {
    var response = await Future.wait([
      _findEstablishmentById.currentId(),
      _getLoggedUserToken(),
      _getLoggedUserId()
    ]);

    for (var element in response) {
      if (element == null) return null;
    }

    return await _repository.deleteAddress(
        addressId: addressId,
        userId: int.parse(response[2].toString()),
        appId: response.first!,
        tokenClient: response[1]!);
  }
}
