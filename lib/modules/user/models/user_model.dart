class UserModel {
  dynamic status;
  dynamic message;
  User? client;

  UserModel.fromJson(
    Map<String, dynamic> json,
  ) {
    status = json['status'];
    message = json['message'];
    client = json['cliente'] != null ? User.fromJson(json['cliente']) : null;
  }
}

class User {
  dynamic idCliente;
  String? primeiroNome;
  String? segundoNome;
  String? cpf;
  String? codigoCliente;
  dynamic estabelecimentoOrigem;
  String? foto;
  String? email;
  String? telefone;
  String? celular;
  String? endereco;
  String? numero;
  String? complemento;
  String? bairro;
  String? cidade;
  String? estado;
  String? pais;
  String? gmEnderecoCompleto;
  String? cep;
  String? dataNascimento;
  String? dataCadastro;
  String? sexo;
  String? timeTorce;
  String? escolaridade;
  String? profissao;
  dynamic rendaMensal;
  String? tipoDeCliente;
  String? filial;
  String? senha;
  String? confirmacaoSenha;
  Categoria? categoria;
  CamposAdicionais? camposAdicionais = CamposAdicionais();

  User(
      {idCliente,
      primeiroNome,
      segundoNome,
      cpf,
      codigoCliente,
      estabelecimentoOrigem,
      foto,
      email,
      telefone,
      celular,
      endereco,
      numero,
      complemento,
      bairro,
      cidade,
      estado,
      pais,
      gmEnderecoCompleto,
      cep,
      dataNascimento,
      dataCadastro,
      sexo,
      timeTorce,
      escolaridade,
      profissao,
      rendaMensal,
      tipoDeCliente,
      camposAdicionais,
      filial,
      categoria,
      senha});

  User.fromJson(Map<String, dynamic> json) {
    idCliente = json['id_cliente'];
    primeiroNome = json['primeiro_nome'];
    segundoNome = json['segundo_nome'];
    cpf = json['cpf'];
    codigoCliente = json['codigo_cliente'];
    estabelecimentoOrigem = json['estabelecimento_origem'];
    foto = json['foto'];
    email = json['email'];
    telefone = json['telefone'];
    celular = json['celular'];
    endereco = json['endereco'];
    numero = json['numero'];
    complemento = json['complemento'];
    bairro = json['bairro'];
    cidade = json['cidade'];
    estado = json['estado'];
    pais = json['pais'];
    gmEnderecoCompleto = json['gm_endereco_completo'];
    cep = json['cep'];
    dataNascimento = json['data_nascimento'];
    dataCadastro = json['data_cadastro'];
    sexo = json['sexo'];
    timeTorce = json['time_torce'];
    escolaridade = json['escolaridade'];
    profissao = json['profissao'];
    rendaMensal = json['renda_mensal'];
    tipoDeCliente = json['tipo_de_cliente'];
    filial = json['filial'];
    categoria = json['categoria'] != null
        ? Categoria.fromJson(json['categoria'])
        : null;
    if (json['camposAdicionais'] is List<dynamic> ||
        json['camposAdicionais'] == null) {
      return;
    }
    var camposAd = json['camposAdicionais'] as Map<dynamic, dynamic>;
    camposAdicionais = json['camposAdicionais'] != null && camposAd.isNotEmpty
        ? CamposAdicionais.fromJson(json['camposAdicionais'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_cliente'] = idCliente;
    data['primeiro_nome'] = primeiroNome;
    data['segundo_nome'] = segundoNome;
    data['cpf'] = cpf;
    data['codigo_cliente'] = codigoCliente;
    data['estabelecimento_origem'] = estabelecimentoOrigem;
    data['foto'] = foto;
    data['email'] = email;
    data['telefone'] = telefone;
    data['celular'] = celular;
    data['endereco'] = endereco;
    data['numero'] = numero;
    data['complemento'] = complemento;
    data['bairro'] = bairro;
    data['cidade'] = cidade;
    data['estado'] = estado;
    data['pais'] = pais;
    data['gm_endereco_completo'] = gmEnderecoCompleto;
    data['cep'] = cep;
    data['data_nascimento'] = dataNascimento;
    data['data_cadastro'] = dataCadastro;
    data['sexo'] = sexo;
    data['time_torce'] = timeTorce;
    data['escolaridade'] = escolaridade;
    data['profissao'] = profissao;
    data['renda_mensal'] = rendaMensal;
    data['tipo_de_cliente'] = tipoDeCliente;
    data['senha'] = senha;
    data['filial'] = filial;

    if (camposAdicionais != null) {
      data['camposAdicionais'] = camposAdicionais?.toJson();
    }
    return data;
  }
}

class Categoria {
  String? titulo;
  dynamic multiplicador;
  int? idClienteCategoria;

  Categoria.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
    multiplicador = json['multiplicador'];
    idClienteCategoria = json['id_cliente_categoria'];
  }
}

class CamposAdicionais {
  Map<dynamic, dynamic> texto = <dynamic, dynamic>{};
  Map<dynamic, dynamic> select = <dynamic, dynamic>{};
  Map<dynamic, dynamic> checkbox = <dynamic, dynamic>{};
  Map<dynamic, dynamic> data = <dynamic, dynamic>{};
  CamposAdicionais();

  CamposAdicionais.fromJson(Map<String, dynamic> json) {
    if (json['text'] != null) {
      texto = json['text'];
    }
    if (json['select'] != null) {
      select = json['select'];
    }
    if (json['checkbox'] != null) {
      checkbox = json['checkbox'];
    }
    if (json['data'] != null) {
      data = json['data'];
    }
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = <String, dynamic>{};
    if (texto.isNotEmpty) {
      json['text'] = texto;
    }
    if (select.isNotEmpty) {
      json['select'] = select;
    }
    if (checkbox.isNotEmpty) {
      json['checkbox'] = checkbox;
    }
    if (data.isNotEmpty) {
      json['data'] = data;
    }
    return json;
  }
}
