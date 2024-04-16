class EstabelishmentModel {
  int? status;
  String? mensagem;
  int? total;
  List<Estabelecimento> estabelecimentos = <Estabelecimento>[];
  Estabelecimento? estabelecimento;

  EstabelishmentModel.fromJson(Map<String, dynamic> json) {
    estabelecimento = json['estabelecimento'] != null
        ? Estabelecimento.fromJson(json['estabelecimento'])
        : null;
    if (json['estabelecimentos'] != null) {
      estabelecimentos = <Estabelecimento>[];
      json['estabelecimentos'].forEach((v) {
        estabelecimentos.add(Estabelecimento.fromJson(v));
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
  int? idFilial;
  int? idUsuario;
  String? nome;
  String? gmEnderecoCompleto;

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
    gmEnderecoCompleto = json['gm_endereco_completo'];
    telefone = json['telefone'];
    idFilial = json['id_filial'];
    idUsuario = json['id_usuario'];
    nome = json['nome'];
  }
}
