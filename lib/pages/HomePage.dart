import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_hasura_crud_example/controller/home_page_controller.dart';
import 'package:getx_hasura_crud_example/model/produto.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista Paginada"),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: HomePageController.to.refrestList,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: adicionarDialog,
      ),
      body: Obx(
        () => ListView.builder(
          controller: HomePageController.to.scrollController,
          itemCount: HomePageController.to.listPaginada.length + 1,
          itemBuilder: (context, index) {
            if (index == HomePageController.to.listPaginada.length) {
              return Center(child: Obx(() => Text(HomePageController.to.msgCarregando.value)));
            }
            Produto produto = HomePageController.to.listPaginada[index];
            return Container(
              height: 100,
              child: ListTile(
                onTap: (){
                  editarDialog(produto);
                },
                leading: Text("${produto.id}"),
                title: Text("${produto.nome}"),
                subtitle: Text("${produto.valor}"),
                isThreeLine: true,
                trailing: IconButton(
                  onPressed: (){
                    HomePageController.to.deletarProduto(produto.id);
                  },
                  icon: Icon(Icons.delete),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void adicionarDialog() {
    HomePageController.to.clearTextEditingController();
    Get.defaultDialog(
      title: "Adicionar produto",
      content: Column(
        children: [
          TextField(
            controller: HomePageController.to.nomeController,
            decoration: InputDecoration(
                hintText: "Nome"
            ),
          ),
          TextField(
            controller: HomePageController.to.valorController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Valor"
            ),
          ),
        ],
      ),
      actions: [
        FlatButton(
          child: Text("voltar"),
          onPressed: Get.back,
        ),
        FlatButton(
          child: Text("Adicionar"),
          onPressed: HomePageController.to.adicionarProduto,
        ),
      ],
    );
  }

  void editarDialog(Produto produto){
    HomePageController.to.nomeController.text = produto.nome;
    HomePageController.to.valorController.text = produto.valor.toString();
    Get.defaultDialog(
      title: "Editar produto",
      content: Column(
        children: [
          TextField(
            controller: HomePageController.to.nomeController,
            decoration: InputDecoration(
                hintText: "Nome"
            ),
          ),
          TextField(
            controller: HomePageController.to.valorController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: "Valor"
            ),
          ),
        ],
      ),
      actions: [
        FlatButton(
          child: Text("voltar"),
          onPressed: Get.back,
        ),
        FlatButton(
          child: Text("Editar"),
          onPressed: () => HomePageController.to.editarProduto(produto.id),
        ),
      ],
    );
  }
}
