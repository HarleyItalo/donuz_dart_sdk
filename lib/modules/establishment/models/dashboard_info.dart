class DashboardInfoModel {
  int? status;
  String? mensagem;
  double? totalpontos;
  int? totalresgates;
  DashboardInfoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    mensagem = json['mensagem'];
    totalpontos = json['total_pontos'];
    totalresgates = json['total_resgates'];
  }
}
