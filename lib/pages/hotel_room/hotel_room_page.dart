import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../../../controllers/hotel_room_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dots_indicator/dots_indicator.dart';

class HotelRoomPage extends StatefulWidget {
  const HotelRoomPage({super.key});

  @override
  State<HotelRoomPage> createState() => _HotelRoomPageState();
}

class _HotelRoomPageState extends State<HotelRoomPage> {
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
    double screenWidth = Get.context!.width;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        children: [
          Expanded(child: SingleChildScrollView(
              child: Container(
                  child: GetBuilder<HotelRoomController>(builder:(data) {
                    return data.hotelRoomData != null
                        ? Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.r), bottomRight: Radius.circular(12.r))
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 50.h,),
                                  Center(child: Text(
                                    'Отель',
                                    style: TextStyle(
                                        fontFamily: 'SF-Pro-Display',
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500
                                    ),
                                  )
                                  ),
                                  SizedBox(height: 16.h),
                                  Stack(
                                      children: [
                                        Positioned(
                                          child: SizedBox(
                                            height: 257.h,
                                            child: PageView.builder(
                                                controller: pageController,
                                                itemCount: data.hotelRoomData!.rooms!.length,
                                                itemBuilder: (context, position) {
                                                  return _buildPageItem(position, data.hotelRoomData!.rooms![0].imageUrls![position]);
                                                }
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            top: 230.h,
                                            left: screenWidth / 2 - 51.w,
                                            child: Container(
                                                width: 70.w,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.all(Radius.circular(5.r))
                                                ),
                                                child: DotsIndicator(
                                                  dotsCount: data.hotelRoomData == null ? 1 : data.hotelRoomData!.rooms![0].imageUrls!.length,
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
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 16.h),
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                                          width: 165.w,
                                          decoration: BoxDecoration(
                                              color: AppColors.lightOrange.withOpacity(0.2),
                                              borderRadius: BorderRadius.all(Radius.circular(5.r))
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Icon(Icons.star, color: AppColors.orange,),
                                              SizedBox(width: 3.w,),
                                              // Text(data.hotelRoomData!.rating.toString(), style: TextStyle(color:  AppColors.orange, fontWeight: FontWeight.w500, fontSize: 16.sp),),
                                              // SizedBox(width: 5.w,),
                                              // Text(data!.hotelRoomData!.ratingName!, style: TextStyle(color:  AppColors.orange, fontWeight: FontWeight.w500, fontSize: 16.sp),)
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 8.h),
                                        // Text(data.hotelRoomData!.name!, style: TextStyle(color:  Colors.black, fontWeight: FontWeight.w500, fontSize: 22.sp),),
                                        // SizedBox(height: 8.h),
                                        // Text(data.hotelRoomData!.adress!, style: TextStyle(color:  AppColors.blue, fontWeight: FontWeight.w500, fontSize: 14.sp),),
                                        SizedBox(height: 16.h),
                                        Row(
                                          children: [
                                            // Text('от ${data.hotelRoomData!.minimalPrice} ₽', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 30.sp),),
                                            // SizedBox(width: 5.w),
                                            // Text(data.hotelRoomData!.priceForIt!, style: TextStyle(color:  AppColors.grey, fontWeight: FontWeight.w400, fontSize: 16.sp),),
                                          ],
                                        ),
                                        SizedBox(height: 16.h),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]
                        )
                        : Container(
                      padding: EdgeInsets.only(top: 20.h),
                      child: const CircularProgressIndicator(
                          color: Colors.blue
                      ),
                    );
                  })
              )
          )
          ),
        ],
      ),
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
