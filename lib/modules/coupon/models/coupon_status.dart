class CouponStatusModel {
  int? status;
  String? message;
  List<CouponResponseData>? data;

  CouponStatusModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CouponResponseData>[];
      json['data'].forEach((v) {
        data!.add(CouponResponseData.fromJson(v));
      });
    }
  }
}

class CouponResponseData {
  String? id;
  String? status;
  Informacoes? informacoes;
  int? contadorFalhas;

  CouponResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    informacoes = json['informacoes'] != null
        ? Informacoes.fromJson(json['informacoes'])
        : null;
    contadorFalhas = json['contadorFalhas'];
  }
}

class Informacoes {
  String? codigoCliente;
  String? estabelecimentoId;
  String? url;
  String? tokenCliente;
  String? dataLeituraNfce;
  Informacoes.fromJson(Map<String, dynamic> json) {
    codigoCliente = json['codigoCliente'];
    dataLeituraNfce = json['dataLeituraNfce'];
    estabelecimentoId = json['estabelecimentoId'];
    url = json['url'];
    tokenCliente = json['tokenCliente'];
  }
}
