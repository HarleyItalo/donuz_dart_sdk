class CustomConfigModel {
  int? status;
  String? mensagem;
  Map<String, dynamic>? data;

  CustomConfigModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    mensagem = json['mensagem'];
    data = json["data"];
  }
}
