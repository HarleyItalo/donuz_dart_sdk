//models
import 'package:donuz_dart_sdk/modules/base_module.dart';

export 'models/balance_model.dart';
export 'models/point_insert_model.dart';
export 'models/points_model.dart';
//repositories
export 'repositories/points_repository.dart';
//usercases
export 'usercases/get_balance.dart';
export 'usercases/get_point_extract.dart';
export 'usercases/insert_point.dart';

import 'wallet_module.dart';

class WalletModule extends BaseModule {
  WalletModule({required super.instance});
  late GetBalance getBalance;
  late GetPointExtract getPointExtract;
  late InsertPoint insertPoint;

  @override
  Future init() async {
    getBalance = await instance.getAsync();
    getPointExtract = await instance.getAsync();
    insertPoint = await instance.getAsync();
  }

  @override
  Future injectModule() async {
    instance.registerLazySingletonAsync<PointsRepository>(
      () async => PointsRepositoryImpl(
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<GetBalance>(
      () async => GetBalanceImpl(
        await instance.getAsync(),
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<GetPointExtract>(
      () async => GetPointExtractImpl(
        await instance.getAsync(),
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<InsertPoint>(
      () async => InsertPointImpl(
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
  }
}
