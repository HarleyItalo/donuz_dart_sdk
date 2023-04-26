import 'package:intl/intl.dart';

class PointInsertModel {
  final String? valor;
  final String? descricao;
  final String? regra;
  final String? cliente;
  final DateTime? dataDeInsercao;
  final String? controle;
  final int? filialId;
  final String? codigoDoProduto;
  final int? usuarioId;

  PointInsertModel({
    this.valor,
    this.descricao,
    this.regra,
    this.cliente,
    this.dataDeInsercao,
    this.controle,
    this.codigoDoProduto,
    this.filialId,
    this.usuarioId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['valor'] = valor;
    data['descricao'] = descricao;
    data['cliente'] = cliente;
    if (dataDeInsercao != null) {
      final formater = DateFormat('yyyy-MM-dd');
      data['data_de_insercao'] = formater.format(dataDeInsercao!);
    }
    data['regra'] = regra;
    data['controle'] = controle;
    data['usuario_id'] = usuarioId;
    data['filial_id'] = filialId;
    data['codigo_do_produto'] = codigoDoProduto;
    return data;
  }
}
