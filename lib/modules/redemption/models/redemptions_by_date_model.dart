class RedemptionsByDateModel {
  int? status;
  String? mensagem;
  int? total;
  int? pages;
  List<Vouchers>? vouchers;

  RedemptionsByDateModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    mensagem = json['mensagem'];
    total = json['total'];
    pages = json['pages'];
    if (json['vouchers'] != null) {
      vouchers = <Vouchers>[];
      json['vouchers'].forEach((v) {
        vouchers!.add(Vouchers.fromJson(v));
      });
    }
  }
}

class Vouchers {
  String? codigoVoucher;
  String? dataResgate;
  String? valor;
  String? cpf;
  int? idPedido;
  String? nome;
  String? produto;
  String? imagemPrincipal;
  String? status;

  Vouchers.fromJson(Map<String, dynamic> json) {
    codigoVoucher = json['codigo_voucher'];
    dataResgate = json['data_resgate'];
    valor = json['valor'];
    cpf = json['cpf'];
    idPedido = json['id_pedido'];
    nome = json['nome'];
    produto = json['produto'];
    imagemPrincipal = json['imagemPrincipal'];
    status = json['status'];
  }
}
