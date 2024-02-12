import 'dart:convert';
import 'package:donuz_dart_sdk/modules/common/config/config.dart';
import 'package:donuz_dart_sdk/modules/feedback/feedback_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../json/default_response_json.dart';
import '../../../json/feedback/find_feedback_json.dart';
import '../../../mocks/common/services/http_service_mock.dart';

void main() {
  HttpServiceMock httpServiceMock = HttpServiceMock();
  var config = DonuzConfig(donuzToken: '123', appId: '2234');
  FeedbackRepository repository =
      FeedbackRepositoryImpl(httpServiceMock, config);
  group("FeedbackRepository", () {
    test(
      'Deve retornar uma pesquisa',
      () async {
        when(
          () => httpServiceMock.get("pesquisa",
              appId: "2234", tokenCliente: 'accessAdmin'),
        ).thenAnswer(
          (_) async => jsonDecode(findFeedbackJson),
        );

        var response = await repository.findFeedback(appId: '2234');
        expect(response?.estabelecimento, "Encanto Sorvetes");
        expect(response, isNotNull);
      },
    );
  });
  test("Deve responder uma pesquisa", () async {
    AnswerQuestionModel answerQuestion = AnswerQuestionModel(
        hash: 'dnz99p', respostas: [Respostas(idPergunta: '1', resposta: 'a')]);
    when(
      () => httpServiceMock.post(
        "search",
        answerQuestion.toJson(),
      ),
    ).thenAnswer(
      (_) async => jsonDecode(defaultResponseJson),
    );

    var response =
        await repository.responseFeedback(answerQuestion: answerQuestion);
    expect(response, isNotNull);
  });
}
