import 'package:donuz_dart_sdk/modules/base_module.dart';
import 'package:donuz_dart_sdk/modules/contact/repositories/contact_repository.dart';
import 'package:donuz_dart_sdk/modules/contact/usercases/make_contact.dart';

class ContactModule extends BaseModule {
  ContactModule({required super.instance});

  late MakeContact makeContact;

  @override
  Future init() async {
    makeContact = await instance.getAsync();
  }

  @override
  Future injectModule() async {
    instance.registerLazySingletonAsync<ContactRepository>(
      () async => ContactRepositoryImpl(
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<MakeContact>(
      () async => MakeContactImpl(
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
  }
}
