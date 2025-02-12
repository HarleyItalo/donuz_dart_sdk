class HiredResourcesModel {
  List<String>? recursosContratados;

  HiredResourcesModel({this.recursosContratados});

  HiredResourcesModel.fromJson(Map<String, dynamic> json) {
    recursosContratados = json['recursos_contratados'].cast<String>();
  }
}
