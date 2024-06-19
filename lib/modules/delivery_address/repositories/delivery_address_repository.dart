import 'package:donuz_dart_sdk/modules/common/common_module.dart';
import 'package:donuz_dart_sdk/modules/delivery_address/models/delivery_address_model.dart';

abstract class DeliveryAddressRepository {
  Future<DeliveryAddressModel> getAllAddress({
    required int userId,
    required String appId,
    required String tokenClient,
  });

  Future<DeliveryAddressModel> setAddressAsDefault({
    required int addressId,
    required int userId,
    required String appId,
    required String tokenClient,
  });

  Future<DeliveryAddressModel> createDeliveryAddress(
      {required DeliveryAddress deliveryAddress,
      required String appId,
      required String tokenClient});

  Future<DeliveryAddressModel> deleteAddress({
    required int addressId,
    required int userId,
    required String appId,
    required String tokenClient,
  });
}

class DeliveryAddressRepositoryImpl extends DeliveryAddressRepository {
  final HttpService httpService;

  DeliveryAddressRepositoryImpl(this.httpService);

  @override
  Future<DeliveryAddressModel> getAllAddress({
    required int userId,
    required String appId,
    required String tokenClient,
  }) async {
    var result = await httpService.get("delivery-addresses/client/$userId",
        tokenCliente: tokenClient, appId: appId);

    return DeliveryAddressModel.fromJson(result);
  }

  @override
  Future<DeliveryAddressModel> setAddressAsDefault({
    required int addressId,
    required int userId,
    required String appId,
    required String tokenClient,
  }) async {
    var result = await httpService.put(
      "clients/$userId/default-delivery-address",
      {"endereco_entrega_id": addressId},
      appId: appId,
      tokenCliente: tokenClient,
    );

    return DeliveryAddressModel.fromJson(result);
  }

  @override
  Future<DeliveryAddressModel> deleteAddress({
    required int addressId,
    required int userId,
    required String appId,
    required String tokenClient,
  }) async {
    var result = await httpService.delete(
      "delivery-addresses/$addressId/client/$userId",
      appId: appId,
      tokenCliente: tokenClient,
    );

    return DeliveryAddressModel.fromJson(result);
  }

  @override
  Future<DeliveryAddressModel> createDeliveryAddress({
    required DeliveryAddress deliveryAddress,
    required String appId,
    required String tokenClient,
  }) async {
    var json = await httpService.post(
        "delivery-addresses/client/${deliveryAddress.clienteId}",
        deliveryAddress.toJson(),
        appId: appId,
        tokenCliente: tokenClient);

    return DeliveryAddressModel.fromJson(json);
  }
}
