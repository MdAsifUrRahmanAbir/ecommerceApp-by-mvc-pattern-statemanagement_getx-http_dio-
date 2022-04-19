
import 'package:get/get.dart';
import 'package:project_b102/controller/home_screen_controller.dart';

class MyDi extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeScreenController>(() => HomeScreenController());
    // Get.put(dependency);
    // Get.putAsync(() => null);
    // Get.find();
  }

}