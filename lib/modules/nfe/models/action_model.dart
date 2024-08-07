class ActionModel {
  int? establishmentId;
  String? onAction = 'nfe';
  late ActionParamms actionParamms;

  ActionModel({
    this.establishmentId,
    this.onAction = 'nfe',
    required this.actionParamms,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['establishmentId'] = establishmentId;
    data['onAction'] = onAction;
    data['actionParamms'] = actionParamms.toJson();

    return data;
  }
}

class ActionParamms {
  late String nfeAccessKey;
  late String cpf;

  ActionParamms({required this.nfeAccessKey, required this.cpf});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nfeAccessKey'] = nfeAccessKey;
    data['cpf'] = cpf;
    return data;
  }
}
