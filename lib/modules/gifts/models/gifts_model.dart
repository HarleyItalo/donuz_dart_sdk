class Presente {
  int? idpresenteresgate;
  String? presente;
  String? descricao;
  String? regras;
  String? imagem;
  int? qtd;
  String? data;
  String? status;
  String? barcode;
  String? qrcode;

  Presente.fromJson(Map<String, dynamic> json) {
    idpresenteresgate = json['id_presente_resgate'];
    presente = json['presente'];
    descricao = json['descricao'];
    regras = json['regras'];
    imagem = json['imagem'];
    qtd = json['qtd'];
    data = json['data'];
    status = json['status'];
    barcode = json['barcode'];
    qrcode = json['qrcode'];
  }
}

class GiftsModel {
  int? status;
  String? mensagem;
  int? total;
  List<Presente?>? presentes;

  GiftsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    mensagem = json['mensagem'];
    total = json['total'];
    if (json['presentes'] != null) {
      presentes = <Presente>[];
      json['presentes'].forEach((v) {
        presentes!.add(Presente.fromJson(v));
      });
    }
  }
}
