import '../controller/home_controller.dart';
import 'package:get/get.dart';

class HomeScreenBinding extends Bindings {

  @override
  void dependencies(){
    Get.lazyPut<DataController>(
        () => DataController(),
    );
  }
}