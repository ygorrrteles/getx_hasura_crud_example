import 'package:get/get.dart';
import 'package:getx_hasura_crud_example/controller/home_page_controller.dart';
import 'package:getx_hasura_crud_example/repository/hasura_settings.dart';
import 'package:getx_hasura_crud_example/repository/produto_repository.dart';

class HomePageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController());
    Get.lazyPut<HasuraSettings>(() => HasuraSettings());
    Get.lazyPut<ProdutoRepository>(() => ProdutoRepository());
  }
}