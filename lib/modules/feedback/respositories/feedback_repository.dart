import '../feedback_module.dart';
import '../../common/common_module.dart';

abstract class FeedbackRepository {
  Future<FeedbackModel?> findFeedback({required String appId});
  Future<BaseResponseDonuzModel> responseFeedback(
      {required AnswerQuestionModel answerQuestion});
}

class FeedbackRepositoryImpl extends FeedbackRepository {
  final HttpService httpService;
  final BaseConfig config;
  FeedbackRepositoryImpl(
    this.httpService,
    this.config,
  );

  @override
  Future<FeedbackModel?> findFeedback({required String appId}) async {
    var response = await httpService.get("pesquisa",
        appId: appId, tokenCliente: 'accessAdmin');

    return FeedbackModel.fromJson(response);
  }

  @override
  Future<BaseResponseDonuzModel> responseFeedback(
      {required AnswerQuestionModel answerQuestion}) async {
    var response = await httpService.post(
      "search",
      answerQuestion.toJson(),
    );
    return BaseResponseDonuzModel.fromJson(response);
  }
}
