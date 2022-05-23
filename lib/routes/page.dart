import 'package:Prelude/step1.dart';
import 'package:Prelude/step1_controller.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: "/step1", page: () => Step1Page(),
    binding: BindingsBuilder(() {
      Get.lazyPut(() => Step1Controller());
    }))
  ];
}