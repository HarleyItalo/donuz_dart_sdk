import '../../common/common_module.dart';
import '../gift_module.dart';

abstract class GiftsRepository {
  Future<GiftsModel?> findGifts(
      {required String appId, required String tokenCliente});
}

class GiftsRepositoryImpl extends GiftsRepository {
  final HttpService httpService;

  GiftsRepositoryImpl(
    this.httpService,
  );

  @override
  Future<GiftsModel?> findGifts(
      {required String appId, required String tokenCliente}) async {
    var response = await httpService.get(
      'gifts',
      appId: appId,
      tokenCliente: tokenCliente,
    );
    return GiftsModel.fromJson(response);
  }
}
