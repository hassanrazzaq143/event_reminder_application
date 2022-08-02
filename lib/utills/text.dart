import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key, required this.day}) : super(key: key);
  final String day;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) {
      return Text(
        day,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 20.sp,
        ),
      );
    });
  }
}
