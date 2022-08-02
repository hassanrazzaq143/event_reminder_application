import 'package:fhooks1_lec6/models/festival_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FestivalDescription extends StatefulWidget {
  const FestivalDescription(
      {Key? key, required this.festivalModel, required this.index})
      : super(key: key);
  final List<FestivalModel> festivalModel;
  final int index;

  @override
  State<FestivalDescription> createState() => _FestivalDescriptionState();
}

class _FestivalDescriptionState extends State<FestivalDescription> {
  @override
  void initState() {
    super.initState();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  @override
  Widget build(BuildContext context) {
    final fest = widget.festivalModel[widget.index];
    return ScreenUtilInit(
      designSize: const Size(399, 844),
      builder: (context, child) => SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * .5,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(fest.imageUrl),
                              fit: BoxFit.fill)),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back_ios_new)),
                    Positioned(
                      top: 100.h,
                      left: 20.w,
                      // width: 250.w,
                      child: Text(
                        fest.festivalName,
                        style: TextStyle(
                          fontSize: 40.sp,
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
                      child: Text(
                        fest.date,
                        style: TextStyle(
                          fontSize: 20.sp,
                        ),
                      ),
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
                    fest.description,
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
