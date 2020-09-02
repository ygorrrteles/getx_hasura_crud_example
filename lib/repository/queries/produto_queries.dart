class ProdutoQueries{
  static final String LISTA_PAGINADA = ''' 
query getProdutosPaginados(\$offset: Int) {
  produto(limit: 10, offset: \$offset, order_by: {id: desc}) {
    nome
    id
    valor
  }
}
''';

  static final String ADICIONAR_PRODUTO = ''' 
mutation adicionarProduto(\$valor: float8, \$nome: String,) {
  insert_produto_one(object: {nome: \$nome, valor: \$valor,}) {
    id
  }
}
''';

  static final String DELETE_PRODUTO = ''' 
mutation deleteProduto(\$id: Int!) {
  delete_produto_by_pk(id: \$id) {
    id
  }
}
''';

  static final String EDITAR_PRODUTO = ''' 
mutation editarProduto(\$nome: String, \$valor: float8, \$id: Int!) {
  update_produto_by_pk(pk_columns: {id: \$id}, _set: {nome: \$nome, valor: \$valor}) {
    id
  }
}
''';
}

