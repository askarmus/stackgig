import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_controller.dart';
import 'app_routes.dart';
import 'binding/app_binding.dart';
import 'utils/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    _appController.fetchLocalFavQuizIds();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
      title: 'StackGIG',
      theme: ThemeData(
        fontFamily: "Cairo",
        primarySwatch: AppColors.WHITE,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: AppRoutes.SPLASH_SCREEN,
      getPages: AppRoutes.getAppRoutes,
    );
  }
}
