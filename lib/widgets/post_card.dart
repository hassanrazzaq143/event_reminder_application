import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fhooks1_lec6/Screeens/resources/notification_api.dart';
import 'package:fhooks1_lec6/utills/colors.dart';
import 'package:fhooks1_lec6/utills/utills.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostCard extends StatefulWidget {
  const PostCard({Key? key, required this.snap, required this.model})
      : super(key: key);
  final snap;
  final model;
  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  // final String date;
  // GetStorage getStorage = GetStorage();
  TextEditingController titleController = TextEditingController();
  List<String> category = ['Birthday', 'Annivarsary', 'Marriage'];
  late String selectedvalue = widget.snap["category"];
  late DateTime date = DateTime.fromMicrosecondsSinceEpoch(
      widget.snap["date"].microsecondsSinceEpoch);
  late DateTime time = DateTime.fromMicrosecondsSinceEpoch(
      widget.snap["time"].microsecondsSinceEpoch);
  // late String birthdayIcon=widget.snap["iconUrl"];
  String? catgory;
  DateTime? date2;
  DateTime? time2;
  final formkey = GlobalKey<FormState>();
  final _formkey = GlobalKey<FormState>();
  bool isLoading = false;
  bool? isSelected;
  late bool isAlert = widget.snap["isSelected"];

  Future<void> updateEvent() async {
    if (widget.snap != null) {
      titleController.text = widget.snap["title"];
      catgory = widget.snap["category"];
      time2 = DateTime.fromMicrosecondsSinceEpoch(
          widget.snap["time"].microsecondsSinceEpoch);
      // time2 = DateTime.parse(
      //   DateFormat.Hm().format(
      //     widget.snapShot["time"].toDate(),
      //   ),
      // );
      // date2 = DateTime.parse(
      //   DateFormat.yMMMd().format(
      //     widget.snapShot["time"].toDate(),
      //   ),
      // );
      date2 = DateTime.fromMicrosecondsSinceEpoch(
          widget.snap["date"].microsecondsSinceEpoch);
      isAlert = widget.snap["isSelected"];
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return StatefulBuilder(builder: (context, setState) {
              return SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * .35,
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
                                Navigator.of(context).pop();
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
                          bottom: 100.h,
                        ),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * .65,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              // SizedBox(
                              //   height: 20.h,
                              // ),
                              Form(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                child: Neumorphic(
                                  style: NeumorphicStyle(
                                    color: Colors.cyan[200],
                                    depth: -20,
                                    boxShape:
                                        const NeumorphicBoxShape.stadium(),
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
                              // SizedBox(
                              //   height: 10.h,
                              // ),
                              DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  buttonColor: Colors.cyan[200],
                                  alignedDropdown: true,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.cyan[200],
                                        borderRadius:
                                            BorderRadius.circular(15.r)),
                                    child: Form(
                                      key: _formkey,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      child: DropdownButtonFormField(
                                        dropdownColor: const Color.fromARGB(
                                            166, 37, 122, 115),
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
                                        value: catgory,
                                        items: category.map((value) {
                                          return DropdownMenuItem(
                                              value: value,
                                              child: Text(
                                                value,
                                              ));
                                        }).toList(),
                                        onChanged: (newValue) {
                                          setState(() {
                                            selectedvalue = newValue.toString();
                                          });
                                        },
                                        validator: (value) {
                                          if (selectedvalue == null) {
                                            return "Select the category";
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // // SizedBox(
                              // //   height: 10.h,
                              // // ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .25,
                                            child: CupertinoDatePicker(
                                              initialDateTime: date,
                                              backgroundColor:
                                                  Colors.purple.shade800,
                                              mode:
                                                  CupertinoDatePickerMode.date,
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
                                      // : "date",
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // // SizedBox(
                              // //   height: 10.h,
                              // // ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .25,
                                            child: CupertinoDatePicker(
                                              initialDateTime: time,
                                              backgroundColor:
                                                  Colors.purple.shade800,
                                              mode:
                                                  CupertinoDatePickerMode.time,
                                              onDateTimeChanged: (val) {
                                                setState(() {
                                                  time = val;
                                                });
                                              },
                                            ),
                                          );
                                        }),
                                    child: Text(
                                      "${time.hour} : ${time.minute}",
                                      // : "${DateTime.now().hour}:${DateTime.now().minute}",
                                      // : "${time2!.hour} : ${time2!.minute}",
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // // SizedBox(
                              // //   height: 20.h,
                              // // ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    value: isAlert,
                                    onChanged: (value) {
                                      setState(() {
                                        isAlert = value;
                                        if (isAlert) {
                                          NotificatonApi
                                              .showScheduleNotification(
                                            id: 0,
                                            title: titleController.text,
                                            body: selectedvalue,
                                            scheduleDate: time,
                                            payLoad: "dinner_6pm",
                                          );
                                          // showSnackBar("Done", context);
                                        }
                                        // if (isAlert) {
                                        //   showSnackBar("Done", context);
                                        // }
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
                                padding: EdgeInsets.only(bottom: 0.h),
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
                                  onPressed: () async {
                                    String? name = titleController.text;
                                    String? cat = selectedvalue;
                                    DateTime? time3 = time;
                                    DateTime? date3 = date;
                                    bool? isOn = isAlert;
                                    setState(() {
                                      isLoading = true;
                                    });
                                    if (selectedvalue == "Birthday") {
                                      await FirebaseFirestore.instance
                                          .collection("users")
                                          .doc(widget.snap["uid"])
                                          .collection("Posts")
                                          .doc(widget.snap["postId"])
                                          .update(
                                        {
                                          "title": name,
                                          "category": cat,
                                          "time": time3,
                                          "date": date3,
                                          "isSelected": isOn,
                                          "iconUrl":
                                              "https://webstockreview.net/images/clipart-birthday-october-9.png",
                                        },
                                      );
                                    }
                                    if (selectedvalue == "Annivarsary") {
                                      await FirebaseFirestore.instance
                                          .collection("users")
                                          .doc(widget.snap["uid"])
                                          .collection("Posts")
                                          .doc(widget.snap["postId"])
                                          .update(
                                        {
                                          "title": name,
                                          "category": cat,
                                          "time": time3,
                                          "date": date3,
                                          "isSelected": isOn,
                                          "iconUrl":
                                              "https://www.jing.fm/clipimg/full/23-237170_wedding-anniversary-wish-hindi-whatsapp-marriage-anniversary-cartoon.png",
                                        },
                                      );
                                    }
                                    if (selectedvalue == "Marriage") {
                                      await FirebaseFirestore.instance
                                          .collection("users")
                                          .doc(widget.snap["uid"])
                                          .collection("Posts")
                                          .doc(widget.snap["postId"])
                                          .update(
                                        {
                                          "title": name,
                                          "category": cat,
                                          "time": time3,
                                          "date": date3,
                                          "isSelected": isOn,
                                          "iconUrl":
                                              "https://zakazposterov.ru/fotooboi/z/fotooboi-e-74802-rastrovaya-svadebnaya-otkritka-s-muljtyashnimi-jenihom-i-neves-zakazposterov-ru_z.jpg",
                                        },
                                      );
                                    }

                                    setState(() {
                                      isLoading = false;
                                    });
                                    Navigator.pop(context);
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
                                      child: isLoading
                                          ? const CircularProgressIndicator(
                                              color: Colors.white,
                                            )
                                          : Text(
                                              'Update',
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
              );
            });
          });
    }
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Card(
          // color: const Color.fromARGB(57, 155, 39, 176),
          color: Colors.cyan.shade800,
          child: ListTile(
            title: Text(
              widget.snap["title"],
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
                fontFamily: 'Poppins-Light',
              ),
            ),
            subtitle: Text(
              // DateFormat.Hm().format(
              //   widget.snap["time"].toDate(),

              widget.snap["category"],
              style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 15.sp,
                fontFamily: 'Poppins-Light',
              ),
            ),
            leading: CircleAvatar(
              // radius: 30.r,
              backgroundColor: Colors.blue[200],
              backgroundImage: NetworkImage(
                widget.snap["iconUrl"],
              ),
            ),
            trailing: Image.asset(
              "icons/tap-icon.png",
              height: 30.h,
              width: 30.w,
              color: Colors.white,
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return StatefulBuilder(
                    builder: (BuildContext context, setPState) => AlertDialog(
                      backgroundColor: Colors.cyan.shade800,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Edit Event",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => EditEvent(
                                  //       snapShot: widget.snap,
                                  //     ),
                                  //   ),
                                  // );
                                  updateEvent();
                                },
                                icon: const Icon(
                                  Icons.edit,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Delete Event",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  await FirebaseFirestore.instance
                                      .collection("users")
                                      .doc(widget.snap["uid"])
                                      .collection("Posts")
                                      .doc(widget.snap["postId"])
                                      .delete();
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.delete_forever,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
