import '../../common/common_module.dart';
import '../feedback_module.dart';

abstract class ResponseFeedback {
  Future<BaseResponseDonuzModel?> call(AnswerQuestionModel answerQuestion);
}

class ResponseFeedbackImpl implements ResponseFeedback {
  final FeedbackRepository _repository;
  ResponseFeedbackImpl(
    this._repository,
  );
  @override
  Future<BaseResponseDonuzModel?> call(
      AnswerQuestionModel answerQuestion) async {
    if (answerQuestion.hash.isEmpty || answerQuestion.respostas.isEmpty) {
      return null;
    }

    return await _repository.responseFeedback(answerQuestion: answerQuestion);
  }
}
