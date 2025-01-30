//constants
import 'package:donuz_dart_sdk/modules/base_module.dart';
export 'constants/login_constants.dart';
//models
export 'models/login_model.dart';
export 'models/user_model.dart';
export 'models/user_notifications.dart';
export 'models/upload_user_image_model.dart';
//repositories
export 'repositories/login_repository.dart';
export 'repositories/user_repository.dart';
//usercases
export 'usercases/get_logged_user_id.dart';
export 'usercases/get_logged_user_token.dart';
export 'usercases/make_login.dart';
export 'usercases/make_logout.dart';
export 'usercases/remember_password.dart';
export 'usercases/get_user.dart';
export 'usercases/register_user.dart';
export 'usercases/update_user.dart';
export 'usercases/delete_user.dart';
export 'usercases/get_user_notifications.dart';
export 'usercases/mark_as_read_notification.dart';
export 'usercases/send_sms_before_registration.dart';
export 'usercases/update_notification_token.dart';
import 'usercases/make_login_only_key.dart';
export 'usercases/upload_user_photo.dart';
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
  late GetUserNotifications userNotifications;
  late MarkAsReadNotification markAsReadNotification;
  late UpdateNotificationToken updateNotificationToken;
  late UploadUserPhoto uploadUserPhoto;
  late GetLoggedUserId getLoggedUserId;
  late MakeLoginOnlyKey makeLoginOnlyKey;

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
    userNotifications = await instance.getAsync();
    markAsReadNotification = await instance.getAsync();
    updateNotificationToken = await instance.getAsync();
    uploadUserPhoto = await instance.getAsync();
    getLoggedUserId = await instance.getAsync();
    makeLoginOnlyKey = await instance.getAsync();
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
    instance.registerLazySingletonAsync<GetLoggedUserId>(
      () async => GetLoggedUserIdImpl(
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
    instance.registerLazySingletonAsync<GetUserNotifications>(
      () async => GetUserNotificationsImpl(
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<MarkAsReadNotification>(
      () async => MarkAsReadNotificationImpl(
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<UpdateNotificationToken>(
      () async => UpdateNotificationTokenImpl(
        await instance.getAsync(),
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<UploadUserPhoto>(
      () async => UploadUserPhotoImpl(
        await instance.getAsync(),
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<MakeLoginOnlyKey>(
      () async => MakeLoginOnlyKeyImpl(
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
  }
}
