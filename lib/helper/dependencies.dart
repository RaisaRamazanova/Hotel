import 'package:get/get.dart';
import 'package:hotel/data/repository/reservation_repo.dart';
import '../../controllers/hotel_controller.dart';
import '../../controllers/hotel_room_controller.dart';
import '../controllers/reservation_controller.dart';
import '../data/api/api_client.dart';
import '../data/repository/hotel_repo.dart';
import '../data/repository/hotel_room_repo.dart';
import '../utils/app_constants.dart';

Future<void> init() async {
  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  // repos
  Get.lazyPut(() => HotelRepo(appClient: Get.find()));
  Get.lazyPut(() => HotelRoomRepo(appClient: Get.find()));
  Get.lazyPut(() => ReservationRepo(appClient: Get.find()));

  // controllers
  Get.lazyPut(() => HotelController(hotelRepo: Get.find()));
  Get.lazyPut(() => HotelRoomController(hotelRoomRepo: Get.find()));
  Get.lazyPut(() => ReservationController(reservationRepo: Get.find()));
}