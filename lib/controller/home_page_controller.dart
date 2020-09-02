import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_hasura_crud_example/model/produto.dart';
import 'package:getx_hasura_crud_example/repository/produto_repository.dart';

class HomePageController extends GetxController{
  static HomePageController get to => Get.find();
  final _produtoRepository = Get.find<ProdutoRepository>();

  TextEditingController nomeController = TextEditingController();
  TextEditingController valorController = TextEditingController();
  ScrollController scrollController = ScrollController();
  final msgCarregando = "carregando".obs;

  int _maxOffSet = 10;
  final _listPaginada = List<Produto>().obs;
  List<Produto> get listPaginada => _listPaginada;

  Future refrestList() async {
    _listPaginada.value = await _produtoRepository.getProdutosPaginados(0);
    _maxOffSet = 10;
    scrollController.position.jumpTo(0);
    Get.snackbar("Lista","Atualizada",snackPosition: SnackPosition.BOTTOM);
  }

  Future<void> adicionarProduto() async {
    Produto produto = Produto(nome: nomeController.text,valor: double.parse(valorController.text));
    clearTextEditingController();
    Get.back();
    await  _produtoRepository.adicionarProduto(produto);
    refrestList();
  }

  Future<void> editarProduto(int id) async {
    Produto produto = Produto(id: id, nome: nomeController.text,valor: double.parse(valorController.text));
    clearTextEditingController();
    Get.back();
    await _produtoRepository.editarProduto(produto);
    refrestList();
  }

  Future<void> deletarProduto(int id) async {
    await _produtoRepository.deletarProduto(id);
    refrestList();
  }

  void clearTextEditingController() {
    nomeController.clear();
    valorController.clear();
  }

  Future paginationOffSet() async {
    scrollController.addListener(() async {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
        msgCarregando.value = "carregando";
        _listPaginada.addAll(await _produtoRepository.getProdutosPaginados(_maxOffSet));
        _maxOffSet = _maxOffSet + 10;
        msgCarregando.value = "acabou";
      }
    });
  }

  @override
  void onInit() async {
    _listPaginada.value = await _produtoRepository.getProdutosPaginados(0);
    await paginationOffSet();
    super.onInit();
  }
}