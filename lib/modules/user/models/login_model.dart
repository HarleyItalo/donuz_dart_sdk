class LoginModel {
  int? status;
  String? mensagem;
  String? token;
  int? cliente;
  List<int>? ids;
  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    mensagem = json['mensagem'];
    token = json['token'];
    cliente = json['cliente'];
    if (json['ids'] != null) ids = json['ids'].cast<int>();
  }
}
