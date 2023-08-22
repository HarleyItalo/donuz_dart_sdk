class Filial {
  int? idfilial;
  String? filial;
  dynamic cnpj;
  String? logo;
  String? email;
  dynamic telefone;
  String? endereco;
  dynamic numero;
  String? complemento;
  String? bairro;
  String? cidade;
  String? estado;
  dynamic cep;
  String? descricao;
  Filial.fromJson(Map<String, dynamic> json) {
    idfilial = json['id_filial'];
    filial = json['filial'];
    cnpj = json['cnpj'];
    logo = json['logo'];
    email = json['email'];
    telefone = json['telefone'];
    endereco = json['endereco'];
    numero = json['numero'];
    complemento = json['complemento'];
    bairro = json['bairro'];
    cidade = json['cidade'];
    estado = json['estado'];
    cep = json['cep'];
    descricao = json['descricao'];
  }
}

class BranchModel {
  int? status;
  String? mensagem;
  int? total;
  List<Filial>? filiais;
  BranchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    mensagem = json['mensagem'];
    total = json['total'];
    if (json['filiais'] != null) {
      filiais = <Filial>[];
      json['filiais'].forEach((v) {
        filiais!.add(Filial.fromJson(v));
      });
    }
  }
}
