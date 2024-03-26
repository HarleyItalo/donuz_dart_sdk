class DashboardModel {
  int? status;
  String? mensagem;
  double? totalPontos;
  int? totalResgates;
  int? totalClientes;
  int? totalInativos;

  DashboardModel(
      {this.status,
      this.mensagem,
      this.totalPontos,
      this.totalResgates,
      this.totalClientes,
      this.totalInativos});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    mensagem = json['mensagem'];
    totalPontos = json['total_pontos'];
    totalResgates = json['total_resgates'];
    totalClientes = json['total_clientes'];
    totalInativos = json['total_inativos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['mensagem'] = mensagem;
    data['total_pontos'] = totalPontos;
    data['total_resgates'] = totalResgates;
    data['total_clientes'] = totalClientes;
    data['total_inativos'] = totalInativos;
    return data;
  }
}
