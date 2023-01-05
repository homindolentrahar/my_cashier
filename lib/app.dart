import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:my_cashier/presentation/app_theme.dart';
import 'package:my_cashier/presentation/binding/app_binding.dart';
import 'package:my_cashier/route/route_name.dart';
import 'package:my_cashier/route/route_page.dart';

class MyCashierApp extends StatelessWidget {
  const MyCashierApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: RoutePage.pages,
      initialRoute: RouteName.initialRoute,
      initialBinding: AppBinding(),
      builder: EasyLoading.init(),
      theme: AppTheme.theme,
    );
  }
}
