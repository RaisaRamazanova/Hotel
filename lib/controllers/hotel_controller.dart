import 'package:get/get.dart';
import '../data/repository/hotel_repository.dart';
import '../models/hotel_model.dart';

class HotelController extends GetxController {
  final HotelRepo hotelRepo;

  HotelController({ required this.hotelRepo});
  HotelModel? _hotelData;
  HotelModel? get hotelData => _hotelData;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getHotelData() async {
    Response response = await hotelRepo.getHotelData();
    if (response.statusCode == 200) {
      _hotelData = HotelModel.fromJson(response.body);
      _isLoaded = true;
      update();
    } else {}
  }
}