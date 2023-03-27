class PrizeModel {
  int? total;
  List<Prize>? premios;

  PrizeModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['premios'] != null) {
      premios = <Prize>[];
      json['premios'].forEach((v) {
        premios!.add(Prize.fromJson(v));
      });
    }
  }
}

class Prize {
  int? idProduto;
  String? produto;
  String? desBreve;
  String? tags;
  String? imagemPrincipal;
  String? categoria;
  String? subcategoria;
  dynamic precoDonuz;
  dynamic precoReais;
  dynamic estoque;
  String? regras;
  String? status;

  Prize.fromJson(Map<String, dynamic> json) {
    idProduto = json['id_produto'];
    produto = json['produto'];
    desBreve = json['des_breve'];
    tags = json['tags'];
    imagemPrincipal = json['imagemPrincipal'];
    categoria = json['categoria'];
    subcategoria = json['subcategoria'];
    precoDonuz = json['precoDonuz'];
    precoReais = json['precoReais'];
    estoque = json['estoque'];
    regras = json['regras'];
    status = json['status'];
  }
}
