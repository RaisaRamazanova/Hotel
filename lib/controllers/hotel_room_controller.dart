import 'package:get/get.dart';
import '../data/repository/hotel_room_repo.dart';
import '../models/hotel_room_model.dart';

class HotelRoomController extends GetxController {
  final HotelRoomRepo hotelRoomRepo;

  HotelRoomController({ required this.hotelRoomRepo});
  HotelRoomModel? _hotelRoomData;
  HotelRoomModel? get hotelRoomData => _hotelRoomData;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getHotelRoomData() async {
    Response response = await hotelRoomRepo.getHotelRoomData();
    if (response.statusCode == 200) {
      _hotelRoomData = HotelRoomModel.fromJson(response.body);
      _isLoaded = true;
      update();
    } else {}
  }
}