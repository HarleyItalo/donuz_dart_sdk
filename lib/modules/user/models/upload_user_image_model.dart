class UploadUserImageModel {
  int? status;
  String? mensagem;
  String? sucesso;
  String? link;

  UploadUserImageModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    mensagem = json['mensagem'];
    sucesso = json['sucesso'];
    link = json['link'];
  }
}
