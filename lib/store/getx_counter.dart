/*
 * @Author: {zhengzhuang}
 * @Date: 2024-03-13 22:21:22
 * @LastEditors: {zhengzhuang}
 * @LastEditTime: 2024-03-13 22:21:24
 * @Description: 
 */
import 'package:get/get.dart';

class GetxCounter extends GetxController {
  var count = 0;

  // 增加计数器
  void increase() {
    ++count;
    update();
  }

  // 减少计数器
  void decrease() {
    --count;
    update();
  }
}
