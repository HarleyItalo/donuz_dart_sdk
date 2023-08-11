class RankingModel {
  int? status;
  String? mensagem;
  List<Ranking>? ranking;
  RankingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    mensagem = json['mensagem'];
    if (json['ranking'] != null) {
      ranking = <Ranking>[];
      json['ranking'].forEach((v) {
        ranking!.add(Ranking.fromJson(v));
      });
    }
  }
}

class Ranking {
  int? position;
  int? clienteId;
  String? primeiroNome;
  dynamic pontuacaoAnual;
  String? foto;

  Ranking.fromJson(Map<String, dynamic> json) {
    position = json['position'];
    clienteId = json['cliente_id'];
    primeiroNome = json['primeiro_nome'];
    pontuacaoAnual = json['pontuacao_anual'];
    foto = json['foto'];
  }
}
