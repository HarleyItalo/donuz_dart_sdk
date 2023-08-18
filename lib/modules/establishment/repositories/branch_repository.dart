import '../../common/common_module.dart';
import '../establishment_module.dart';

abstract class BranchRepository {
  Future<List<Filial>?> getBranchs(String appId);
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
}
