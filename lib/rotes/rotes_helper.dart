import 'package:get/get.dart';
import 'package:hotel/pages/order/order_page.dart';
import 'package:hotel/pages/reservation/reservation_page.dart';
import '../pages/hotel/main_hotel_page.dart';
import '../pages/hotel_rooms/hotel_rooms_page.dart';

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
    GetPage(name: hotelRoom, page: () { return const HotelRoomsPage();}),
    GetPage(name: reservation, page: () { return ReservationPage();}),
    GetPage(name: order, page: () { return const OrderPage();}),
  ];
}