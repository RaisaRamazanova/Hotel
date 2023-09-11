import 'package:get/get.dart';
import '../../controllers/hotel_controller.dart';
import '../../controllers/hotel_room_controller.dart';
import '../data/api/api_client.dart';
import '../data/repository/hotel_repository.dart';
import '../data/repository/hotel_room_repo.dart';
import '../pages/utils/app_constants.dart';

Future<void> init() async {
  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  // repos
  Get.lazyPut(() => HotelRepo(appClient: Get.find()));
  Get.lazyPut(() => HotelRoomRepo(appClient: Get.find()));

  // controllers
  Get.lazyPut(() => HotelController(hotelRepo: Get.find()));
  Get.lazyPut(() => HotelRoomController(hotelRoomRepo: Get.find()));
}