class BalanceModel {
  dynamic saldo;
  String? erro;

  BalanceModel.fromJson(Map<String, dynamic> json) {
    saldo = json['saldo'];
    erro = json['erro'];
  }
}
