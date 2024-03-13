/*
 * @Author: {zhengzhuang}
 * @Date: 2024-03-13 22:21:01
 * @LastEditors: {zhengzhuang}
 * @LastEditTime: 2024-03-13 22:21:03
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/router_report.dart';

class GetXRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    RouterReportManager.reportCurrentRoute(route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) async {
    RouterReportManager.reportRouteDispose(route);
  }
}
