import 'package:get/get.dart';
import '../data/repository/reservation_repo.dart';
import '../models/hotel_model.dart';
import '../models/reservation_model.dart';

class ReservationController extends GetxController {
  final ReservationRepo reservationRepo;

  ReservationController({ required this.reservationRepo});
  ReservationModel? _reservationData;
  ReservationModel? get reservationData => _reservationData;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getReservationData() async {
    Response response = await reservationRepo.getReservationData();
    if (response.statusCode == 200) {
      _reservationData = ReservationModel.fromJson(response.body);
      _isLoaded = true;
      update();
    } else {}
  }
}