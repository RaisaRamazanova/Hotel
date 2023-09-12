import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dots_indicator/dots_indicator.dart';
import '../../../controllers/hotel_controller.dart';
import '../../rotes/rotes_helper.dart';
import '../../utils/colors.dart';

class HotelPageBody extends StatefulWidget {
  const HotelPageBody({super.key});

  @override
  State<HotelPageBody> createState() => _HotelPageBodyState();
}

class _HotelPageBodyState extends State<HotelPageBody> {
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
    return GetBuilder<HotelController>(builder:(data) {
      return data.hotelData != null
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
                              itemCount: data.hotelData!.imageUrls!.length,
                              itemBuilder: (context, position) {
                                return _buildPageItem(position, data.hotelData!.imageUrls![position]);
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
                              dotsCount: data.hotelData == null ? 1 : data.hotelData!.imageUrls!.length,
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
                            Text(data.hotelData!.rating.toString(), style: TextStyle(color:  AppColors.orange, fontWeight: FontWeight.w500, fontSize: 16.sp),),
                            SizedBox(width: 5.w,),
                            Text(data!.hotelData!.ratingName!, style: TextStyle(color:  AppColors.orange, fontWeight: FontWeight.w500, fontSize: 16.sp),)
                          ],
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(data.hotelData!.name!, style: TextStyle(color:  Colors.black, fontWeight: FontWeight.w500, fontSize: 22.sp),),
                      SizedBox(height: 8.h),
                      Text(data.hotelData!.adress!, style: TextStyle(color:  AppColors.blue, fontWeight: FontWeight.w500, fontSize: 14.sp),),
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          Text('от ${data.hotelData!.minimalPrice} ₽', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 30.sp),),
                          SizedBox(width: 5.w),
                          Text(data.hotelData!.priceForIt!, style: TextStyle(color:  AppColors.grey, fontWeight: FontWeight.w400, fontSize: 16.sp),),
                        ],
                      ),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h,),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12.r))
            ),
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h,),
                Text(
                  'Об отеле',
                  style: TextStyle(fontFamily: 'SF-Pro-Display', fontSize: 22.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 16.h),
                Row(children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                      decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          borderRadius: BorderRadius.all(Radius.circular(5.r))
                      ),
                      child: Text(
                        data.hotelData!.aboutTheHotel!.peculiarities![0],
                        style: TextStyle(color:  AppColors.grey, fontWeight: FontWeight.w500, fontSize: 14.sp),)
                  )
                ],),
                SizedBox(height: 8.h),
                Row(children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                      decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          borderRadius: BorderRadius.all(Radius.circular(5.r))
                      ),
                      child: Text(
                        data.hotelData!.aboutTheHotel!.peculiarities![1],
                        style: TextStyle(color:  AppColors.grey, fontWeight: FontWeight.w500, fontSize: 14.sp),)
                  ),
                  SizedBox(width: 8.w),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                      decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          borderRadius: BorderRadius.all(Radius.circular(5.r))
                      ),
                      child: Text(
                        data.hotelData!.aboutTheHotel!.peculiarities![2],
                        style: TextStyle(color:  AppColors.grey, fontWeight: FontWeight.w500, fontSize: 14.sp),)
                  ),
                ],),
                SizedBox(height: 8.h),
                Row(children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                      decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          borderRadius: BorderRadius.all(Radius.circular(5.r))
                      ),
                      child: Text(
                        data.hotelData!.aboutTheHotel!.peculiarities![3],
                        style: TextStyle(color:  AppColors.grey, fontWeight: FontWeight.w500, fontSize: 14.sp),)
                  )
                ],),
                SizedBox(height: 8.h),
                Text(
                  data.hotelData!.aboutTheHotel!.description!,
                  style: TextStyle(color:  Colors.black.withOpacity(0.9), fontWeight: FontWeight.w400, fontSize: 16.sp),),
                SizedBox(height: 16.h),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                    decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.all(Radius.circular(15.r))
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 24.h,
                                  height: 24.h,
                                  child: Image.asset('assets/images/emoji-happy.png', fit: BoxFit.fill,),
                                ),
                                SizedBox(width: 12.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Удобства',
                                      style: TextStyle(color:  AppColors.dark, fontWeight: FontWeight.w500, fontSize: 16.sp),),
                                    SizedBox(height: 2.h),
                                    Text(
                                      'Самое необходимое',
                                      style: TextStyle(color: AppColors.grey, fontWeight: FontWeight.w500, fontSize: 14.sp),),
                                  ],
                                ),
                              ],
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.arrow_forward_ios_outlined, size: 12,)
                              ],
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 30.w),
                          height: 1.h,
                          color: AppColors.grey.withOpacity(0.15),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 24.h,
                                  height: 24.h,
                                  child: Image.asset('assets/images/tick-square.png', fit: BoxFit.fill,),
                                ),
                                SizedBox(width: 12.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Удобства',
                                      style: TextStyle(color:  AppColors.dark, fontWeight: FontWeight.w500, fontSize: 16.sp),),
                                    SizedBox(height: 2.h),
                                    Text(
                                      'Самое необходимое',
                                      style: TextStyle(color: AppColors.grey, fontWeight: FontWeight.w500, fontSize: 14.sp),),
                                  ],
                                ),
                              ],
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.arrow_forward_ios_outlined, size: 12,)
                              ],
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 30.w),
                          height: 1.h,
                          color: AppColors.grey.withOpacity(0.15),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 24.h,
                                  height: 24.h,
                                  child: Image.asset('assets/images/close-square.png', fit: BoxFit.fill,),
                                ),
                                SizedBox(width: 12.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Удобства',
                                      style: TextStyle(color:  AppColors.dark, fontWeight: FontWeight.w500, fontSize: 16.sp),),
                                    SizedBox(height: 2.h),
                                    Text(
                                      'Самое необходимое',
                                      style: TextStyle(color: AppColors.grey, fontWeight: FontWeight.w500, fontSize: 14.sp),),
                                  ],
                                ),
                              ],
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.arrow_forward_ios_outlined, size: 12,)
                              ],
                            )
                          ],
                        ),
                      ],
                    )
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          Container(height: 1.h, color: AppColors.grey.withOpacity(0.15),),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getHotelRoom());
            },
            child: Container(
                width: double.maxFinite,
                color: Colors.white,
                child: Container(
                  height: 48.h,
                  margin: EdgeInsets.only(right: 16.w, left: 16.w, top: 12.h, bottom: 28.h),
                  decoration: BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(15.r))
                  ),
                  child: Center(
                    child: Text(
                      'К выбору номера',
                      style: TextStyle(color:  Colors.white, fontWeight: FontWeight.w500, fontSize: 16.sp),
                    ),
                  ),
                )
            ),
          ),
        ],
      )
          : Center(
            child: Container(
              padding: EdgeInsets.only(top: 100.h),
              child: const CircularProgressIndicator(
              color: Colors.blue
              ),
            ),
          );
    });
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
