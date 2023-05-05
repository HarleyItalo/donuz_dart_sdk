library donuz_dart_sdk;

import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';
import 'package:donuz_dart_sdk/modules/prizes/prizes_module.dart';
import 'package:donuz_dart_sdk/modules/redemption/redemption_module.dart';
import 'package:donuz_dart_sdk/modules/user/user_module.dart';
import 'package:donuz_dart_sdk/modules/wallet/wallet_module.dart';
import 'package:http/http.dart' as http;
import 'package:donuz_dart_sdk/modules/common/common_module.dart';

class DonuzSDK {
  final _serviceLocator = GetIt.instance;
  late EstablismentModule establisment;
  late UserModule user;
  late PrizeModule prizes;
  late WalletModule wallet;
  late RedemptionModule redemption;
  DonuzSDK({required BaseConfig config, required http.Client client}) {
    CommomModule(_serviceLocator, config, client);
    establisment = EstablismentModule(instance: _serviceLocator);
    user = UserModule(instance: _serviceLocator);
    prizes = PrizeModule(instance: _serviceLocator);
    wallet = WalletModule(instance: _serviceLocator);
    redemption = RedemptionModule(instance: _serviceLocator);
  }
  init() async {
    await establisment.init();
    await user.init();
    await prizes.init();
    await wallet.init();
    await redemption.init();
  }
}
