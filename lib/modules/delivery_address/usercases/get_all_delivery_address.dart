import 'package:donuz_dart_sdk/modules/delivery_address/delivery_address_module.dart';

import '../../establishment/establishment_module.dart';
import '../../user/user_module.dart';

abstract class GetAllDeliveryAddress {
  Future<DeliveryAddressModel?> call();
}

class GetAllDeliveryAddressImpl extends GetAllDeliveryAddress {
  final DeliveryAddressRepository _repository;
  final GetLoggedUserToken _getLoggedUserToken;
  final FindEstablishmentById _findEstablishmentById;
  final GetLoggedUserId _getLoggedUserId;

  GetAllDeliveryAddressImpl(this._repository, this._getLoggedUserToken,
      this._findEstablishmentById, this._getLoggedUserId);

  @override
  Future<DeliveryAddressModel?> call() async {
    var response = await Future.wait([
      _findEstablishmentById.currentId(),
      _getLoggedUserToken(),
      _getLoggedUserId()
    ]);

    for (var element in response) {
      if (element == null) return null;
    }

    return _repository.getAllAddress(
      userId: int.parse(response[2]!),
      appId: response.first!,
      tokenClient: response[1]!,
    );
  }
}
