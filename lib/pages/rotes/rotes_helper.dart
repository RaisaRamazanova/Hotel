import 'package:get/get.dart';
import '../hotel_room/hotel_room_page.dart';
import '../hotel/main_hotel_page.dart';

class RouteHelper {
  static const String initial = "/";
  static const String hotelRoom = "/hotel-room";
  static const String reservation = "/reservation";
  static const String order = "/order";

  static String getInitial() => "$initial";
  static String getHotelRoom() => "$hotelRoom";
  static String getReservation() => "$reservation";
  static String getOrder() => "$order";

  static List<GetPage> routes = [
    GetPage(name: initial, page: () { return const HotelPage();}),
    GetPage(name: hotelRoom, page: () { return const HotelRoomPage();}),
    // GetPage(name: reservation, page: () { return ReservationPage();}),
    // GetPage(name: order, page: () { return OrderRoom();}),
  ];
}