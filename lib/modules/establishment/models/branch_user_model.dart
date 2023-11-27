class BranchUserModel {
  int? status;
  String? mensagem;
  UsuarioFilial? usuarioFilial;

  BranchUserModel({this.status, this.mensagem, this.usuarioFilial});

  BranchUserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    mensagem = json['mensagem'];
    usuarioFilial = json['usuarioFilial'] != null
        ? UsuarioFilial.fromJson(json['usuarioFilial'])
        : null;
  }
}

class UsuarioFilial {
  int? idLoginFilial;
  int? idFilial;
  String? usuario;
  String? email;
  String? login;
  int? estabelecimentoId;
  String? codigo;

  UsuarioFilial(
      {this.idLoginFilial,
      this.usuario,
      this.email,
      this.login,
      this.estabelecimentoId,
      this.codigo});

  UsuarioFilial.fromJson(Map<String, dynamic> json) {
    idLoginFilial = json['id_login_filial'];
    usuario = json['usuario'];
    email = json['email'];
    login = json['login'];
    estabelecimentoId = json['estabelecimento_id'];
    codigo = json['codigo'];
  }
}
