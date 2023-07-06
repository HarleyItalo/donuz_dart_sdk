class BannerModel {
  List<Banners> banners = <Banners>[];
  BannerModel.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners.add(Banners.fromJson(v));
      });
    }
  }
}

class Banners {
  int? idBanner;
  late String nome;
  late String descricao;
  String? local;
  late String imagem;
  String? link;
  int? estabelecimentoId;
  Banners.fromJson(Map<String, dynamic> json) {
    idBanner = json['id_banner'];
    nome = json['nome'];
    descricao = json['descricao'];
    local = json['local'];
    imagem = json['imagem'];
    link = json['link'];
    estabelecimentoId = json['estabelecimento_id'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_banner'] = idBanner;
    data['nome'] = nome;
    data['descricao'] = descricao;
    data['local'] = local;
    data['imagem'] = imagem;
    data['link'] = link;
    data['estabelecimento_id'] = estabelecimentoId;
    return data;
  }
}
