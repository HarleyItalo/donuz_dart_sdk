import 'package:intl/intl.dart';

class StringUtil {
  static String onlyNumbers(String? value) {
    return value != null ? value.replaceAll(RegExp(r'[^\d]'), '') : '';
  }

  static String formatData(dynamic value, {format = "dd/MM/yyyy"}) {
    var date = DateTime.tryParse(value);
    if (date != null) {
      var formatter = DateFormat(format);
      value = formatter.format(date);
    }
    return value;
  }

  static double parseStringToDouble(String? value) {
    var isNumber = onlyNumbers(value);
    if (isNumber.isEmpty || value == null || value.isEmpty) {
      return 0.0;
    }
    value = value.replaceAll('.', '').replaceAll(',', '.');
    return double.parse(value);
  }

  static bool emailIsValid(String email) {
    if (isNullOrEmpty(email)) {
      return false;
    }
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static bool isNullOrEmpty(String? value, {int minLenght = 2}) {
    if (value == null || value.isEmpty) {
      return true;
    }
    return value.length < minLenght;
  }
}
