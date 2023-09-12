import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import '../../utils/app_constants.dart';
import '../api/api_client.dart';

class ReservationRepo extends GetxService {
  final ApiClient appClient;
  ReservationRepo({ required this.appClient});

  Future<Response> getReservationData() async {
    return await appClient.getData(AppConstants.RESERVATION_URI);
  }
}