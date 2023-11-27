import 'package:donuz_dart_sdk/modules/establishment/models/branch_user_model.dart';

import '../../common/common_module.dart';
import '../establishment_module.dart';

abstract class BranchRepository {
  Future<List<Filial>?> getBranchs(String appId);
  Future<BranchUserModel> locateBranchWithCode({
    required String code,
    required String appId,
  });
}

class BranchRepositoryImpl extends BranchRepository {
  final HttpService httpService;
  BranchRepositoryImpl(
    this.httpService,
  );

  @override
  Future<List<Filial>?> getBranchs(String appId) async {
    var json = await httpService.get("estabelishment/branchs", appId: appId);
    var response = BranchModel.fromJson(json).filiais;
    return response;
  }

  @override
  Future<BranchUserModel> locateBranchWithCode({
    required String code,
    required String appId,
  }) async {
    var json = await httpService.post(
      "branch/login",
      {
        "codigoUsuarioFilial": code,
      },
      appId: appId,
    );

    var response = BranchUserModel.fromJson(json);
    return response;
  }
}
