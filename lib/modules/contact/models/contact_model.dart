class ContactModel {
  String to;
  String subject;
  String nome;
  String assunto;
  String mensagem;
  String? celular;
  String? email;

  ContactModel(
      {required this.to,
      required this.subject,
      required this.nome,
      required this.assunto,
      required this.mensagem,
      this.celular,
      this.email});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['to'] = to;
    data['subject'] = subject;
    data['nome'] = nome;
    data['assunto'] = assunto;
    data['mensagem'] = mensagem;
    data['celular'] = celular;
    data['email'] = email;
    return data;
  }
}
