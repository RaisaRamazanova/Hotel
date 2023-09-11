import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import '../../pages/utils/app_constants.dart';
import '../api/api_client.dart';

class HotelRoomRepo extends GetxService {
  final ApiClient appClient;
  HotelRoomRepo({ required this.appClient});

  Future<Response> getHotelRoomData() async {
    return await appClient.getData(AppConstants.HOTEL_ROOMS_URI);
  }
}