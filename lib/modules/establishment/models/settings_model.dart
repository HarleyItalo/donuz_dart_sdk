class SettingsModel {
  Configuracoes? configuracoes;

  SettingsModel.fromJson(Map<String, dynamic> json) {
    configuracoes = json['configuracoes'] != null
        ? Configuracoes.fromJson(json['configuracoes'])
        : null;
  }
}

class Configuracoes {
  int? idConfig;
  int? estabelecimentoId;
  bool? clientePodeCadastrar;
  bool? clientePodeCadastrarTotem;
  bool? habilitarCodigoPontuavel;
  bool? cadastroCampoDataNascimento;
  bool? cadastroCampoTelefone;
  bool? cadastroCampoCelular;
  bool? cadastroCampoEndereco;
  bool? cadastroCampoNumero;
  bool? cadastroCampoComplemento;
  bool? cadastroCampoEstado;
  bool? cadastroCampoCidade;
  bool? cadastroCampoCep;
  bool? cadastroCampoSobrenome;
  bool? cadastroCampoEscolaridade;
  bool? cadastroCampoRendaMensal;
  String? ordemExibicaoProdutos;
  String? premiosPorPagina;
  bool? campoProfissao;
  bool? campoFilial;
  bool? campoTipoCliente;
  bool? campoTimeTorce;
  bool? campoSexo;
  bool? validarCodigoValor;
  bool? clientePodeCurtir;
  bool? clientePodeCompartilhar;
  dynamic maximoPontosCompartilhar;
  String? descricaoCompartilhamento;
  String? tituloCompartilhamento;
  dynamic logoCompartilhamento;
  dynamic css;
  dynamic js;
  bool? clientePodeIndicar;
  dynamic valorPorIndicacao;
  dynamic valorPorIndicacaoCadastro;
  dynamic indicacaoTipo;
  dynamic indicacaoFrequencia;
  dynamic habilitarPremioValorReais;
  dynamic cadastroCodigoCliente;
  dynamic enviarEmailTransacional;
  bool? cadastroCpf;
  dynamic habilitarResetPremios;
  dynamic pontosPreencherCadastro;
  dynamic pontosNaoCliente;
  dynamic bloquearInsercaoDuplicada;
  dynamic cadastroCampoEmail;
  dynamic podePontuarPorValorFixo;
  dynamic valorPontosFixo;
  dynamic recorrencia;
  dynamic validadeVoucher;
  bool? habilitarPontuacaoInteira;
  bool? tagplusIntegracaoCadastrar;
  bool? habilitarValidarCadastrarCodigosPontuaveis;
  bool? categoriaAtiva;
  bool? categoriaUsarValidade;
  bool? tagplusIntegracaoRegra;
  bool? desabilitarEmails;
  dynamic maxVenda;
  dynamic campoCodigoClienteRepresenta;
  String? urlAndroid;
  String? urlIos;
  String? onesignalId;
  String? onesignalToken;
  dynamic verboClientes;
  dynamic verboCliente;
  dynamic galaxHash;
  dynamic galaxId;
  bool? desabilitaResgateClienteNaoIndicou;
  bool? habilitarDoacao;
  dynamic emailProprio;
  dynamic idCrmExterno;
  dynamic maxInsercaoDia;
  bool? habilitaQrcodeCheckin;
  bool? habilitarOfertas;
  bool? bloquearControleDuplicado;
  bool? appCartaoFidelidade;
  bool? habilitarInsercaoNfce;
  dynamic quantidadeSelos;
  String? configuracaoAutomatica;
  String? documentoUsado;
  List<CamposAdicionais>? camposAdicionais;

  Configuracoes.fromJson(Map<String, dynamic> json) {
    idConfig = json['id_config'];
    estabelecimentoId = json['estabelecimento_id'];
    clientePodeCadastrar = json['cliente_pode_cadastrar'];
    clientePodeCadastrarTotem = json['cliente_pode_cadastrar_totem'];
    habilitarCodigoPontuavel = json['habilitar_codigo_pontuavel'];
    cadastroCampoDataNascimento = json['cadastro_campo_data_nascimento'];
    cadastroCampoTelefone = json['cadastro_campo_telefone'];
    cadastroCampoCelular = json['cadastro_campo_celular'];
    cadastroCampoEndereco = json['cadastro_campo_endereco'];
    cadastroCampoNumero = json['cadastro_campo_numero'];
    cadastroCampoComplemento = json['cadastro_campo_complemento'];
    cadastroCampoEstado = json['cadastro_campo_estado'];
    cadastroCampoCidade = json['cadastro_campo_cidade'];
    cadastroCampoCep = json['cadastro_campo_cep'];
    cadastroCampoSobrenome = json['cadastro_campo_sobrenome'];
    cadastroCampoEscolaridade = json['cadastro_campo_escolaridade'];
    cadastroCampoRendaMensal = json['cadastro_campo_renda_mensal'];
    ordemExibicaoProdutos = json['ordem_exibicao_produtos'];
    premiosPorPagina = json['premios_por_pagina'];
    campoProfissao = json['campo_profissao'];
    campoFilial = json['campo_filial'];
    campoTipoCliente = json['campo_tipo_cliente'];
    campoTimeTorce = json['campo_time_torce'];
    campoSexo = json['campo_sexo'];
    validarCodigoValor = json['validar_codigo_valor'];
    clientePodeCurtir = json['cliente_pode_curtir'];
    clientePodeCompartilhar = json['cliente_pode_compartilhar'];
    maximoPontosCompartilhar = json['maximo_pontos_compartilhar'] == false
        ? 0
        : json['maximo_pontos_compartilhar'];
    descricaoCompartilhamento = json['descricao_compartilhamento'] == false
        ? ""
        : json['descricao_compartilhamento'];
    tituloCompartilhamento = json['titulo_compartilhamento'] == false
        ? ""
        : json['titulo_compartilhamento'];
    logoCompartilhamento = json['logo_compartilhamento'];
    css = json['css'];
    js = json['js'];
    clientePodeIndicar = json['cliente_pode_indicar'];
    valorPorIndicacao = json['valor_por_indicacao'];
    valorPorIndicacaoCadastro = json['valor_por_indicacao_cadastro'] == false
        ? 0
        : json['valor_por_indicacao_cadastro'];
    indicacaoTipo = json['indicacao_tipo'];
    indicacaoFrequencia = json['indicacao_frequencia'];
    habilitarPremioValorReais = json['habilitar_premio_valor_reais'];
    cadastroCodigoCliente = json['cadastro_codigo_cliente'];
    enviarEmailTransacional = json['enviar_email_transacional'];
    cadastroCpf = json['cadastro_cpf'];
    habilitarResetPremios = json['habilitar_reset_premios'];
    pontosPreencherCadastro = json['pontos_preencher_cadastro'];
    pontosNaoCliente = json['pontos_nao_cliente'];
    bloquearInsercaoDuplicada = json['bloquear_insercao_duplicada'];
    cadastroCampoEmail = json['cadastro_campo_email'];
    podePontuarPorValorFixo = json['pode_pontuar_por_valor_fixo'];
    valorPontosFixo =
        json['valor_pontos_fixo'] == false ? 0 : json['valor_pontos_fixo'];
    recorrencia = json['recorrencia'];
    validadeVoucher = json['validade_voucher'];
    habilitarPontuacaoInteira = json['habilitar_pontuacao_inteira'];
    tagplusIntegracaoCadastrar = json['tagplus_integracao_cadastrar'];
    habilitarValidarCadastrarCodigosPontuaveis =
        json['habilitar_validar_cadastrar_codigos_pontuaveis'];
    categoriaAtiva = json['categoria_ativa'];
    categoriaUsarValidade = json['categoria_usar_validade'];
    tagplusIntegracaoRegra = json['tagplus_integracao_regra'];
    desabilitarEmails = json['desabilitar_emails'];
    maxVenda = json['max_venda'];
    campoCodigoClienteRepresenta = json['campo_codigo_cliente_representa'];
    urlAndroid = json['url_android'] == false ? "" : json['url_android'];
    urlIos = json['url_ios'] == false ? "" : json['url_ios'];
    onesignalId = json['onesignal_id'] == false ? "" : json['onesignal_id'];
    onesignalToken =
        json['onesignal_token'] == false ? "" : json['onesignal_token'];
    verboClientes = json['verbo_clientes'];
    verboCliente = json['verbo_cliente'];
    galaxHash = json['galax_hash'];
    galaxId = json['galax_id'];
    desabilitaResgateClienteNaoIndicou =
        json['desabilita_resgate_cliente_nao_indicou'];
    habilitarDoacao = json['habilitar_doacao'];
    emailProprio = json['email_proprio'];
    idCrmExterno = json['id_crm_externo'] == false ? 0 : json['id_crm_externo'];
    maxInsercaoDia = json['max_insercao_dia'];
    habilitaQrcodeCheckin = json['habilita_qrcode_checkin'];
    habilitarOfertas = json['habilitar_ofertas'];
    bloquearControleDuplicado = json['bloquear_controle_duplicado'];
    appCartaoFidelidade = json['app_cartao_fidelidade'];
    quantidadeSelos = json['quantidade_selos'] ?? 0;
    configuracaoAutomatica = json['configuracao_automatica'];
    documentoUsado = json['documento_usado'];
    habilitarInsercaoNfce = json['habilitar_insercao_nfce'];
    if (json['campos_adicionais'] != null) {
      camposAdicionais = <CamposAdicionais>[];
      json['campos_adicionais'].forEach((v) {
        camposAdicionais?.add(CamposAdicionais.fromJson(v));
      });
    }
  }
}

class CamposAdicionais {
  dynamic idCampoAdicional;
  String? campo;
  String? tipo;
  List<Opcoes>? opcoes;
  CamposAdicionais.fromJson(Map<String, dynamic> json) {
    idCampoAdicional = json['id_campo_adicional'];
    campo = json['campo'];
    tipo = json['tipo'];
    if (json['opcoes'] != null) {
      opcoes = <Opcoes>[];
      json['opcoes'].forEach((v) {
        opcoes?.add(Opcoes.fromJson(v));
      });
    }
  }
}

class Opcoes {
  int? idCampoAdicionalOpcao;
  String? opcao;
  Opcoes.fromJson(Map<String, dynamic> json) {
    idCampoAdicionalOpcao = json['id_campo_adicional_opcao'];
    opcao = json['opcao'];
  }
}
