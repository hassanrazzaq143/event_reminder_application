import 'package:fhooks1_lec6/Screeens/resources/firebase_storage.dart';
import 'package:fhooks1_lec6/Screeens/homePage/home_page.dart';
import 'package:fhooks1_lec6/Screeens/resources/notification_api.dart';
import 'package:fhooks1_lec6/utills/utills.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({Key? key}) : super(key: key);

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  TextEditingController titleController = TextEditingController();
  List<String> category = ['Birthday', 'Annivarsary', 'Marriage'];
  String? selectedvalue;
  DateTime date = DateTime.now();
  DateTime? time = DateTime.now();
  final formkey = GlobalKey<FormState>();
  final _formkey = GlobalKey<FormState>();
  bool isLoading = false;
  bool clear = false;
  void clearScreen() {
    setState(() {
      clear = true;
    });
  }

  void eventPost(
    String uid,
    String eventTitle,
    String category,
    String iconUrl,
    bool isSelected,
    DateTime date,
    DateTime time,
  ) async {
    setState(() {
      isLoading = true;
    });
    try {
      String res = await FireStorage().uploadPost(
        uid,
        eventTitle,
        category,
        iconUrl,
        isSelected,
        date,
        time,
      );

      if (res == "success") {
        showSnackBar("Posted!", context);
      }
    } catch (err) {
      showSnackBar(err.toString(), context);
    }
    setState(() {
      isLoading = false;
    });
  }

  bool isSelected = false;
  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(166, 37, 122, 115),
      ),
      home: ScreenUtilInit(
        designSize: const Size(399, 844),
        minTextAdapt: false,
        // useInheritedMediaQuery: true,
        splitScreenMode: false,
        builder: (context, child) => SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * .25,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: NetworkImage(
                            "https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/k-p-s25-nat-361-lyj3712-1-events.jpg?w=800&dpr=1&fit=default&crop=default&auto=format&fm=pjpg&q=75&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=b5e8ba9e6a7933408784cb9f895d47f1",
                          ),
                          fit: BoxFit.cover,
                        )),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {
                            showDialog(
                              // barrierColor: Colors.amber,
                              barrierDismissible: false,
                              context: context,
                              builder: (context) => CupertinoAlertDialog(
                                title: const Text("Warning!"),
                                content: const Text('Are you sure to cancel?'),
                                actions: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("No"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomePage(),
                                            ),
                                          );
                                        },
                                        child: const Text("Yes"),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                          icon: const Icon(Icons.close),
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: 20.h,
                  // ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 18.0.w,
                      right: 18.0.w,
                      bottom: 200.h,
                    ),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * .75,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'App Name',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Form(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            key: formkey,
                            child: Neumorphic(
                              style: NeumorphicStyle(
                                color: Colors.cyan[200],
                                depth: -20,
                                boxShape: const NeumorphicBoxShape.stadium(),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 14.h,
                                horizontal: 18.w,
                              ),
                              child: TextFormField(
                                style: TextStyle(
                                    color: Colors.blueGrey.shade800,
                                    fontSize: 18.sp),
                                cursorColor: Colors.blueGrey,
                                controller: titleController,
                                decoration: InputDecoration.collapsed(
                                  // isDense: true,
                                  // contentPadding:
                                  hintText: 'Enter the event title',
                                  hintStyle: TextStyle(
                                    fontSize: 18.sp,
                                    fontFamily: 'Poppins',
                                    color: Colors.blueGrey,
                                  ),
                                  // border: OutlineInputBorder(
                                  //     borderRadius: BorderRadius.circular(15.r),
                                  //     borderSide: BorderSide.none),
                                  // fillColor: Colors.cyan[200],
                                  // filled: true,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    // Future.delayed(Duration.zero, () {
                                    //   showCupertinoDialog(
                                    //       barrierDismissible: true,
                                    //       context: context,
                                    //       builder: (context) {
                                    //         return const CupertinoAlertDialog(
                                    //           title: Text('Warning!'),
                                    //           content: Text(
                                    //               "You should enter the event title"),
                                    //         );
                                    //       });
                                    // });

                                    return "Enter the title!";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              buttonColor: Colors.cyan[200],
                              alignedDropdown: true,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.cyan[200],
                                    borderRadius: BorderRadius.circular(15.r)),
                                child: Form(
                                  key: _formkey,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  child: DropdownButtonFormField(
                                    dropdownColor:
                                        const Color.fromARGB(166, 37, 122, 115),
                                    iconDisabledColor: Colors.blueGrey,
                                    iconEnabledColor: Colors.blueGrey,
                                    // focusColor: Colors.amber,
                                    isExpanded: true,
                                    // menuMaxHeight: 100,
                                    hint: Text(
                                      'Select the Category',
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontFamily: 'Poppins',
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                    iconSize: 30.sp,
                                    value: selectedvalue,
                                    items: category.map((value) {
                                      return DropdownMenuItem(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedvalue = newValue;
                                      });
                                    },
                                    validator: (value) {
                                      if (selectedvalue == null) {
                                        return "Select the category";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Choose the date',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15.sp,
                                ),
                              ),
                              TextButton(
                                onPressed: () => showCupertinoModalPopup(
                                    context: context,
                                    builder: (context) {
                                      return SizedBox(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .25,
                                        child: CupertinoDatePicker(
                                          initialDateTime: date,
                                          backgroundColor:
                                              Colors.purple.shade800,
                                          mode: CupertinoDatePickerMode.date,
                                          onDateTimeChanged: (val) {
                                            setState(() {
                                              date = val;
                                            });
                                          },
                                        ),
                                      );
                                    }),
                                child: Text(
                                  "${date.day}/${date.month}/${date.year}",
                                  // : "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                                  // : "Date",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Select the time',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15.sp,
                                ),
                              ),
                              TextButton(
                                onPressed: () => showCupertinoModalPopup(
                                    context: context,
                                    builder: (context) {
                                      return SizedBox(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .25,
                                        child: CupertinoDatePicker(
                                          initialDateTime: time,
                                          backgroundColor:
                                              Colors.purple.shade800,
                                          mode: CupertinoDatePickerMode.time,
                                          onDateTimeChanged: (val) {
                                            setState(() {
                                              time = val;
                                            });
                                          },
                                        ),
                                      );
                                    }),
                                child: Text(
                                  time != null
                                      ? "${time!.hour} : ${time!.minute}"
                                      // : "${DateTime.now().hour}:${DateTime.now().minute}",
                                      : "Time",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Alert Notifications",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                              Switch(
                                value: isSelected,
                                onChanged: (value) {
                                  setState(() {
                                    isSelected = value;
                                    if (isSelected) {
                                      NotificatonApi.showScheduleNotification(
                                          scheduleDate: time!);
                                    }
                                  });
                                },
                                // value: developers[index].isSelected,
                                // onChanged: (value) {
                                //   setPState(() {
                                //     developers[index].isSelected = value;
                                //     getStorage.write(
                                //       "isOn$index",
                                //       developers[index].isSelected,
                                //     );
                                //     // readingData(index);
                                //   });
                                // },
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 128.0.h),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                // minimumSize: Size(100.w, 50.h),
                                // maximumSize: Size(100.w, 50.h),
                                fixedSize: Size(100.w, 50.h),
                              ),
                              // style: ButtonStyle(
                              //   shape: MaterialStateProperty.all<
                              //       RoundedRectangleBorder>(
                              //     RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.circular(20.r),
                              //     ),
                              //   ),
                              //   minimumSize: MaterialStateProperty.all<Size>(
                              //       Size(50.w, 70.h)),
                              // ),
                              onPressed: () {
                                final isValid =
                                    formkey.currentState!.validate();
                                final valid = _formkey.currentState!.validate();
                                if (isValid && valid) {
                                  if (selectedvalue == "Birthday") {
                                    eventPost(
                                      FirebaseAuth.instance.currentUser!.uid,
                                      titleController.text,
                                      selectedvalue!,
                                      "https://webstockreview.net/images/clipart-birthday-october-9.png",
                                      isSelected,
                                      date,
                                      time!,
                                    );
                                  } else if (selectedvalue == "Annivarsary") {
                                    eventPost(
                                      FirebaseAuth.instance.currentUser!.uid,
                                      titleController.text,
                                      selectedvalue!,
                                      "https://www.jing.fm/clipimg/full/23-237170_wedding-anniversary-wish-hindi-whatsapp-marriage-anniversary-cartoon.png",
                                      isSelected,
                                      date,
                                      time!,
                                    );
                                  } else if (selectedvalue == "Marriage") {
                                    eventPost(
                                      FirebaseAuth.instance.currentUser!.uid,
                                      titleController.text,
                                      selectedvalue!,
                                      "https://zakazposterov.ru/fotooboi/z/fotooboi-e-74802-rastrovaya-svadebnaya-otkritka-s-muljtyashnimi-jenihom-i-neves-zakazposterov-ru_z.jpg",
                                      isSelected,
                                      date,
                                      time!,
                                    );
                                  }
                                }

                                titleController.text = "";
                              },
                              child: Ink(
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 4, 221, 250),
                                      Color.fromARGB(255, 44, 97, 139)
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: (isLoading)
                                      ? const CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : Text(
                                          'Done',
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              fontFamily: 'Poppins'),
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    //     body: Center(
    //   child: FloatingActionButton(
    //       child: const Icon(Icons.add),
    //       onPressed: () {
    //         showModalBottomSheet<void>(
    //             shape: const RoundedRectangleBorder(
    //                 borderRadius:
    //                     BorderRadius.vertical(top: Radius.circular(20))),
    //             context: context,
    //             builder: (BuildContext context) {
    //               return StatefulBuilder(builder: (context, setState) {
    //                 return SizedBox(
    //                   width: MediaQuery.of(context).size.width,
    //                   height: MediaQuery.of(context).size.height * .75,
    //                   // color: Colors.amber,
    //                   child: Container(
    //                       decoration: const BoxDecoration(
    //                           // color: Theme.of(context).primaryColor,
    //                           color: Color.fromARGB(166, 37, 122, 115),
    //                           borderRadius: BorderRadius.only(
    //                               topLeft: Radius.circular(20.0),
    //                               topRight: Radius.circular(20.0))),
    //                       child: Padding(
    //                         padding: const EdgeInsets.symmetric(
    //                             horizontal: 18.0, vertical: 10),
    //                         child:
    //                       )),
    //                 );
    //               });
    //             });
    //       }),
    // ));
  }
}

// showDatePicker() {
//   showCupertinoModalPopup(
//       context: context,
//       builder: (context) {
//         return SizedBox(
//           width: double.infinity,
//           height: MediaQuery.of(context).size.height * .25,
//           child: CupertinoDatePicker(
//             backgroundColor: Colors.purple.shade800,
//             mode: CupertinoDatePickerMode.date,
//             onDateTimeChanged: (val) {
//               setState(() {
//                 dateTime = val.toIso8601String();
//               });
//             },
//           ),
//         );
//       });
// }
