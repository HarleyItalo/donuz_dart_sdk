import 'dart:convert';
import 'package:donuz_dart_sdk/modules/common/extensions/enun_extension.dart';
import 'package:donuz_dart_sdk/modules/common/models/base_response_donuz_model.dart';
import 'package:donuz_dart_sdk/modules/gifts/models/gift_status_enum.dart';
import 'package:donuz_dart_sdk/modules/gifts/usercases/change_gift_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../json/gift/get_gifts_json.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/gift/gift_repository_mock.dart';

void main() {
  var repository = GiftRepositoryMock();
  var findEstablishmentByIdMock = FindEstablismentByIdMock();

  var changeGiftStatus =
      ChangeGiftStatusImpl(repository, findEstablishmentByIdMock);
  group("ChangeGiftStatus", () {
    test("Deve trocar o status de um voucher ", () async {
      when(
        () => findEstablishmentByIdMock.currentId(),
      ).thenAnswer(
        (_) async => '2234',
      );

      when(
        () => repository.changeGiftStatus(
            giftRedemptionId: 123,
            appId: "2234",
            status: GiftStatus.utilizado.enumToString(),
            userId: 123),
      ).thenAnswer(
        (_) async => BaseResponseDonuzModel.fromJson(
          jsonDecode(getGiftsJson),
        ),
      );

      var response = await changeGiftStatus(
          giftRedemptionId: 123, status: GiftStatus.utilizado, userId: 123);

      expect(response, isNotNull);
    });
  });
}
