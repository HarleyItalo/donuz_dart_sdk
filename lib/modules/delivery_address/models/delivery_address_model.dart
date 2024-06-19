class DeliveryAddressModel {
  int? status;
  String? mensagem;

  List<DeliveryAddress>? enderecosEntrega;

  DeliveryAddressModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    mensagem = json['mensagem'];
    if (json['enderecos_entrega'] != null) {
      enderecosEntrega = <DeliveryAddress>[];
      json['enderecos_entrega'].forEach((v) {
        enderecosEntrega!.add(DeliveryAddress.fromJson(v));
      });
    }
  }
}

class DeliveryAddress {
  int? idEnderecoEntrega;
  int? clienteId;
  String? identificacao;
  String? cep;
  String? rua;
  int? numero;
  String? complemento;
  String? bairro;
  String? cidade;
  String? estado;
  String? pais;
  String? pontoReferencia;
  String? telefoneContato;
  bool? deletado;

  DeliveryAddress(
      {this.idEnderecoEntrega,
      this.clienteId,
      this.identificacao,
      this.cep,
      this.rua,
      this.numero,
      this.complemento,
      this.bairro,
      this.cidade,
      this.estado,
      this.pais,
      this.pontoReferencia,
      this.telefoneContato,
      this.deletado});

  DeliveryAddress.fromJson(Map<String, dynamic> json) {
    idEnderecoEntrega = json['id_endereco_entrega'];
    clienteId = json['cliente_id'];
    identificacao = json['identificacao'];
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
    deletado = json['deletado'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_endereco_entrega'] = idEnderecoEntrega;
    data['cliente_id'] = clienteId;
    data['identificacao'] = identificacao;
    data['cep'] = cep;
    data['rua'] = rua;
    data['numero'] = numero;
    data['complemento'] = complemento;
    data['bairro'] = bairro;
    data['cidade'] = cidade;
    data['estado'] = estado;
    data['pais'] = pais;
    data['ponto_referencia'] = pontoReferencia;
    data['telefone_contato'] = telefoneContato;
    data['deletado'] = deletado;
    return data;
  }
}
