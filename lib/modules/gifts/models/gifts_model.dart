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
  String? primeiroNome;
  String? cpf;
  String? foto;

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
    primeiroNome = json['primeiro_nome'];
    cpf = json['cpf'];
    foto = json['foto'];
  }
}

class GiftsModel {
  int? status;
  String? mensagem;
  int? total;
  List<Presente?>? presentes;
  Presente? presente;

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
    if (json["presente"] != null) {
      presente = Presente.fromJson(json["presente"]);
    }
  }
}
