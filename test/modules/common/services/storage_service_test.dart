import 'package:donuz_dart_sdk/modules/common/common_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() async {
  SharedPreferences.setMockInitialValues({});
  final storageService = StorageService(await SharedPreferences.getInstance());
  group("StorageService Tests", () {
    test("Deve retornar false para chave inexistente no storage", () async {
      var response = await storageService.existsKey("xpto");
      expect(response, false);
    });
    test("Deve inserir um item no cache", () async {
      var responseUnserialize =
          await storageService.setData("xpto", "xpta", serialize: false);
      var response =
          await storageService.setData("xpto", "xpta", serialize: true);
      expect(responseUnserialize, true);
      expect(response, true);
    });

    test("Deve inserir um bool no cache", () async {
      var response = await storageService.setBool("logged", true);
      expect(response, true);
    });
    test("Deve buscar um bool no cache", () async {
      SharedPreferences.setMockInitialValues({"logged": true});
      var response = await storageService.getBool("logged");
      expect(response, true);
    });

    test("Deve excluir uma chave do cache", () async {
      SharedPreferences.setMockInitialValues({"drop": true});
      var response = await storageService.dropKey("drop");
      var checkIfExists = await storageService.existsKey("drop");
      expect(checkIfExists, false);
      expect(response, true);
    });

    test("Deve Retornar a chave do cache", () async {
      await storageService.setDataTimmed("teste", "harley",
          time: const Duration(minutes: 2), serialize: false);
      var response = await storageService.existsKey("teste-timmed");
      expect(response, true);
    });

    test("Deve limpar o cache", () async {
      var response = await storageService.clearAll();
      expect(response, true);
    });

    test("Deve buscar o valor do cache temporizado", () async {
      await storageService.setDataTimmed("teste", "harley",
          time: const Duration(seconds: 2), serialize: false);
      var response = await storageService.getStringTimmed("teste");
      expect(response, "harley");
    });
    test("Deve falhar ao buscar uma chave que nao existe", () async {
      var response = await storageService.getStringTimmed("xpto");
      expect(response, null);
    });

    test("Deve falhar ao buscar os dados do cache temporizado.", () async {
      await storageService.setDataTimmed("teste", "harley",
          time: const Duration(milliseconds: 1), serialize: false);
      await Future.delayed(const Duration(milliseconds: 20));
      var response = await storageService.getDataTimmed("teste");

      expect(response, null);
    });
  });
}
