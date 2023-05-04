library donuz_dart_sdk;

import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';
import 'package:http/http.dart' as http;
import 'package:donuz_dart_sdk/modules/common/common_module.dart';

class DonuzSDK {
  final _serviceLocator = GetIt.instance;
  late EstablismentModule establismentModule;
  DonuzSDK({required BaseConfig config, required http.Client client}) {
    CommomModule(_serviceLocator, config, client);
    establismentModule = EstablismentModule(_serviceLocator);
  }
}
