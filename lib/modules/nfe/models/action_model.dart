import 'package:donuz_dart_sdk/modules/nfe/models/nfe_status_result_model.dart';

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
