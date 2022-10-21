import 'package:counter_app_getx/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constant/get_pages_constant.dart';
import 'constant/route_constant.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX API Demo',
      theme: ThemeData.dark(),
      getPages: getPages,
      home: HomeScreen(),
      initialRoute: RouteConstant.homeScreen,
      debugShowCheckedModeBanner: false,
    );
  }
}


