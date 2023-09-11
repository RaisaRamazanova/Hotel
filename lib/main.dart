import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hotel/pages/hotel/main_hotel_page.dart';
import 'package:hotel/pages/rotes/rotes_helper.dart';
import 'controllers/hotel_controller.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dep.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<HotelController>().getHotelData();
    return ScreenUtilInit(
      child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Hotel',
          home: const HotelPage(),
          initialRoute: RouteHelper.initial,
          getPages: RouteHelper.routes
      ),
    );
  }
}
