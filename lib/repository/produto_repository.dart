import 'package:get/get.dart';
import 'package:getx_hasura_crud_example/model/produto.dart';
import 'package:getx_hasura_crud_example/repository/hasura_settings.dart';
import 'package:getx_hasura_crud_example/repository/queries/produto_queries.dart';

class ProdutoRepository {
  final hasuraSettings = Get.find<HasuraSettings>();

  static ProdutoRepository get to => Get.find();

  Future<List<Produto>> getProdutosPaginados(int offset) async {
    var query = ProdutoQueries.LISTA_PAGINADA;
    var snapshot = await hasuraSettings.connect.query(query, variables: {"offset": offset});
    return Produto.fromJsonListSimples(snapshot["data"]["produto"]);
  }

  Future<void> adicionarProduto(Produto produto) async {
    var query = ProdutoQueries.ADICIONAR_PRODUTO;
    return await hasuraSettings.connect.mutation(query, variables: {
      "valor": produto.valor,
      "nome": produto.nome,
    });
  }

  Future<void> deletarProduto(int id) async {
    var query = ProdutoQueries.DELETE_PRODUTO;
    return await hasuraSettings.connect.mutation(query, variables: {
      "id": id,
    });
  }

  Future<void> editarProduto(Produto produto) async {
    var query = ProdutoQueries.EDITAR_PRODUTO;
    return await hasuraSettings.connect.mutation(query, variables: {
      "id": produto.id,
      "valor": produto.valor,
      "nome": produto.nome,
    });
  }
}
