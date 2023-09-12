import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../models/hotel_room_model.dart';
import '../../rotes/rotes_helper.dart';
import '../../utils/colors.dart';

class Room extends StatefulWidget {
  Rooms room;
  double screenWidth;
  Room( {required this.room, required this.screenWidth, super.key});

  @override
  State<Room> createState() => _RoomState();
}

class _RoomState extends State<Room> {
  PageController pageController = PageController(viewportFraction: 1);
  var _currPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16.r))
            ),
            child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.r), bottomRight: Radius.circular(12.r))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16.h,),
                        Stack(
                            children: [
                              Positioned(
                                child: SizedBox(
                                  height: 257.h,
                                  child: PageView.builder(
                                      controller: pageController,
                                      itemCount: widget.room.imageUrls!.length,
                                      itemBuilder: (context, position) {
                                        return _buildPageItem(position, widget.room.imageUrls![position]);
                                      }
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 230.h,
                                  left: widget.screenWidth / 2 - 51.w,
                                  child: Container(
                                      width: 70.w,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(5.r))
                                      ),
                                      child: DotsIndicator(
                                        dotsCount:  widget.room.imageUrls!.length,
                                        position: _currPageValue.toInt(),
                                        decorator: DotsDecorator(
                                          activeColor: Colors.black,
                                          size: const Size.square(9.0),
                                          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0.r)),
                                        ),
                                      )
                                  )
                              ),
                            ]
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16.h),
                        Text( widget.room.name!, style: TextStyle(color:  Colors.black, fontWeight: FontWeight.w500, fontSize: 22.sp),),
                        SizedBox(height: 8.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var peculiaritie in  widget.room.peculiarities!) _buildPeculiarities(peculiaritie)
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                          width: 210.w,
                          decoration: BoxDecoration(
                              color: AppColors.blue.withOpacity(0.1),
                              borderRadius: BorderRadius.all(Radius.circular(5.r))
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Подробнее о номере', style: TextStyle(color:  AppColors.blue, fontWeight: FontWeight.w500, fontSize: 16.sp),),
                              SizedBox(width: 3.w,),
                              Icon(Icons.arrow_forward_ios_outlined, color: AppColors.blue,),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${widget.room.price!.toString()} ₽', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 30.sp),),
                            Text( widget.room.pricePer!, style: TextStyle(color:  AppColors.grey, fontWeight: FontWeight.w400, fontSize: 16.sp),),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RouteHelper.getReservation());
                          },
                          child: SizedBox(
                              width: double.maxFinite,
                              child: Container(
                                height: 48.h,
                                margin: EdgeInsets.only(top: 12.h, bottom: 16.h),
                                decoration: BoxDecoration(
                                    color: AppColors.blue,
                                    borderRadius: BorderRadius.all(Radius.circular(15.r))
                                ),
                                child: Center(
                                  child: Text(
                                    'Выбрать номер',
                                    style: TextStyle(color:  Colors.white, fontWeight: FontWeight.w500, fontSize: 16.sp),
                                  ),
                                ),
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
            ),
          ),
          SizedBox(height: 8.h,),
        ]
    );
  }

  Widget _buildPeculiarities(String title) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
            decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.all(Radius.circular(5.r))
            ),
            child: Text(
              title,
              style: TextStyle(color:  AppColors.grey, fontWeight: FontWeight.w500, fontSize: 14.sp),)
        ),
        SizedBox(height: 8.h),
      ],
    );
  }

  Widget _buildPageItem(int index, String imgUrl){
    return Stack(
      children: [
        Container(
          height: 257.h,
          margin: EdgeInsets.only(left: 10.w, right: 10.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: index.isEven? const Color(0xFF69c5df) : const Color(0xFF9294cc),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imgUrl)
              )
          ),
        )
      ],
    );
  }
}
