class PrizeInfo {
  int? idproduto;
  int? estabelecimentoid;
  String? produtocontrole;
  String? produto;
  int? categoria;
  String? subcategoria;
  String? desbreve;
  String? subcategoriaold;
  String? tipoderesgate;
  String? regras;
  String? status;
  dynamic precoDonuz;
  String? imagemPrincipal;
  String? imagemApp;
  dynamic precoReais;
  dynamic peso;
  dynamic altura;
  dynamic largura;
  String? comprimento;
  String? codigo;
  String? tags;
  String? datapublicacao;
  String? estoque;
  String? estoquepadrao;
  String? dataatualizacao;
  int? visibilidade;
  String? tamanho;
  String? doacao;
  int? resgateunico;
  int? deleted;
  String? giftcardvalue;
  String? parceirogiftcard;
  String? cupomid;
  List<String?>? imagensAdicionais;

  PrizeInfo.fromJson(Map<String, dynamic> json) {
    idproduto = json['id_produto'];
    estabelecimentoid = json['estabelecimento_id'];
    produtocontrole = json['produto_controle'];
    produto = json['produto'];
    categoria = json['categoria'];
    subcategoria = json['subcategoria'];
    desbreve = json['des_breve'];
    subcategoriaold = json['subcategoria_old'];
    tipoderesgate = json['tipo_de_resgate'];
    regras = json['regras'];
    status = json['status'];
    precoDonuz = json['precoDonuz'];
    imagemPrincipal = json['imagemPrincipal'];
    imagemApp = json['imagemApp'];
    precoReais = json['precoReais'];
    peso = json['peso'];
    altura = json['altura'];
    largura = json['largura'];
    comprimento = json['comprimento'];
    codigo = json['codigo'];
    tags = json['tags'];
    datapublicacao = json['data_publicacao'];
    estoque = json['estoque'];
    estoquepadrao = json['estoque_padrao'];
    dataatualizacao = json['data_atualizacao'];
    visibilidade = json['visibilidade'];
    tamanho = json['tamanho'];
    doacao = json['doacao'];
    resgateunico = json['resgate_unico'];
    deleted = json['deleted'];
    giftcardvalue = json['giftcard_value'];
    parceirogiftcard = json['parceiro_giftcard'];
    cupomid = json['cupom_id'];
    if (json['imagensAdicionais'] != null) {
      imagensAdicionais = <String?>[];
      json['imagensAdicionais'].forEach((v) {
        imagensAdicionais!.add(v);
      });
    }
  }
}

class PrizeInfoModel {
  PrizeInfo? prize;
  PrizeInfoModel.fromJson(Map<String, dynamic> json) {
    prize = json['prize'] != null ? PrizeInfo?.fromJson(json['prize']) : null;
  }
}
