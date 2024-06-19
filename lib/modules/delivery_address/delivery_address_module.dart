import 'package:donuz_dart_sdk/modules/delivery_address/delivery_address_module.dart';
import 'package:donuz_dart_sdk/modules/base_module.dart';

export 'package:donuz_dart_sdk/modules/delivery_address/usercases/create_delivery_addres.dart';
export 'package:donuz_dart_sdk/modules/delivery_address/usercases/delete_delivery_address.dart';
export 'package:donuz_dart_sdk/modules/delivery_address/usercases/get_all_delivery_address.dart';
export 'package:donuz_dart_sdk/modules/delivery_address/usercases/mark_delivery_address_as_default.dart';
export 'package:donuz_dart_sdk/modules/delivery_address/usercases/update_delivery_address.dart';
export 'package:donuz_dart_sdk/modules/delivery_address/repositories/delivery_address_repository.dart';
export 'package:donuz_dart_sdk/modules/delivery_address/models/delivery_address_model.dart';

class DeliveryAddressModule extends BaseModule {
  DeliveryAddressModule({required super.instance});

  late CreateDeliveryAddress create;
  late UpdateDeliveryAddress update;
  late DeleteDeliveryAddress delete;
  late MarkDeliveryAddressAsDefault markAsdefault;
  late GetAllDeliveryAddress getAll;

  @override
  Future init() async {
    create = await instance.getAsync();
    update = await instance.getAsync();
    delete = await instance.getAsync();
    markAsdefault = await instance.getAsync();
    getAll = await instance.getAsync();
  }

  @override
  Future injectModule() async {
    instance.registerLazySingletonAsync<DeliveryAddressRepository>(
      () async => DeliveryAddressRepositoryImpl(
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<CreateDeliveryAddress>(
      () async => CreateDeliveryAddressImpl(
        await instance.getAsync(),
        await instance.getAsync(),
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<UpdateDeliveryAddress>(
      () async => UpdateDeliveryAddressImpl(
        await instance.getAsync(),
        await instance.getAsync(),
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<DeleteDeliveryAddress>(
      () async => DeleteDeliveryAddressImpl(
        await instance.getAsync(),
        await instance.getAsync(),
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<MarkDeliveryAddressAsDefault>(
      () async => MarkDeliveryAddressAsDefaultImpl(
        await instance.getAsync(),
        await instance.getAsync(),
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<GetAllDeliveryAddress>(
      () async => GetAllDeliveryAddressImpl(
        await instance.getAsync(),
        await instance.getAsync(),
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
  }
}
