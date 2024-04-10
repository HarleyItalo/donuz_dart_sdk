class CustomConfigModel {
  int? status;
  String? mensagem;
  Map<String, dynamic>? data;

  CustomConfigModel({this.status, this.mensagem});

  CustomConfigModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    mensagem = json['mensagem'];
    data = json["data"];
  }
}
