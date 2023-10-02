import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../rotes/rotes_helper.dart';
import '../../utils/colors.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 60,
            left: 0,
            right: 0,
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
                              Get.toNamed(RouteHelper.getReservation());
                            },
                            child: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black,)
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Заказ оплачен',
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
          Positioned.fill(
            top: 200,
            child: Align(
                alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                      height: 94.h,
                      width: 94.h,
                      decoration: BoxDecoration(
                          color: AppColors.bgColor,
                          borderRadius: const BorderRadius.all(Radius.circular(1000))
                      ),
                      child: const Center(
                        child: Text(
                          '🎉',
                          style: TextStyle(
                              fontSize: 50
                          ),
                        ),
                      )
                  ),
                  SizedBox(height: 32.h,),
                  const Text(
                      'Ваш заказ принят в работу',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500
                      )
                  ),
                  SizedBox(height: 20.h,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 23.w),
                    child: Text(
                        'Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.',
                        style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w400
                        ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child:
            Column(
              children: [
                Container(height: 1.h, color: AppColors.grey.withOpacity(0.15),),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).popUntil(ModalRoute.withName(RouteHelper.getInitial()));
                  },
                  child: SizedBox(
                      width: double.maxFinite,
                      child: Container(
                        height: 48.h,
                        margin: EdgeInsets.only(right: 16.w, left: 16.w, top: 12.h, bottom: 28.h),
                        decoration: BoxDecoration(
                            color: AppColors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(15.r))
                        ),
                        child: Center(
                          child: Text(
                            'Супер!',
                            style: TextStyle(color:  Colors.white, fontWeight: FontWeight.w500, fontSize: 16.sp),
                          ),
                        ),
                      )
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
