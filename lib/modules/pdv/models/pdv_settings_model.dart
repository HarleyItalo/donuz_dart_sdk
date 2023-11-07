class PdvSettingModel {
  int? status;
  String? mensagem;
  PdvSettings? pdvSettings;

  PdvSettingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    mensagem = json['mensagem'];
    pdvSettings = json['pdvSettings'] != null
        ? PdvSettings.fromJson(json['pdvSettings'])
        : null;
  }
}

class PdvSettings {
  int? pdvSettingsId;
  int? estabelecimentoId;
  int? regraDePontosId;
  String? bannerUrl;
  bool? pontuar;
  bool? responderPesquisa;
  String? corPrincipal;

  PdvSettings.fromJson(Map<String, dynamic> json) {
    pdvSettingsId = json['pdv_settings_id'];
    estabelecimentoId = json['estabelecimento_id'];
    regraDePontosId = json['regra_de_pontos_id'];
    bannerUrl = json['banner_url'];
    pontuar = json['pontuar'];
    responderPesquisa = json['responder_pesquisa'];
    corPrincipal = json['cor_principal'];
  }
}
