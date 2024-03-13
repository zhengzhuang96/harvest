/*
 * @Author: {zhengzhuang}
 * @Date: 2024-03-13 20:46:37
 * @LastEditors: {zhengzhuang}
 * @LastEditTime: 2024-03-13 22:57:36
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'pages/index_page.dart';
import 'routes/routes.dart';
import 'routes/getx_router_observer.dart';

void main(List<String> args) {
  // mian函数中对窗口初始化模式进行控制
  if (args.firstOrNull == 'multi_window') {
    runApp(const SubWindow());
  } else {
    runApp(const MyApp());
  }
}

class SubWindow extends StatelessWidget {
  const SubWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(750, 1334),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          getPages: Routes.getPages,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.blue,
          ),
          home: const Text('123123'),

          /// 资源释放监听器
          navigatorObservers: [GetXRouterObserver()],
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(750, 1334),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          getPages: Routes.getPages,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.blue,
          ),
          home: const IndexPage(),

          /// 资源释放监听器
          navigatorObservers: [GetXRouterObserver()],
        );
      },
    );
  }
}
