import 'establishment_model.dart';

class Permissoes {
  bool? whatsapp;
  bool? pushnotification;
  bool? inserirPontos;
  bool? pedidoListar;
  bool? produtoCadastrar;
  bool? presenteDadoListar;
  Permissoes.fromJson(Map<String, dynamic> json) {
    whatsapp = json['whatsapp'];
    pushnotification = json['push_notification'];
    inserirPontos = json['inserirPontos'];
    pedidoListar = json['pedidoListar'];
    produtoCadastrar = json['produtoCadastrar'];
    presenteDadoListar = json['presenteDadoListar'];
  }
}

class AdminModel {
  int? status;
  String? mensagem;
  String? token;
  Permissoes? permissoes;
  Estabelecimento? estabelecimento;
  AdminModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    mensagem = json['mensagem'];
    token = json['token'];
    permissoes = json['permissoes'] != null
        ? Permissoes?.fromJson(json['permissoes'])
        : null;
    estabelecimento = json['estabelecimento'] != null
        ? Estabelecimento?.fromJson(json['estabelecimento'])
        : null;
  }
}
