class BaseResponseDonuzModel {
  int? status;
  String? mensagem;

  BaseResponseDonuzModel({this.status, this.mensagem});

  BaseResponseDonuzModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? json['statusCode'];
    mensagem = json['mensagem'] ?? json['message'];
  }
}
