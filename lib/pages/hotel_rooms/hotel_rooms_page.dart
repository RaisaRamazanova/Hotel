import 'package:flutter/material.dart';
import 'package:hotel/pages/hotel_rooms/rooms_page.dart';
import '../../../controllers/hotel_room_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../rotes/rotes_helper.dart';
import '../../utils/colors.dart';

class HotelRoomsPage extends StatelessWidget {
  const HotelRoomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        children: [
          Container(height: 60.h, color: Colors.white,),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.toNamed(RouteHelper.getInitial());
                            },
                            child: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black,))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Номера',
                          style: TextStyle(fontFamily: 'SF-Pro-Display', fontSize: 18.sp, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(width: 10.w,)
                  ],
                ),
                SizedBox(height: 16.h,),
              ],
            ),
          ),
          Expanded(child: SingleChildScrollView(
              child: GetBuilder<HotelRoomController>(builder:(data) {
                return data.hotelRoomData != null
                    ? RoomsPage(roomData: data.hotelRoomData!, screenWidth: Get.context!.width)
                    : Container(
                        padding: EdgeInsets.only(top: 40.h),
                        height: 20.h,
                        width: 20.h,
                        child: const CircularProgressIndicator(
                            color: Colors.red
                        ),
                      );
              })
          )
          ),
        ],
      ),
    );
  }
}
