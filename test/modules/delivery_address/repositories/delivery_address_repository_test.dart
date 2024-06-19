import 'dart:convert';

import 'package:donuz_dart_sdk/modules/common/common_module.dart';
import 'package:donuz_dart_sdk/modules/delivery_address/models/delivery_address_model.dart';

import 'package:donuz_dart_sdk/modules/delivery_address/repositories/delivery_address_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/default_response_json.dart';

import '../../../json/delivery_address/get_all_delivery_address_json.dart';
import '../../../mocks/common/services/http_service_mock.dart';

void main() async {
  HttpService httpService = HttpServiceMock();
  var repository = DeliveryAddressRepositoryImpl(httpService);
  group("DeliveryAddressRepository", () {
    test("Deve cadastrar um endereco de entrega", () async {
      var address = DeliveryAddress(
        bairro: 'a',
        cep: '123',
        cidade: 'a',
        clienteId: 123,
        complemento: 'a',
        estado: 'mg',
        identificacao: 'a',
        numero: 1,
        pais: 'Brasil',
        rua: 'a',
        pontoReferencia: 'a',
        telefoneContato: '333',
      );

      when(
        () => httpService.post(
            "delivery-addresses/client/123", address.toJson(),
            appId: "2234", tokenCliente: '123'),
      ).thenAnswer(
        (_) async => jsonDecode(defaultResponseJson),
      );

      var response = repository.createDeliveryAddress(
          deliveryAddress: address, tokenClient: '123', appId: '2234');

      expect(response, isNotNull);
    });

    test("Deve deletar um endereco de entrega", () async {
      when(
        () => httpService.delete(
          "delivery-addresses/123/client/1234",
          appId: "2234",
          tokenCliente: '123',
        ),
      ).thenAnswer(
        (_) async => jsonDecode(defaultResponseJson),
      );
      var response = repository.deleteAddress(
          addressId: 123, userId: 1234, tokenClient: '123', appId: '2234');

      expect(response, isNotNull);
    });

    test("Deve setar como padrão um endereco de entrega", () async {
      when(
        () => httpService.put(
          "clients/123/default-delivery-address",
          {"endereco_entrega_id": 123},
          appId: "2234",
          tokenCliente: '123',
        ),
      ).thenAnswer(
        (_) async => jsonDecode(defaultResponseJson),
      );

      var response = repository.setAddressAsDefault(
          addressId: 123, userId: 123, tokenClient: '123', appId: '2234');

      expect(response, isNotNull);
    });

    test("Deve buscar todos os enderecos de entrega de um cliente", () async {
      when(
        () => httpService.get(
          "delivery-addresses/client/123",
          appId: "2234",
          tokenCliente: '123',
        ),
      ).thenAnswer(
        (_) async => jsonDecode(getAllDeliveryAddressJson),
      );

      var response = await repository.getAllAddress(
          userId: 123, tokenClient: '123', appId: '2234');

      expect(response, isNotNull);
      expect(response.enderecosEntrega, isNotEmpty);
    });
  });
}
