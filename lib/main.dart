import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'application.dart';
import 'global.dart';

/// 启动程序
Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //启动页
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // 初始化全局配置
  await Global.init();
  // 启动应用
  runApp(const Application());
  //设置状态栏
  // _initStatusBar();
  //关闭启动页
  FlutterNativeSplash.remove();
}

// ///设置状态栏
// void _initStatusBar() {
//   if (Platform.isAndroid) {
//     //设置Android头部的导航栏透明
//
//     SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
//         statusBarColor: Colors.transparent, //全局设置透明
//
//         statusBarIconBrightness: Brightness.dark
//
//         //light:黑色图标 dark：白色图标
//
//         //在此处设置statusBarIconBrightness为全局设置
//
//         );
//
//     SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
//   }
// }