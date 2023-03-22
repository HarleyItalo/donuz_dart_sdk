class PointsModel {
  int? status;
  String? mensagem;
  int? total;
  List<Pontos>? pontos;

  PointsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    mensagem = json['mensagem'];
    total = json['total'];
    if (json['pontos'] != null) {
      pontos = <Pontos>[];
      json['pontos'].forEach((v) {
        pontos!.add(Pontos.fromJson(v));
      });
    }
  }
}

class Pontos {
  dynamic idExtrato;
  dynamic estabelecimentoId;
  dynamic clienteId;
  String? data;
  String? dataExpira;
  String? dataInsercao;
  String? descricao;
  dynamic obsExtra;
  String? produtoCodigo;
  dynamic valorReais;
  dynamic valorDonuz;
  dynamic valorRestante;
  dynamic regraId;
  String? nomeRegra;
  String? operacao;
  String? referencia;
  dynamic idPedido;
  dynamic idExtratoDebitado;
  String? origem;
  dynamic filialId;
  dynamic usuarioId;
  String? controle;
  dynamic idExtratoEstorno;
  String? tipo;
  dynamic tmpMigrado;
  dynamic idPontosPendentes;
  String? dataAtualizacao;
  dynamic filial;

  Pontos.fromJson(Map<String, dynamic> json) {
    idExtrato = json['id_extrato'];
    estabelecimentoId = json['estabelecimento_id'];
    clienteId = json['cliente_id'];
    data = json['data'];
    dataExpira = json['data_expira'];
    dataInsercao = json['data_insercao'];
    descricao = json['descricao'];
    obsExtra = json['obs_extra'];
    produtoCodigo = json['produto_codigo'];
    valorReais = json['valor_reais'];
    valorDonuz = json['valor_donuz'];
    valorRestante = json['valor_restante'];
    regraId = json['regra_id'];
    nomeRegra = json['nome_regra'];
    operacao = json['operacao'];
    referencia = json['referencia'];
    idPedido = json['id_pedido'];
    idExtratoDebitado = json['id_extrato_debitado'];
    origem = json['origem'];
    filialId = json['filial_id'];
    usuarioId = json['usuario_id'];
    controle = json['controle'];
    idExtratoEstorno = json['id_extrato_estorno'];
    tipo = json['tipo'];
    tmpMigrado = json['tmp_migrado'];
    idPontosPendentes = json['id_pontos_pendentes'];
    dataAtualizacao = json['data_atualizacao'];
    filial = json['filial'];
  }
}
