//constants
import 'package:donuz_dart_sdk/modules/base_module.dart';
import 'package:donuz_dart_sdk/modules/user/usercases/send_sms_before_registration.dart';

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

import 'user_module.dart';

class UserModule extends BaseModule {
  UserModule({required super.instance});
  late GetLoggedUserToken loggedUserToken;
  late DeleteUser deleteUser;
  late GetUser getUser;
  late MakeLogin makeLogin;
  late MakeLogout makeLogout;
  late RegisterUser registerUser;
  late RememberPassword rememberPassword;
  late SendSmsBeforeRegistration sendSmsBeforeRegistration;
  late UpdateUser updateUser;

  @override
  Future init() async {
    loggedUserToken = await instance.getAsync();
    deleteUser = await instance.getAsync();
    getUser = await instance.getAsync();
    makeLogin = await instance.getAsync();
    makeLogout = await instance.getAsync();
    registerUser = await instance.getAsync();
    rememberPassword = await instance.getAsync();
    sendSmsBeforeRegistration = await instance.getAsync();
    updateUser = await instance.getAsync();
  }

  @override
  Future injectModule() async {
    instance.registerLazySingletonAsync<LoginRepository>(
      () async => LoginRepositoryImpl(
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<UserRepository>(
      () async => UserRepositoryImpl(
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<GetLoggedUserToken>(
      () async => GetLoggedUserTokenImpl(
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<DeleteUser>(
      () async => DeleteUserImpl(
        await instance.getAsync(),
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<GetUser>(
      () async => GetUserImpl(
        await instance.getAsync(),
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<MakeLogin>(
      () async => MakeLoginImpl(
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<MakeLogout>(
      () async => MakeLogoutImpl(
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<RegisterUser>(
      () async => RegisterUserImpl(
        await instance.getAsync(),
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<RememberPassword>(
      () async => RememberPasswordImpl(
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<SendSmsBeforeRegistration>(
      () async => SendSmsBeforeRegistrationImpl(
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<UpdateUser>(
      () async => UpdateUserImpl(
        await instance.getAsync(),
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
  }
}
