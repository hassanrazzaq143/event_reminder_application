// ignore_for_file: deprecated_member_use

import 'package:fhooks1_lec6/Screeens/resources/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AtStart extends StatefulWidget {
  const AtStart({Key? key}) : super(key: key);

  @override
  State<AtStart> createState() => _AtStartState();
}

class _AtStartState extends State<AtStart> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .60,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/event1.jpg"),
                        fit: BoxFit.fill)
                    // color: Colors.amber,
                    ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0.w),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        "No need to remind Birthday",
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontFamily: "Poppins-Medium",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      // SizedBox(
                      //   height: 10.h,
                      // ),
                      Text(
                        "It may be your birthday, but you are a gift. You're not special because it's your birthday – you're special because you're you.We will take care of your birthday, and we will remind you. ",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: "Poppins-Light",
                          fontWeight: FontWeight.w200,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      // SizedBox(
                      //   height: 10.h,
                      // ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 38.0.h,
                        ),
                        child: RaisedButton(
                          onPressed: () async {
                            if (mounted) {
                              setState(() {
                                isLoading = true;
                              });
                            }

                            await Anonymous().signIn();
                            if (mounted) {
                              setState(() {
                                isLoading = false;
                              });
                            }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          padding: const EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Colors.blue,
                                Colors.cyan,
                                Colors.blueGrey,
                                Colors.grey,
                              ]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(80.0)),
                            ),
                            child: Container(
                              constraints: const BoxConstraints(
                                  minWidth: 88.0,
                                  minHeight:
                                      36.0), // min sizes for Material buttons
                              alignment: Alignment.center,
                              child: (isLoading)
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : const Text(
                                      'Get Started',
                                      textAlign: TextAlign.center,
                                    ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
