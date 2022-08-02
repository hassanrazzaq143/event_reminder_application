import 'package:fhooks1_lec6/models/global_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DaysDescription extends StatelessWidget {
  const DaysDescription(
      {Key? key, required this.userModel, required this.index})
      : super(key: key);
  final List<Globaldays> userModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    Globaldays user = userModel[index];
    return ScreenUtilInit(
      designSize: const Size(399, 844),
      builder: (context, child) => SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * .5,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(user.imageUrl),
                              fit: BoxFit.cover)),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back_ios_new)),
                    Positioned(
                      top: 100.h,
                      left: 20.w,
                      width: 250.w,
                      child: Text(
                        user.name,
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 200.h,
                      left: 20.w,
                      width: 200.w,
                      child: Container(
                        height: 2.0.h,
                        color: Colors.green[800],
                      ),
                    ),
                    Positioned(
                      top: 210.h,
                      left: 20.w,
                      width: 200.w,
                      child: Text(user.occupation),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.w,
                    vertical: 30.h,
                  ),
                  // height: MediaQuery.of(context).size.height * .3,
                  child: Text(
                    user.description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: const Color.fromARGB(213, 231, 231, 231),
                      fontFamily: 'Poppins',
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
