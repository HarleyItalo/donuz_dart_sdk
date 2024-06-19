import 'dart:convert';

import 'package:donuz_dart_sdk/modules/delivery_address/delivery_address_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../json/default_response_json.dart';
import '../../../mocks/delivery_address/delivery_address_repository_mock.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';

import '../../../mocks/user/user_cases/get_logged_user_id_mock.dart';
import '../../../mocks/user/user_cases/get_logged_user_token_mock.dart';

void main() {
  var repository = DeliveryAddressRepositoryMock();
  var findEstablishmentByIdMock = FindEstablismentByIdMock();
  var getLoggedUserTokenMock = GetLoggedUserTokenMock();
  var getLoggedUserIdMock = GetLoggedUserIdMock();

  var deleteDeliveryAddress = DeleteDeliveryAddressImpl(
    repository,
    getLoggedUserTokenMock,
    findEstablishmentByIdMock,
    getLoggedUserIdMock,
  );

  group("DeleteDeliveryAddress", () {
    test("Deve deletar um endereco de entrega", () async {
      when(
        () => findEstablishmentByIdMock.currentId(),
      ).thenAnswer(
        (_) async => '2234',
      );

      when(
        () => getLoggedUserTokenMock(),
      ).thenAnswer(
        (_) async => '123',
      );

      when(
        () => getLoggedUserIdMock(),
      ).thenAnswer(
        (_) async => '1234',
      );

      when(
        () => repository.deleteAddress(
            addressId: 1234, userId: 1234, appId: '2234', tokenClient: '123'),
      ).thenAnswer(
        (_) async => DeliveryAddressModel.fromJson(
          jsonDecode(defaultResponseJson),
        ),
      );

      var response = await deleteDeliveryAddress(addressId: 1234);

      expect(response, isNotNull);
    });
  });
}
