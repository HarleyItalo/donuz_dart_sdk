class AppConfigModel {
  int? status;
  String? mensagem;
  AppConfig? appConfig;
  AppConfigModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    mensagem = json['mensagem'];
    appConfig = json['app_config'] != null
        ? AppConfig.fromJson(json['app_config'])
        : null;
  }
}

class AppConfig {
  late int estabelecimentoId;
  late int useAppDefault;
  late String color;
  late String iOSVersionCode;
  late String androidVersionCode;
  late String? lastUpdate;

  AppConfig.fromJson(Map<String, dynamic> json) {
    estabelecimentoId = json['estabelecimento_id'];
    useAppDefault = json['use_app_default'];
    color = json['color'];
    iOSVersionCode = json['iOS_version_code'];
    androidVersionCode = json['android_version_code'];
    lastUpdate = json['last_update'];
  }
}
