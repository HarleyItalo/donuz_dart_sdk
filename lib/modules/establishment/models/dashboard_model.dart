class DashboardModel {
  int? status;
  String? mensagem;
  double? totalPontos;
  int? totalResgates;
  int? totalClientes;
  int? totalInativos;

  DashboardModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    mensagem = json['mensagem'];
    totalPontos = json['total_pontos'];
    totalResgates = json['total_resgates'];
    totalClientes = json['total_clientes'];
    totalInativos = json['total_inativos'];
  }
}
