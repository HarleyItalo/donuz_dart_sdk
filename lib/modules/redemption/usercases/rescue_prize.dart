import '../../establishment/establishment_module.dart';
import '../../user/user_module.dart';
import '../redemption_module.dart';

abstract class RescuePrize {
  Future<RescueModel?> call({
    required dynamic idPrize,
    required dynamic quantity,
  });
}

class RescuePrizeImpl extends RescuePrize {
  final FindEstablishmentById _findEstablishmentById;
  final GetLoggedUserToken _getLoggedUserToken;
  final RescueRepository _repository;
  RescuePrizeImpl(
    this._repository,
    this._findEstablishmentById,
    this._getLoggedUserToken,
  );

  @override
  Future<RescueModel?> call({
    required dynamic idPrize,
    required dynamic quantity,
  }) async {
    var response = await Future.wait(
      [
        _findEstablishmentById.currentId(),
        _getLoggedUserToken(),
      ],
    );

    for (var element in response) {
      if (element == null) return null;
    }

    var result = await _repository.makeRescue(
        idPrize: idPrize,
        quantity: quantity,
        appId: response.first!,
        tokenCliente: response.last!);

    return result;
  }
}
