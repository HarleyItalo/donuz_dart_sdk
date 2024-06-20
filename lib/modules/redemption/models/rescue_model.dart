class RescueModel {
  int? status;
  String? mensagem;
  int? total;
  Rescue? rescue;
  List<Rescue>? resgates;

  RescueModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    mensagem = json['mensagem'];
    total = json['total'];
    rescue =
        (json['resgate'] != null) ? Rescue.fromJson(json['resgate']) : null;
    if (json['resgates'] != null) {
      resgates = <Rescue>[];
      json['resgates'].forEach((v) {
        resgates!.add(Rescue.fromJson(v));
      });
    }
  }
}

class Rescue {
  int? idPedido;
  String? produto;
  dynamic precoReais;
  dynamic tags;
  int? idProduto;
  dynamic codigo;
  String? desBreve;
  String? regras;
  String? imagemPrincipal;
  int? qtd;
  String? precoVendido;
  String? data;
  String? dataVencimento;
  int? idStatus;
  String? statusNome;
  dynamic tamanho;
  String? barcode;
  String? qrcode;
  dynamic numeroGiftcard;
  dynamic senhaGiftcard;
  dynamic giftcardValue;
  String? primeiroNome;
  String? cpf;
  String? foto;
  dynamic enderecoEntregaId;
  String? linkRastreio;
  String? cep;
  String? rua;
  dynamic numero;
  String? complemento;
  String? bairro;
  String? cidade;
  String? estado;
  String? pais;
  String? pontoReferencia;
  String? telefoneContato;

  Rescue.fromJson(Map<String, dynamic> json) {
    idPedido = json['id_pedido'];
    produto = json['produto'];
    precoReais = json['precoReais'];
    tags = json['tags'];
    idProduto = json['id_produto'];
    codigo = json['codigo'];
    desBreve = json['des_breve'];
    regras = json['regras'];
    imagemPrincipal = json['imagemPrincipal'];
    qtd = json['qtd'];
    precoVendido = json['preco_vendido'];
    data = json['data'];
    dataVencimento = json['data_vencimento'];
    idStatus = json['id_status'];
    statusNome = json['status_nome'];
    tamanho = json['tamanho'];
    barcode = json['barcode'];
    qrcode = json['qrcode'];
    numeroGiftcard = json['numero_giftcard'];
    senhaGiftcard = json['senha_giftcard'];
    giftcardValue = json['giftcard_value'];
    primeiroNome = json['primeiro_nome'];
    cpf = json['cpf'];
    foto = json['foto'];
    enderecoEntregaId = json['endereco_entrega_id'];
    linkRastreio = json['link_rastreio'];
    cep = json['cep'];
    rua = json['rua'];
    numero = json['numero'];
    complemento = json['complemento'];
    bairro = json['bairro'];
    cidade = json['cidade'];
    estado = json['estado'];
    pais = json['pais'];
    pontoReferencia = json['ponto_referencia'];
    telefoneContato = json['telefone_contato'];
  }
}
