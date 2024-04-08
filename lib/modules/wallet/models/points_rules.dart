class Regra {
  int? idregra;
  String? nomeregra;
  dynamic umrealequivale;
  int? estabelecimentoid;
  String? arredonda;
  String? tipo;
  String? codigoproduto;
  Regra.fromJson(Map<String, dynamic> json) {
    idregra = json['id_regra'];
    nomeregra = json['nome_regra'];
    umrealequivale = json['um_real_equivale'];
    estabelecimentoid = json['estabelecimento_id'];
    arredonda = json['arredonda'];
    tipo = json['tipo'];
    codigoproduto = json['codigo_produto'];
  }
}

class PointsRulesModel {
  int? status;
  String? mensagem;
  List<Regra?>? regras;
  PointsRulesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    mensagem = json['mensagem'];
    if (json['regras'] != null) {
      regras = <Regra>[];
      json['regras'].forEach((v) {
        regras!.add(Regra.fromJson(v));
      });
    }
  }
}
