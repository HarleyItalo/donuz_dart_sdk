class AnswerQuestionModel {
  AnswerQuestionModel({
    required this.hash,
    required this.respostas,
  });
  late final String hash;
  final String acao = 'inserir';
  late final List<Respostas> respostas;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['hash'] = hash;
    data['acao'] = acao;
    data['respostas'] = respostas.map((e) => e.toJson()).toList();
    return data;
  }
}

class Respostas {
  Respostas({
    this.idPergunta,
    this.resposta,
  });
  String? idPergunta;
  String? resposta;
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id_pergunta'] = idPergunta;
    data['resposta'] = resposta;
    return data;
  }
}
