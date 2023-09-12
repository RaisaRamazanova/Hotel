import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel/pages/hotel_rooms/room_widget.dart';
import '../../models/hotel_room_model.dart';

class RoomsPage extends StatefulWidget {
  HotelRoomModel roomData;
  double screenWidth;
  RoomsPage({ required this.roomData, required this.screenWidth, super.key});

  @override
  State<RoomsPage> createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(height: 8.h, color: Colors.transparent,),
        for (var room in widget.roomData.rooms!) Room(room: room, screenWidth: widget.screenWidth,),
      ],
    );
  }
}