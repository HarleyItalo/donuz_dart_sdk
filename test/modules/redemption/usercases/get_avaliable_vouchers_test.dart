import 'dart:convert';
import 'package:donuz_dart_sdk/modules/common/common_module.dart';
import 'package:donuz_dart_sdk/modules/redemption/redemption_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../json/redemptions/redemptions_json.dart';

import '../../../mocks/redemption/usercases/get_all_rescues_mock.dart';

main() {
  final getAllRescuesMock = GetAllRescuesMock();
  final GetAvaliableVouchers getAvaliableVouchers =
      GetAvaliableVouchersImpl(getAllRescuesMock);
  group("getAllRescues", () {
    test("Deve retornar uma lista de resgates", () async {
      when(
        () => getAllRescuesMock(),
      ).thenAnswer((_) async {
        var response =
            RescueModel.fromJson(jsonDecode(redemptionsJson)).resgates;
        response!.first.idStatus = 1;
        response.first.dataVencimento = StringUtil.formatData(
            DateTime.now().add(const Duration(days: 2)).toString(),
            format: 'yyyy-MM-dd');
        return response;
      });

      var response = await getAvaliableVouchers();
      expect(response, isNotNull);
    });
    test("Deve retornar uma lista de resgates", () async {
      when(
        () => getAllRescuesMock(),
      ).thenAnswer((_) async {
        return null;
      });

      var response = await getAvaliableVouchers();
      expect(response, isNull);
    });
  });
}
