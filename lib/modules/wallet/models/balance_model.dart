class BalanceModel {
  String? saldo;
  String? erro;

  BalanceModel({this.saldo});

  BalanceModel.fromJson(Map<String, dynamic> json) {
    saldo = json['saldo'];
    erro = json['erro'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['saldo'] = saldo;
    return data;
  }
}
