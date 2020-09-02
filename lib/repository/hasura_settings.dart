import 'package:get/get.dart';
import 'package:hasura_connect/hasura_connect.dart';

class HasuraSettings extends GetxController{
  static HasuraSettings get to => Get.find();

  HasuraConnect connect = HasuraConnect("API-KEY");
}