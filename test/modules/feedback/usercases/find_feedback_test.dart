import 'dart:convert';

import 'package:donuz_dart_sdk/modules/feedback/feedback_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../json/feedback/find_feedback_json.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/feedback/repositories/feedback_repository_mock.dart';

void main() {
  FeedbackRepositoryMock feedbackRepositoryMock = FeedbackRepositoryMock();
  FindEstablismentByIdMock findEstablismentByIdMock =
      FindEstablismentByIdMock();
  var findFeedback =
      FindFeedbackImpl(feedbackRepositoryMock, findEstablismentByIdMock);

  group("FindFeedback", () {
    test("Deve retornar as pesquisas de satisfacao", () async {
      when(() => findEstablismentByIdMock.currentId())
          .thenAnswer((_) async => "2234");
      when(
        () => feedbackRepositoryMock.findFeedback(appId: "2234"),
      ).thenAnswer(
        (_) async => FeedbackModel.fromJson(
          jsonDecode(findFeedbackJson),
        ),
      );
      var response = await findFeedback();
      expect(response, isNotNull);
    });
  });
}
