class EstabelishmentModel {
  int? status;
  String? mensagem;
  int? total;
  List<Estabelecimento>? estabelecimentos;
  Estabelecimento? estabelecimento;

  EstabelishmentModel.fromJson(Map<String, dynamic> json) {
    estabelecimento = json['estabelecimento'] != null
        ? Estabelecimento.fromJson(json['estabelecimento'])
        : null;
    if (json['estabelecimentos'] != null) {
      estabelecimentos = <Estabelecimento>[];
      json['estabelecimentos'].forEach((v) {
        estabelecimentos!.add(Estabelecimento.fromJson(v));
      });
    }
  }
}

class Estabelecimento {
  int? idAdmin;
  late String moeda;
  String? estabelecimento;
  String? logo;
  String? status;
  dynamic distancia;
  String? latitude;
  String? longitude;
  String? endereco;
  String? slug;
  dynamic telefone;

  Estabelecimento.fromJson(Map<String, dynamic> json) {
    idAdmin = json['id_admin'];
    moeda = (json['moeda'] != null) ? json['moeda'] : 'pontos';
    estabelecimento = json['estabelecimento'];
    logo = json['logo'];
    status = json['status'];
    distancia = json['distancia'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    slug = json['slug'];
    endereco = json['endereco'];
    telefone = json['telefone'];
  }
}
