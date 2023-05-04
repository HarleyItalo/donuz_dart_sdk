//constants
import 'package:donuz_dart_sdk/modules/base_module.dart';
import 'package:donuz_dart_sdk/modules/user/repositories/login_repository.dart';
import 'package:donuz_dart_sdk/modules/user/usercases/get_logged_user_token.dart';

export 'constants/login_constants.dart';
//models
export 'models/login_model.dart';
export 'models/user_model.dart';
//repositories
export 'repositories/login_repository.dart';
export 'repositories/user_repository.dart';
//usercases
export 'usercases/get_logged_user_token.dart';
export 'usercases/make_login.dart';
export 'usercases/make_logout.dart';
export 'usercases/remember_password.dart';
export 'usercases/get_user.dart';
export 'usercases/register_user.dart';
export 'usercases/update_user.dart';
export 'usercases/delete_user.dart';

class UserModule extends BaseModule {
  UserModule({required super.instance});
  late GetLoggedUserToken loggedUserToken;

  @override
  void getInstance() async {
    loggedUserToken = await instance.getAsync();
  }

  @override
  void injectModule() {
    instance.registerLazySingletonAsync<LoginRepository>(() async =>
        LoginRepositoryImpl(
            await instance.getAsync(), await instance.getAsync()));
    instance.registerLazySingletonAsync<GetLoggedUserToken>(
        () async => GetLoggedUserTokenImpl(await instance.getAsync()));
  }
}
