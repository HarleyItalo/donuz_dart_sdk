import 'dart:convert';

import 'package:donuz_dart_sdk/modules/common/models/base_response_donuz_model.dart';
import 'package:donuz_dart_sdk/modules/feedback/feedback_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../json/default_response_json.dart';
import '../../../mocks/establishment/usercases/find_establishment_by_id_mock.dart';
import '../../../mocks/feedback/repositories/feedback_repository_mock.dart';

void main() {
  FeedbackRepositoryMock feedbackRepositoryMock = FeedbackRepositoryMock();
  FindEstablismentByIdMock findEstablismentByIdMock =
      FindEstablismentByIdMock();
  var responseFeedback = ResponseFeedbackImpl(feedbackRepositoryMock);

  group("FindFeedback", () {
    test("Deve retornar as pesquisas de satisfacao", () async {
      AnswerQuestionModel answerQuestion = AnswerQuestionModel(
          hash: 'dnz99p',
          respostas: [Respostas(idPergunta: '1', resposta: 'a')]);
      when(() => findEstablismentByIdMock.currentId())
          .thenAnswer((_) async => "2234");
      when(
        () => feedbackRepositoryMock.responseFeedback(
            answerQuestion: answerQuestion),
      ).thenAnswer((_) async =>
          BaseResponseDonuzModel.fromJson(jsonDecode(defaultResponseJson)));
      var response = await responseFeedback(answerQuestion);
      expect(response, isNotNull);
    });
  });
}
