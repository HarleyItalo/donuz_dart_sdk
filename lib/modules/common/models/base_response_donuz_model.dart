class BaseResponseDonuzModel {
  int? status;
  String? mensagem;

  BaseResponseDonuzModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    mensagem = json['mensagem'];
  }
}
