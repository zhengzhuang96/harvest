/*
 * @Author: {zhengzhuang}
 * @Date: 2024-03-13 22:19:56
 * @LastEditors: {zhengzhuang}
 * @LastEditTime: 2024-03-13 22:54:39
 * @Description: 
 */
import 'dart:convert';

import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keymap/keymap.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('harvest'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10.0),
            Text(
              '一款兼容mac和win的快捷翻译软件',
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(30),
              ),
            ),
            _buildMaterialButton('创建新窗口', () async {
              final window = await DesktopMultiWindow.createWindow(jsonEncode({
                'args1': 'Sub window',
                'args2': 100,
                'args3': true,
                'business': 'business_test',
              }));

              window
                ..setFrame(const Offset(0, 0) & const Size(1280, 720))
                ..center()
                ..setTitle('Another window')
                ..show();
            }),
            // const MyWidget()
          ],
        ),
      ),
    );
  }

  // 按钮组件
  Widget _buildMaterialButton(String text, VoidCallback onPressed) {
    return MaterialButton(
      minWidth: ScreenUtil().setWidth(500),
      height: ScreenUtil().setHeight(80),
      color: Colors.blueAccent,
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: ScreenUtil().setSp(30),
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return KeyboardWidget(
      bindings: [
        KeyAction.fromString('A', 'increment the counter', () {
          setState(() {
            count++;
          });
        }, isControlPressed: true),
        KeyAction(LogicalKeyboardKey.keyD, 'decrement the counter', () {
          setState(() {
            count--;
          });
        }, isAltPressed: true, isControlPressed: true),
      ],
      child: Column(
        children: [
          const Text('Up arrow for adding, down arrow to subtract'),
          Text('count: $count'),
        ],
      ),
    );
  }
}
