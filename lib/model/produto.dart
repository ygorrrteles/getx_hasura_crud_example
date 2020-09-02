import 'dart:convert';

class Produto {
  Produto({
    this.id,
    this.nome,
    this.valor,
  });

  final int id;
  final String nome;
  final double valor;

  Produto copyWith({
    int id,
    String nome,
    double valor,
  }) =>
      Produto(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        valor: valor ?? this.valor,
      );

  factory Produto.fromJson(String str) => Produto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Produto.fromMap(Map<String, dynamic> json) => Produto(
    id: json["id"],
    nome: json["nome"],
    valor: json["valor"].toDouble(),
  );

  factory Produto.fromMapSimples(Map<String, dynamic> json) => Produto(
    id: json["id"],
    nome: json["nome"],
    valor: json["valor"].toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "nome": nome,
    "valor": valor,
  };

  static List<Produto> fromJsonList(List list) {
    if(list == null) return null;
    return list.map<Produto>((item) => Produto.fromMap(item)).toList();
  }

  static List<Produto> fromJsonListSimples(List list) {
    if(list == null) return null;
    return list.map<Produto>((item) => Produto.fromMapSimples(item)).toList();
  }
}
