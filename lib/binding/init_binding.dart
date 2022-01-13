import 'package:flutter_youtube_clone/controller/app_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';

class InitBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(AppController());
  }
}