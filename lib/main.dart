import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_hasura_crud_example/bindings/home_page_binding.dart';
import 'package:getx_hasura_crud_example/pages/HomePage.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialBinding: HomePageBinding(),
      home: HomePage(),
    ),
  );
}
