import '../../establishment/establishment_module.dart';
import '../feedback_module.dart';

abstract class FindFeedback {
  Future<FeedbackModel?> call();
}

class FindFeedbackImpl implements FindFeedback {
  final FeedbackRepository _repository;
  final FindEstablishmentById _findEstablishmentById;
  FindFeedbackImpl(this._repository, this._findEstablishmentById);
  @override
  Future<FeedbackModel?> call() async {
    var establisment = await _findEstablishmentById.currentId();
    if (establisment == null) return null;

    return await _repository.findFeedback(appId: establisment);
  }
}
