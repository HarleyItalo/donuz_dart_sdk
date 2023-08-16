//models
import 'package:donuz_dart_sdk/modules/base_module.dart';
import 'package:donuz_dart_sdk/modules/wallet/usercases/find_ranking.dart';
import 'package:donuz_dart_sdk/modules/wallet/usercases/transfer.dart';

export 'models/balance_model.dart';
export 'models/point_insert_model.dart';
export 'models/points_model.dart';
//repositories
export 'repositories/points_repository.dart';
//usercases
export 'usercases/get_balance.dart';
export 'usercases/get_point_extract.dart';
export 'usercases/insert_point.dart';
export 'usercases/insert_punctuable_code.dart';
export 'usercases/insert_punctuable_qr_code.dart';

import 'wallet_module.dart';

class WalletModule extends BaseModule {
  WalletModule({required super.instance});
  late GetBalance getBalance;
  late GetPointExtract getPointExtract;
  late InsertPoint insertPoint;
  late InsertPunctuableCode insertPunctuableCode;
  late InsertPunctuableQrCode insertPunctuableQRCode;
  late FindRanking findRanking;
  late Transfer tranfer;

  @override
  Future init() async {
    getBalance = await instance.getAsync();
    getPointExtract = await instance.getAsync();
    insertPoint = await instance.getAsync();
    insertPunctuableCode = await instance.getAsync();
    insertPunctuableQRCode = await instance.getAsync();
    findRanking = await instance.getAsync();
    tranfer = await instance.getAsync();
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
    instance.registerLazySingletonAsync<InsertPunctuableCode>(
      () async => InsertPunctuableCodeImpl(
        await instance.getAsync(),
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<InsertPunctuableQrCode>(
      () async => InsertPunctuableQrCodeImpl(
        await instance.getAsync(),
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<Transfer>(
      () async => TransferImpl(
        await instance.getAsync(),
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<FindRanking>(
      () async => FindRankingImpl(
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
  }
}
