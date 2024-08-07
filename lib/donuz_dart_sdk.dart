library donuz_dart_sdk;

import 'package:donuz_dart_sdk/modules/app/app_module.dart';
import 'package:donuz_dart_sdk/modules/contact/contact_module.dart';
import 'package:donuz_dart_sdk/modules/coupon/coupon_module.dart';
import 'package:donuz_dart_sdk/modules/delivery_address/delivery_address_module.dart';
import 'package:donuz_dart_sdk/modules/establishment/establishment_module.dart';
import 'package:donuz_dart_sdk/modules/gifts/gift_module.dart';
import 'package:donuz_dart_sdk/modules/nfe/nfe_module.dart';
import 'package:donuz_dart_sdk/modules/pdv/pdv_module.dart';
import 'package:donuz_dart_sdk/modules/prizes/prizes_module.dart';
import 'package:donuz_dart_sdk/modules/redemption/redemption_module.dart';
import 'package:donuz_dart_sdk/modules/user/user_module.dart';
import 'package:donuz_dart_sdk/modules/wallet/wallet_module.dart';
import 'package:http/http.dart' as http;
import 'package:donuz_dart_sdk/modules/common/common_module.dart';

import 'modules/feedback/feedback_module.dart';

class DonuzSDK {
  final _serviceLocator = GetIt.instance;
  late EstablismentModule establisment;
  late UserModule user;
  late PrizeModule prizes;
  late WalletModule wallet;
  late RedemptionModule redemption;
  late FeedbackModule feedback;
  late GiftModule gift;
  late CouponModule coupon;
  late ContactModule contact;
  late AppModule app;
  late PdvModule pdv;
  late DeliveryAddressModule deliveryAddres;
  late NfeModule nfeModule;

  DonuzSDK({required BaseConfig config, http.Client? client}) {
    client ??= http.Client();
    CommomModule(_serviceLocator, config, client);
    establisment = EstablismentModule(instance: _serviceLocator);
    user = UserModule(instance: _serviceLocator);
    prizes = PrizeModule(instance: _serviceLocator);
    wallet = WalletModule(instance: _serviceLocator);
    redemption = RedemptionModule(instance: _serviceLocator);
    feedback = FeedbackModule(instance: _serviceLocator);
    gift = GiftModule(instance: _serviceLocator);
    coupon = CouponModule(instance: _serviceLocator);
    contact = ContactModule(instance: _serviceLocator);
    app = AppModule(instance: _serviceLocator);
    pdv = PdvModule(instance: _serviceLocator);
    deliveryAddres = DeliveryAddressModule(instance: _serviceLocator);
    nfeModule = NfeModule(instance: _serviceLocator);
  }
  init() async {
    await Future.wait(
      [
        establisment.init(),
        user.init(),
        user.init(),
        prizes.init(),
        wallet.init(),
        redemption.init(),
        feedback.init(),
        gift.init(),
        coupon.init(),
        contact.init(),
        app.init(),
        pdv.init(),
        deliveryAddres.init()
      ],
    );
  }
}
