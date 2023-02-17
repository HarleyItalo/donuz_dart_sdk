class Regulation {
  String? comoFunciona;
  String? regulamento;
  Regulation.fromJson(Map<String, dynamic> json) {
    comoFunciona = json['descricao_programa'];
    regulamento = json['regulamento'];
  }
}

class RegulationModel {
  Regulation? regulation;
  RegulationModel.fromJson(Map<String, dynamic> json) {
    if (json['estabelecimento'] != null) {
      regulation = Regulation.fromJson(json['estabelecimento']);
    }
  }
}
