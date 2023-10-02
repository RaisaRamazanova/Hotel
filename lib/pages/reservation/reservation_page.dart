import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hotel/controllers/reservation_controller.dart';
import 'package:hotel/pages/reservation/text_field_widget.dart';
import '../../rotes/rotes_helper.dart';
import '../../utils/colors.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({super.key});

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  int _count = 1;
  Color containerColor = AppColors.grey;
  final List<String> _touristNumber = ['Первый', 'Второй', 'Третий', 'Четвертый', 'Пятый'];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    List<Widget> _contatos = List.generate(_count, (int i) => buildListView('${_touristNumber[i]} турист'));

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: GetBuilder<ReservationController>(builder:(data) {
          return data.reservationData != null
              ? Form(
                  key: _formKey,
                  child: Column(
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
                                          Get.toNamed(RouteHelper.getHotelRoom());
                                        },
                                        child: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black,)
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Бронирование',
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
                      Container(height: 8.h, color: Colors.transparent,),
                      Expanded(child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                decoration:
                                BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(12.r)
                                    )
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(height: 8.h, color: Colors.transparent,),
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
                                          Text(data.reservationData!.horating!.toString(), style: TextStyle(color:  AppColors.orange, fontWeight: FontWeight.w500, fontSize: 16.sp),),
                                          SizedBox(width: 5.w,),
                                          Text(data.reservationData!.ratingName!, style: TextStyle(color:  AppColors.orange, fontWeight: FontWeight.w500, fontSize: 16.sp),)
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    Text(
                                      data.reservationData!.hotelName!,
                                      style: TextStyle(fontFamily: 'SF-Pro-Display', fontSize: 22.sp, fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: 8.h),
                                    Text(data.reservationData!.hotelAdress!, style: TextStyle(color:  AppColors.blue, fontWeight: FontWeight.w500, fontSize: 14.sp),),
                                    SizedBox(height: 16.h),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Container(
                                  padding: EdgeInsets.all(16.h),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(12.r)
                                      )
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 130,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Вылет из',
                                                  style:TextStyle(color:  AppColors.grey, fontWeight: FontWeight.w400, fontSize: 15.sp),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 200,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  data.reservationData!.departure!,
                                                  style:TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 15.sp),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 16.h),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 130,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Страна, город',
                                                  style:TextStyle(color:  AppColors.grey, fontWeight: FontWeight.w400, fontSize: 15.sp),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 200,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  data.reservationData!.arrivalCountry!,
                                                  style:TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 15.sp),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 16.h),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 130,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Даты',
                                                  style:TextStyle(color:  AppColors.grey, fontWeight: FontWeight.w400, fontSize: 15.sp),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 200,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${data.reservationData!.tourDateStart} – ${data.reservationData!.tourDateStop}',
                                                  style:TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 15.sp),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 16.h),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 130,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Кол-во ночей',
                                                  style:TextStyle(color:  AppColors.grey, fontWeight: FontWeight.w400, fontSize: 15.sp),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 200,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${data.reservationData!.numberOfNights!.toString()} ночей',
                                                  style:TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 15.sp),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 16.h),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 130,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Отель',
                                                  style:TextStyle(color:  AppColors.grey, fontWeight: FontWeight.w400, fontSize: 15.sp),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 200,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  data.reservationData!.hotelName!,
                                                  style:TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 15.sp),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 16.h),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 130,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Номер',
                                                  style:TextStyle(color:  AppColors.grey, fontWeight: FontWeight.w400, fontSize: 15.sp),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 200,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  data.reservationData!.room!,
                                                  softWrap: true,
                                                  maxLines: 2,
                                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 15.sp,),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 16.h),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 130,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Питание',
                                                  style:TextStyle(color:  AppColors.grey, fontWeight: FontWeight.w400, fontSize: 15.sp),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 200,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  data.reservationData!.nutrition!,
                                                  style:TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 15.sp),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                              ),
                              SizedBox(height: 8.h),
                              Container(
                                  width: double.maxFinite,
                                  padding: EdgeInsets.all(16.h),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(12.r)
                                      )
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Информация о покупателе',
                                        style: TextStyle(fontFamily: 'SF-Pro-Display', fontSize: 22.sp, fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(height: 20.h),
                                      CustomTextField(hintText: 'Номер телефона', type: TextViewType.phone),
                                      SizedBox(height: 8.h),
                                      CustomTextField(hintText: 'Почта', type: TextViewType.email),
                                      SizedBox(height: 8.h),
                                      Text(
                                        'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
                                        style: TextStyle(fontFamily: 'SF-Pro-Display', fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColors.grey),
                                      ),
                                    ],
                                  )
                              ),
                              SizedBox(height: 8.h),
                              SizedBox(
                                width: double.maxFinite,
                                child: Column(
                                  children: _contatos,
                                ),
                              ),
                              Container(
                                  width: double.maxFinite,
                                  padding: EdgeInsets.all(12.h),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(12.r)
                                      )
                                  ),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Добавить туриста',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w500
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _count += 1;
                                            });
                                          },
                                          child: Container(
                                            width: 32.h,
                                            height: 32.h,
                                            decoration: BoxDecoration(
                                                color: AppColors.blue,
                                                borderRadius: BorderRadius.all(Radius.circular(6.r))
                                            ),
                                            child: const Icon(Icons.add, color: Colors.white,),
                                          ),
                                        )
                                      ]
                                  )
                              ),
                              SizedBox(height: 8.h),
                              Container(
                                  width: double.maxFinite,
                                  padding: EdgeInsets.all(16.h),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(12.r)
                                      )
                                  ),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Тур',
                                              style: TextStyle(
                                                  color: AppColors.grey,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400
                                              ),
                                            ),
                                            SizedBox(height: 16.h),
                                            Text(
                                              'Топливный сбор',
                                              style: TextStyle(
                                                  color: AppColors.grey,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400
                                              ),
                                            ),
                                            SizedBox(height: 16.h),
                                            Text(
                                              'Сервисный сбор',
                                              style: TextStyle(
                                                  color: AppColors.grey,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400
                                              ),
                                            ),
                                            SizedBox(height: 16.h),
                                            Text(
                                              'К оплате',
                                              style: TextStyle(
                                                  color: AppColors.grey,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              '${data.reservationData!.tourPrice!} ₽',
                                              textAlign: TextAlign.end,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400
                                              ),
                                            ),
                                            SizedBox(height: 16.h),
                                            Text(
                                              '${data.reservationData!.fuelCharge!} ₽',
                                              textAlign: TextAlign.end,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400
                                              ),
                                            ),
                                            SizedBox(height: 16.h),
                                            Text(
                                              '${data.reservationData!.serviceCharge!} ₽',
                                              textAlign: TextAlign.end,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400
                                              ),
                                            ),
                                            SizedBox(height: 16.h),
                                            Text(
                                              '${data.reservationData!.tourPrice! + data.reservationData!.fuelCharge! + data.reservationData!.serviceCharge!} ₽',
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                  color: AppColors.blue,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600
                                              ),
                                            ),
                                          ],
                                        )
                                      ]
                                  )
                              ),
                              SizedBox(height: 10.h),
                              Container(height: 1.h, color: AppColors.grey.withOpacity(0.15),),
                              GestureDetector(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    Get.toNamed(RouteHelper.getOrder());
                                  }
                                },
                                child: Container(
                                    width: double.maxFinite,
                                    color: Colors.white,
                                    child: Container(
                                      height: 48.h,
                                      margin: EdgeInsets.only(right: 16.w, left: 16.w, top: 12.h, bottom: 28.h),
                                      decoration: BoxDecoration(
                                          color:  containerColor,
                                          borderRadius: BorderRadius.all(Radius.circular(15.r))
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Оплатить ${data.reservationData!.tourPrice! + data.reservationData!.fuelCharge! + data.reservationData!.serviceCharge!} ₽',
                                          style: TextStyle(color:  Colors.white, fontWeight: FontWeight.w500, fontSize: 16.sp),
                                        ),
                                      ),
                                    )
                                ),
                              ),
                            ],
                          ))
                      ),
                    ],
                  ),
                  onChanged: () {
                    Future.delayed(const Duration(microseconds: 100), () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          containerColor = AppColors.blue;
                        });
                      } else {
                        setState(() {
                          containerColor = AppColors.grey;
                        });
                        SnackBar(
                          content: const Text('Заполните все данные!'),
                          action: SnackBarAction(
                            label: 'Ok',
                            onPressed: () {},
                          ),
                        );
                      }
                    });

                  },
                )
              : Container(
                  padding: EdgeInsets.only(top: 40.h),
                  height: 20.h,
                  width: 20.h,
                  child: const CircularProgressIndicator(
                    color: Colors.red
                  ),
                );
        })
      ),
    );
  }

  Widget buildListView(String title) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12.r)
              )
          ),
          child: ExpansionTile(
    //        maintainState: true,
            title: Text(
              title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500
              ),
            ),
            children: [
              CustomTextField(hintText: 'Имя'),
              SizedBox(height: 8.h),
              CustomTextField(hintText: 'Фамилия'),
              SizedBox(height: 8.h),
              CustomTextField(hintText: 'Дата рождения', type: TextViewType.date),
              SizedBox(height: 8.h),
              CustomTextField(hintText: 'Гражданство'),
              SizedBox(height: 8.h),
              CustomTextField(hintText: 'Номер загранпаспорта', type: TextViewType.number),
              SizedBox(height: 8.h),
              CustomTextField(hintText: 'Срок действия загранпаспорта', type: TextViewType.date),
              SizedBox(height: 12.h),
            ],
          ),
        ),
        Container(
          height: 8.h,
          color: Colors.transparent
        )
      ],
    );
  }
  }

