class SingleRankingModel {
  int? status;
  String? mensagem;
  RankingPersonInfo? rankingPersonInfo;
  String? rankingStartDate;
  String? rankingEndDate;
  bool? yearRanking;

  SingleRankingModel(
      {this.status,
      this.mensagem,
      this.rankingPersonInfo,
      this.rankingStartDate,
      this.rankingEndDate,
      this.yearRanking});

  SingleRankingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    mensagem = json['mensagem'];
    rankingPersonInfo = json['rankingPersonInfo'] != null
        ? RankingPersonInfo.fromJson(json['rankingPersonInfo'])
        : null;
    rankingStartDate = json['rankingStartDate'];
    rankingEndDate = json['rankingEndDate'];
    yearRanking = json['yearRanking'];
  }
}

class RankingPersonInfo {
  int? clienteId;
  String? primeiroNome;
  String? foto;
  dynamic pontuacao;

  RankingPersonInfo(
      {this.clienteId, this.primeiroNome, this.foto, this.pontuacao});

  RankingPersonInfo.fromJson(Map<String, dynamic> json) {
    clienteId = json['cliente_id'];
    primeiroNome = json['primeiro_nome'];
    foto = json['foto'];
    pontuacao = json['pontuacao'];
  }
}
