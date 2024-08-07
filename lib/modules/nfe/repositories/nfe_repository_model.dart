import 'package:donuz_dart_sdk/modules/nfe/models/action_model.dart';

import '../../common/common_module.dart';

abstract class NfeRepository {
  Future<(bool, String?)> sendNfe({
    required ActionModel action,
  });
}

class NfeRepositoryImpl extends NfeRepository {
  final HttpService httpService;
  final BaseConfig config;
  NfeRepositoryImpl(
    this.httpService,
    this.config,
  );

  @override
  Future<(bool, String?)> sendNfe({
    required ActionModel action,
  }) async {
    var json = await httpService.post(
      "${config.integrationServer}/api/actions/create",
      action.toJson(),
      appId: action.establishmentId.toString(),
    );
    var response = BaseResponseDonuzModel.fromJson(json);
    return (response.status == 200, response.mensagem);
  }
}
