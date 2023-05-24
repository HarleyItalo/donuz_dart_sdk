// Models
import 'package:donuz_dart_sdk/modules/base_module.dart';

import 'feedback_module.dart';

export 'models/feedback_model.dart';
export 'models/answer_question.dart';
//Repositories
export 'respositories/feedback_repository.dart';
//usercases
export 'usercases/find_feedback.dart';
export 'usercases/response_feedback.dart';

class FeedbackModule extends BaseModule {
  FeedbackModule({required super.instance});

  late FindFeedback findFeedback;
  late ResponseFeedback responseFeedback;

  @override
  Future init() async {
    findFeedback = await instance.getAsync();
    responseFeedback = await instance.getAsync();
  }

  @override
  Future injectModule() async {
    instance.registerLazySingletonAsync<FeedbackRepository>(
      () async => FeedbackRepositoryImpl(
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<FindFeedback>(
      () async => FindFeedbackImpl(
        await instance.getAsync(),
        await instance.getAsync(),
      ),
    );
    instance.registerLazySingletonAsync<ResponseFeedback>(
      () async => ResponseFeedbackImpl(
        await instance.getAsync(),
      ),
    );
  }
}
