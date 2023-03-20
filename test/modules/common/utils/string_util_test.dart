import 'package:donuz_dart_sdk/modules/common/common_module.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("StringUtil", () {
    test("Deve Validar se uma string e vazia", () {
      var response = StringUtil.isNullOrEmpty("");
      expect(response, true);
    });
    test("Deve Validar se uma string nao e vazia", () {
      var response = StringUtil.isNullOrEmpty("essa nao esta vazia");
      expect(response, false);
    });

    test("Deve Validar se uma string e vazia comparando o tamanho minimo", () {
      var response = StringUtil.isNullOrEmpty("ess", minLenght: 4);
      expect(response, true);
    });

    test("Deve se um email e valido", () {
      var response = StringUtil.emailIsValid("teste@donuz.co");
      expect(response, true);
    });
    test("Deve validar um email invalido", () {
      var response = StringUtil.emailIsValid("testedonuz.co");
      expect(response, false);
    });
    test("Deve formatar uma data", () {
      var response = StringUtil.formatData(
        "2023-01-01",
      );
      expect(response, "01/01/2023");
    });
    test("Deve retornar o input", () {
      var response = StringUtil.formatData(
        "2023",
      );
      expect(response, "2023");
    });

    test("Deve converter string para double ", () {
      var response = StringUtil.parseStringToDouble(
        "2023",
      );
      expect(response, 2023);
    });
    test("Deve converter string para double ", () {
      var response = StringUtil.parseStringToDouble(
        "x",
      );
      expect(response, 0.0);
    });
  });
}
