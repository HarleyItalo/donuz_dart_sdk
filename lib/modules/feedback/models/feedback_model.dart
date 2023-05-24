class FeedbackModel {
  int? status;
  String? mensagem;
  int? total;
  String? idEstabelecimento;
  String? estabelecimento;
  String? logo;
  Pesquisa? pesquisa;

  FeedbackModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    mensagem = json['mensagem'];
    total = json['total'];
    idEstabelecimento = json['id_estabelecimento'];
    estabelecimento = json['estabelecimento'];
    logo = json['logo'];
    pesquisa =
        json['pesquisa'] != null ? Pesquisa.fromJson(json['pesquisa']) : null;
  }
}

class Pesquisa {
  String? id;
  String? titulo;
  String? pts;
  String? delay;
  String? hash;
  bool? respondida;
  int? totalPerguntas;
  List<Perguntas>? perguntas;

  Pesquisa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    pts = json['pts'];
    delay = json['delay'];
    hash = json['hash'];
    respondida = json['respondida'];
    totalPerguntas = json['total_perguntas'];
    if (json['perguntas'] != null) {
      perguntas = <Perguntas>[];
      json['perguntas'].forEach((v) {
        perguntas!.add(Perguntas.fromJson(v));
      });
    }
  }
}

class Perguntas {
  String? id;
  String? pergunta;
  String? tipo;
  List<Alternativas>? alternativas;

  Perguntas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pergunta = json['pergunta'];
    tipo = json['tipo'];
    if (json['alternativas'] != null) {
      alternativas = <Alternativas>[];
      json['alternativas'].forEach((v) {
        alternativas!.add(Alternativas.fromJson(v));
      });
    }
  }
}

class Alternativas {
  String? idPesquisaAlternativa;
  String? idPergunta;
  String? valor;
  Alternativas.fromJson(Map<String, dynamic> json) {
    idPesquisaAlternativa = json['id_pesquisa_alternativa'];
    idPergunta = json['id_pergunta'];
    valor = json['valor'];
  }
}
