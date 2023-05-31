class Notificacao {
  int? id;
  String? mensagem;
  int? idcliente;
  String? idmensagem;
  int? recebida;
  int? visualizada;
  int? respondido;
  int? estabelecimentoid;
  String? titulo;
  String? linkimagem;
  String? tipo;
  String? dataenvio;
  String? idagendamento;
  int? mensagemid;
  String? link;
  Notificacao.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mensagem = json['mensagem'];
    idcliente = json['id_cliente'];
    idmensagem = json['id_mensagem'];
    recebida = json['recebida'];
    visualizada = json['visualizada'];
    respondido = json['respondido'];
    estabelecimentoid = json['estabelecimento_id'];
    titulo = json['titulo'];
    linkimagem = json['link_imagem'];
    tipo = json['tipo'];
    dataenvio = json['data_envio'];
    idagendamento = json['id_agendamento'];
    mensagemid = json['mensagem_id'];
    link = json['link'];
  }
}

class UserNotificationModel {
  int? status;
  int? total;
  List<Notificacao?>? notificacoes;
  UserNotificationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    total = json['total'];
    if (json['notificacoes'] != null) {
      notificacoes = <Notificacao>[];
      json['notificacoes'].forEach((v) {
        notificacoes!.add(Notificacao.fromJson(v));
      });
    }
  }
}
