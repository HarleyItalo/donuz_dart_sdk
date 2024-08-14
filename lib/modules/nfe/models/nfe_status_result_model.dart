class NfeStatusResultModel {
  int? statusCode;
  String? message;
  List<NfeData>? data;

  NfeStatusResultModel({this.statusCode, this.message, this.data});

  NfeStatusResultModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <NfeData>[];
      json['data'].forEach((v) {
        data!.add(NfeData.fromJson(v));
      });
    }
  }
}

class NfeData {
  int? establishmentId;
  String? status;
  String? onAction;
  ActionParamms? actionParamms;
  int? statusCode;
  int? retryes;
  String? responseIfError;
  String? id;
  String? createdAt;
  String? updatedAt;

  NfeData.fromJson(Map<String, dynamic> json) {
    establishmentId = json['establishmentId'];
    status = json['status'];
    onAction = json['onAction'];
    actionParamms = json['actionParamms'] != null
        ? ActionParamms.fromJson(json['actionParamms'])
        : null;
    statusCode = json['statusCode'];
    retryes = json['retryes'];
    responseIfError = json['responseIfError'];
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}

class ActionParamms {
  String? nfeAccessKey;
  String? cpf;

  ActionParamms({this.nfeAccessKey, this.cpf});

  ActionParamms.fromJson(Map<String, dynamic> json) {
    nfeAccessKey = json['nfeAccessKey'];
    cpf = json['cpf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nfeAccessKey'] = nfeAccessKey;
    data['cpf'] = cpf;
    return data;
  }
}
