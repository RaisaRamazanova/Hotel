import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import 'hotel_page_body.dart';

class HotelPage extends StatefulWidget {
  const HotelPage({super.key});

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: const Column(
        children: [
          Expanded(child: SingleChildScrollView(
              child: HotelPageBody())
          ),
        ],
      ),
    );
  }
}
