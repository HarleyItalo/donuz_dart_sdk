import 'package:donuz_dart_sdk/modules/contact/models/contact_model.dart';
import '../../common/common_module.dart';

abstract class ContactRepository {
  Future<bool> makeContact({
    required ContactModel contact,
    required String appId,
  });
}

class ContactRepositoryImpl extends ContactRepository {
  final HttpService httpService;

  ContactRepositoryImpl(this.httpService);

  @override
  Future<bool> makeContact({
    required ContactModel contact,
    required String appId,
  }) async {
    var response = await httpService.post(
      "contact",
      contact.toJson(),
      appId: appId,
    );
    return BaseResponseDonuzModel.fromJson(response).status == 200;
  }
}
