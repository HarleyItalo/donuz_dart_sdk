import 'package:donuz_dart_sdk/modules/base_module.dart';
import 'package:donuz_dart_sdk/modules/nfe/nfe_module.dart';
import 'package:donuz_dart_sdk/modules/nfe/usercases/create_nfe_to_run.dart';
export 'package:donuz_dart_sdk/modules/nfe/repositories/nfe_repository_model.dart';

class NfeModule extends BaseModule {
  NfeModule({required super.instance});

  late CreateNfeToRun createNfeToRun;
  @override
  Future init() async {
    createNfeToRun = await instance.getAsync();
  }

  @override
  Future injectModule() async {
    instance.registerLazySingletonAsync<NfeRepository>(
      () async => NfeRepositoryImpl(
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<CreateNfeToRun>(
      () async => CreateNfeToRunImpl(
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
  }
}
