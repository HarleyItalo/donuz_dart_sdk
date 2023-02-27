class LoginModel {
  int? status;
  String? mensagem;
  String? token;
  int? cliente;
  List<int>? ids;

  LoginModel({
    this.status,
    this.mensagem,
    this.token,
    this.cliente,
    this.ids,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    mensagem = json['mensagem'];
    token = json['token'];
    cliente = json['cliente'];
    if (json['ids'] != null) ids = json['ids'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['cliente'] = cliente;
    data['ids'] = ids;
    return data;
  }
}
