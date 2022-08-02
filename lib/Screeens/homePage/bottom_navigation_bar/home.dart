import 'package:fhooks1_lec6/utills/colors.dart';
import 'package:fhooks1_lec6/utills/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final CalendarWeekController _controller = CalendarWeekController();

  String dateFormat = DateFormat("yMMMd").format(DateTime.now());
  // String formatedDate = dateFormat.format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // designSize: const Size(390, 844),
      builder: (context, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _controller.jumpToDate(DateTime.now());
            setState(() {});
          },
          child: const Icon(Icons.today),
        ),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'App Name',
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins'),
          ),
        ),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "images/appBackground.jpg",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: 50.h,
              right: 0,
              left: 0,
              child: CalendarWeek(
                controller: _controller,
                backgroundColor: appBackgroundColor,
                height: 200.h,
                dateStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                ),
                showMonth: true,
                minDate: DateTime.now().add(
                  Duration(days: -365),
                ),
                maxDate: DateTime.now().add(
                  Duration(days: 365),
                ),
                onDatePressed: (DateTime datetime) {
                  // Do something
                  setState(() {});
                },
                onDateLongPressed: (DateTime datetime) {
                  // Do something
                },
                onWeekChanged: () {
                  // Do something
                },
                monthViewBuilder: (DateTime time) => Align(
                  alignment: FractionalOffset.center,
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 4.h),
                      child: Text(
                        DateFormat.yMMMM().format(time),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp),
                      )),
                ),
                decorations: [
                  DecorationItem(
                      decorationAlignment: FractionalOffset.bottomRight,
                      date: DateTime.now(),
                      decoration: const Icon(
                        Icons.today,
                        color: Colors.blueGrey,
                      )),
                  DecorationItem(
                    date: DateTime.utc(2022, 1, 24),
                    decoration: const TextWidget(day: 'Education Day'),
                  ),
                  DecorationItem(
                      date: DateTime.utc(2022, 2, 13),
                      decoration: const TextWidget(day: 'Radio Day')),
                  DecorationItem(
                      date: DateTime.utc(2022, 3, 8),
                      decoration: const TextWidget(day: "Woman's Day")),
                  DecorationItem(
                      date: DateTime.utc(2022, 4, 7),
                      decoration: const TextWidget(day: "Health Day")),
                  DecorationItem(
                      date: DateTime.utc(2022, 5, 21),
                      decoration: const TextWidget(day: 'Tea Day')),
                  DecorationItem(
                      date: DateTime.utc(2022, 6, 18),
                      decoration: const TextWidget(day: "Ftaher's Day")),
                  DecorationItem(
                      date: DateTime.utc(2022, 7, 24),
                      decoration: const TextWidget(day: "Parent's Day")),
                  DecorationItem(
                      date: DateTime.utc(2022, 8, 1),
                      decoration: const TextWidget(day: 'FriendShip Day')),
                  DecorationItem(
                      date: DateTime.utc(2022, 9, 27),
                      decoration: const TextWidget(day: "Tourism Day")),
                  DecorationItem(
                      date: DateTime.utc(2022, 10, 5),
                      decoration: const TextWidget(day: "Teacher's Day")),
                  DecorationItem(
                      date: DateTime.utc(2022, 11, 9),
                      decoration: const TextWidget(day: 'Iqbal Day')),
                  DecorationItem(
                      date: DateTime.utc(2022, 12, 25),
                      decoration: const TextWidget(day: "Quaed-i-Azam Day")),
                  DecorationItem(
                      date: DateTime.utc(2022, 5, 24),
                      decoration: const TextWidget(day: "Brother's Day")),
                ],
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.6),
              child: Container(
                  padding: EdgeInsets.only(
                    left: 15.w,
                  ),
                  // color: Colors.amber,
                  // alignment: Alignment.centerLeft,
                  height: 250.h,
                  width: double.infinity,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 50.r,
                        backgroundColor: Colors.blue[200],
                        backgroundImage: const AssetImage(
                          "images/home_clock.png",
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${DateTime.now().hour}:${DateTime.now().minute}",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 29, 2, 34),
                              fontSize: 40.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            dateFormat,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 29, 2, 34),
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
