import 'package:flutter/material.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final CalendarWeekController _controller = CalendarWeekController();

  String dateFormat = DateFormat("yMMMd").format(DateTime.now());
  String day = DateFormat("EEEE").format(
    DateTime.now(),
  );
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
            // Container(
            //   height: double.infinity,
            //   decoration: const BoxDecoration(
            //     image: DecorationImage(
            //       image: NetworkImage(
            //         "https://wallup.net/wp-content/uploads/2018/09/26/5097-milky-way.jpg",
            //       ),
            //       fit: BoxFit.fill,
            //     ),
            //   ),
            // ),
            Opacity(
              opacity: .70,
              child: Container(
                height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        // "https://wallup.net/wp-content/uploads/2018/09/26/5097-milky-way.jpg",
                        "images/home_background.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 100.h,
              right: 140.w,
              left: 0.w,
              child: CircleAvatar(
                radius: 70.r,
                backgroundColor: Colors.blue.withOpacity(.50),
                // backgroundImage: const AssetImage(
                //   "images/home_clock.png",
                // ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 400.h,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 90.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      // "${DateTime.now().hour}:${DateTime.now().minute}",
                      day,
                      style: GoogleFonts.mouseMemoirs(
                        textStyle: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                    Text(
                      dateFormat,
                      style: TextStyle(
                        color: Colors.white.withOpacity(
                          .60,
                        ),
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.6),
              child: CalendarWeek(
                todayBackgroundColor: Colors.blue.withOpacity(.60),
                controller: _controller,
                backgroundColor: Colors.transparent,
                height: 200.h,
                dateStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                dayOfWeekStyle: TextStyle(
                  color: Colors.white.withOpacity(.90),
                ),
                todayDateStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
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
                      style: GoogleFonts.robotoMono(
                        textStyle: TextStyle(
                          fontSize: 25.sp,
                          color: Colors.white.withOpacity(
                            .80,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decorations: [
                  DecorationItem(
                      decorationAlignment: FractionalOffset.bottomRight,
                      date: DateTime.now(),
                      decoration: const Icon(
                        Icons.today,
                        // color: Colors.blueGrey,
                      )),
                  DecorationItem(
                    date: DateTime.utc(2022, 1, 24),
                    decoration: const Text('Education Day'),
                  ),
                  DecorationItem(
                      date: DateTime.utc(2022, 2, 13),
                      decoration: const Text('Radio Day')),
                  DecorationItem(
                      date: DateTime.utc(2022, 3, 8),
                      decoration: const Text("Woman's Day")),
                  DecorationItem(
                      date: DateTime.utc(2022, 4, 7),
                      decoration: const Text("Health Day")),
                  DecorationItem(
                      date: DateTime.utc(2022, 5, 21),
                      decoration: const Text('Tea Day')),
                  DecorationItem(
                      date: DateTime.utc(2022, 6, 18),
                      decoration: const Text("Ftaher's Day")),
                  DecorationItem(
                      date: DateTime.utc(2022, 7, 24),
                      decoration: const Text("Parent's Day")),
                  DecorationItem(
                      date: DateTime.utc(2022, 8, 1),
                      decoration: const Text('FriendShip Day')),
                  DecorationItem(
                      date: DateTime.utc(2022, 9, 27),
                      decoration: const Text("Tourism Day")),
                  DecorationItem(
                      date: DateTime.utc(2022, 10, 5),
                      decoration: const Text("Teacher's Day")),
                  DecorationItem(
                      date: DateTime.utc(2022, 11, 9),
                      decoration: const Text('Iqbal Day')),
                  DecorationItem(
                      date: DateTime.utc(2022, 12, 25),
                      decoration: const Text("Quaed-i-Azam Day")),
                  DecorationItem(
                      date: DateTime.utc(2022, 5, 24),
                      decoration: const Text("Brother's Day")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
