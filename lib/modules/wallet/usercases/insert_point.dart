import 'package:donuz_dart_sdk/modules/common/models/base_response_donuz_model.dart';
import 'package:donuz_dart_sdk/modules/establishment/usercases/find_establishment_by_id.dart';
import '../wallet_module.dart';

abstract class InsertPoint {
  Future<BaseResponseDonuzModel> call(
      {required String userIdentification,
      required double value,
      required String description,
      String? productCode,
      String? control,
      int? filialId,
      String? ruleId,
      int? userId});
}

class InsertPointImpl extends InsertPoint {
  final PointsRepository _repository;
  final FindEstablishmentById _findEstablishmentById;

  InsertPointImpl(
    this._repository,
    this._findEstablishmentById,
  );

  @override
  Future<BaseResponseDonuzModel> call({
    required String userIdentification,
    required double value,
    required String description,
    String? productCode,
    String? control,
    int? filialId,
    String? ruleId,
    int? userId,
  }) async {
    var establishmentId = await _findEstablishmentById.currentId();
    if (establishmentId == null) {
      return BaseResponseDonuzModel(
          status: 403, mensagem: "Requisição inválida!");
    }

    var result = await _repository.insertPoint(
      value: value,
      description: description,
      userIdentification: userIdentification,
      appId: establishmentId,
      control: control,
      filialId: filialId,
      productCode: productCode,
      ruleId: ruleId,
      userId: userId,
    );

    return result;
  }
}
