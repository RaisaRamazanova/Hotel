import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hotel/controllers/reservation_controller.dart';
import 'package:hotel/pages/hotel/main_hotel_page.dart';
import 'package:hotel/rotes/rotes_helper.dart';
import 'controllers/hotel_controller.dart';
import 'controllers/hotel_room_controller.dart';
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
    Get.find<HotelRoomController>().getHotelRoomData();
    Get.find<ReservationController>().getReservationData();
    return ScreenUtilInit(
      child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Hotel',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            dividerColor: Colors.transparent,
          ),
          home: const HotelPage(),
          initialRoute: RouteHelper.initial,
          getPages: RouteHelper.routes
      ),
    );
  }
}
