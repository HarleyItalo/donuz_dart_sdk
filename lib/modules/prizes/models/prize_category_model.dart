class Categoria {
  int? idcat;
  String? categoria;
  String? imagem;
  Categoria.fromJson(Map<String, dynamic> json) {
    idcat = json['id_cat'];
    categoria = json['categoria'];
    imagem = json['imagem'];
  }
}

class PrizeCategoryModel {
  int? status;
  String? mensagem;
  int? total;
  List<Categoria?>? categorias;
  PrizeCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    mensagem = json['mensagem'];
    total = json['total'];
    if (json['categorias'] != null) {
      categorias = <Categoria>[];
      json['categorias'].forEach((v) {
        categorias!.add(Categoria.fromJson(v));
      });
    }
  }
}
