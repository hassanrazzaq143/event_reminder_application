// import 'package:fhooks1_lec6/Screeens/homePage/add_event.dart';
// import 'package:fhooks1_lec6/Screeens/homePage/home.dart';
// import 'package:fhooks1_lec6/Screeens/homePage/internationalDays/international_days.dart';
// import 'package:fhooks1_lec6/utills/utills.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:flutter/cupertino.dart';

// import 'Screeens/resources/firebase_storage.dart';

// class Prects extends StatefulWidget {
//   const Prects({Key? key}) : super(key: key);

//   @override
//   _PrectsState createState() => _PrectsState();
// }

// class _PrectsState extends State<Prects> {
//   PageController pageController = PageController();
//   TextEditingController titleController = TextEditingController();
//   // AddEvent addEvent = const AddEvent();
//   List<String> category = ['Bithday', 'Annivarsary', 'marriage'];
//   String? selectedvalue;
//   DateTime? date;
//   DateTime? time;

//   @override
//   void dispose() {
//     super.dispose();
//     pageController.dispose();
//     titleController.dispose();
//   }

//   int _selectedIndex = 0;
//   static TextStyle optionStyle =
//       TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600);
//   final List<Widget> pages = [
//     const Home(),
//     const Center(
//       child: Text('Hassa'),
//     ),
//     const InternationalDays(),
//     const Center(
//       child: Text('Ha'),
//     ),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//         designSize: const Size(390, 844),
//         builder: (context, child) {
//           return Scaffold(
//             // backgroundColor: Colors.white,
//             appBar: AppBar(
//               elevation: 0,
//               title: const Text('GoogleNavBar'),
//             ),
//             body: pages[_selectedIndex],
//             floatingActionButton: Align(
//               alignment: Alignment.bottomCenter,
//               child: FloatingActionButton(
//                 child: const Icon(Icons.add),
//                 onPressed: () {
//                   showModalBottomSheet<void>(
//                       shape: const RoundedRectangleBorder(
//                           borderRadius:
//                               BorderRadius.vertical(top: Radius.circular(20))),
//                       context: context,
//                       builder: (BuildContext context) {
//                         return StatefulBuilder(builder: (context, setState) {
//                           return SizedBox(
//                             width: MediaQuery.of(context).size.width,
//                             height: MediaQuery.of(context).size.height * .75,
//                             // color: Colors.amber,
//                             child: Container(
//                                 decoration: const BoxDecoration(
//                                     // color: Theme.of(context).primaryColor,
//                                     color: Color.fromARGB(166, 37, 122, 115),
//                                     borderRadius: BorderRadius.only(
//                                         topLeft: Radius.circular(20.0),
//                                         topRight: Radius.circular(20.0))),
//                                 child: Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 18.0, vertical: 20),
//                                   child: Column(
//                                     children: [
//                                       const Text(
//                                         'App Name',
//                                         style: TextStyle(
//                                             fontFamily: 'Poppins',
//                                             fontStyle: FontStyle.italic),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       TextField(
//                                         style: TextStyle(
//                                             color: Colors.blueGrey.shade800),
//                                         cursorColor: Colors.blueGrey,
//                                         controller: titleController,
//                                         decoration: InputDecoration(
//                                           isDense: true,
//                                           contentPadding:
//                                               const EdgeInsets.symmetric(
//                                                   vertical: 16, horizontal: 10),
//                                           hintText: 'Enter the event title',
//                                           hintStyle: const TextStyle(
//                                             fontFamily: 'Poppins',
//                                             color: Colors.blueGrey,
//                                           ),
//                                           border: OutlineInputBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(15),
//                                               borderSide: BorderSide.none),
//                                           fillColor: Colors.cyan[200],
//                                           filled: true,
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       DropdownButtonHideUnderline(
//                                         child: ButtonTheme(
//                                           alignedDropdown: true,
//                                           child: Container(
//                                             decoration: BoxDecoration(
//                                                 color: Colors.cyan[200],
//                                                 borderRadius:
//                                                     BorderRadius.circular(15)),
//                                             child: DropdownButton(
//                                                 dropdownColor:
//                                                     const Color.fromARGB(
//                                                         166, 37, 122, 115),
//                                                 iconDisabledColor:
//                                                     Colors.blueGrey,
//                                                 iconEnabledColor:
//                                                     Colors.blueGrey,
//                                                 // focusColor: Colors.amber,
//                                                 isExpanded: true,
//                                                 // menuMaxHeight: 100,
//                                                 hint: const Text(
//                                                   'Select the Category',
//                                                   style: TextStyle(
//                                                     fontSize: 15,
//                                                     fontFamily: 'Poppins',
//                                                     color: Colors.blueGrey,
//                                                   ),
//                                                 ),
//                                                 value: selectedvalue,
//                                                 items: category.map((value) {
//                                                   return DropdownMenuItem(
//                                                       value: value,
//                                                       child: Text(value));
//                                                 }).toList(),
//                                                 onChanged: (newValue) {
//                                                   setState(() {
//                                                     selectedvalue =
//                                                         newValue.toString();
//                                                   });
//                                                 }),
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           const Text(
//                                             'Choose the date',
//                                             style: TextStyle(
//                                               fontFamily: 'Poppins',
//                                               fontSize: 15,
//                                             ),
//                                           ),
//                                           TextButton(
//                                             onPressed: () =>
//                                                 showCupertinoModalPopup(
//                                                     context: context,
//                                                     builder: (context) {
//                                                       return SizedBox(
//                                                         width: double.infinity,
//                                                         height: MediaQuery.of(
//                                                                     context)
//                                                                 .size
//                                                                 .height *
//                                                             .25,
//                                                         child:
//                                                             CupertinoDatePicker(
//                                                           initialDateTime: date,
//                                                           backgroundColor:
//                                                               Colors.purple
//                                                                   .shade800,
//                                                           mode:
//                                                               CupertinoDatePickerMode
//                                                                   .date,
//                                                           onDateTimeChanged:
//                                                               (val) {
//                                                             setState(() {
//                                                               date = val;
//                                                             });
//                                                           },
//                                                         ),
//                                                       );
//                                                     }),
//                                             child: Text(
//                                               date != null
//                                                   ? "${date!.day}/${date!.month}/${date!.year}"
//                                                   : "Date",
//                                               style: const TextStyle(
//                                                 fontSize: 15,
//                                                 fontFamily: 'Poppins',
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           const Text(
//                                             'Select the time',
//                                             style: TextStyle(
//                                               fontFamily: 'Poppins',
//                                               fontSize: 15,
//                                             ),
//                                           ),
//                                           TextButton(
//                                             onPressed: () =>
//                                                 showCupertinoModalPopup(
//                                                     context: context,
//                                                     builder: (context) {
//                                                       return SizedBox(
//                                                         width: double.infinity,
//                                                         height: MediaQuery.of(
//                                                                     context)
//                                                                 .size
//                                                                 .height *
//                                                             .25,
//                                                         child:
//                                                             CupertinoDatePicker(
//                                                           initialDateTime: time,
//                                                           backgroundColor:
//                                                               Colors.purple
//                                                                   .shade800,
//                                                           mode:
//                                                               CupertinoDatePickerMode
//                                                                   .time,
//                                                           onDateTimeChanged:
//                                                               (val) {
//                                                             setState(() {
//                                                               time = val;
//                                                             });
//                                                           },
//                                                         ),
//                                                       );
//                                                     }),
//                                             child: Text(
//                                               time != null
//                                                   ? "${time!.hour} : ${time!.minute}"
//                                                   : "Time",
//                                               style: const TextStyle(
//                                                 fontSize: 15,
//                                                 fontFamily: 'Poppins',
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       ElevatedButton(
//                                         style: ElevatedButton.styleFrom(
//                                           padding: EdgeInsets.zero,
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(20),
//                                           ),
//                                         ),
//                                         onPressed: () {
//                                           // eventPost(
//                                           //   FirebaseAuth
//                                           //       .instance.currentUser!.uid,
//                                           //   titleController.text,
//                                           //   date!,
//                                           //   time!,
//                                           // );
//                                         },
//                                         child: Ink(
//                                           decoration: BoxDecoration(
//                                             gradient: const LinearGradient(
//                                               colors: [
//                                                 Color.fromARGB(
//                                                     255, 4, 221, 250),
//                                                 Color.fromARGB(255, 44, 97, 139)
//                                               ],
//                                             ),
//                                             borderRadius:
//                                                 BorderRadius.circular(20),
//                                           ),
//                                           child: Container(
//                                             width: 100,
//                                             height: 50,
//                                             child: const Align(
//                                               alignment: Alignment.center,
//                                               child: Text(
//                                                 'Done',
//                                                 style: TextStyle(
//                                                     fontSize: 15,
//                                                     fontFamily: 'Poppins'),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 )),
//                           );
//                         });
//                       });
//                 },
//               ),
//             ),
//             bottomNavigationBar: Stack(
//               alignment: const FractionalOffset(.5, 2.0),
//               children: [
//                 Container(
//                   height: 70,
//                   decoration: BoxDecoration(
//                     // color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                         blurRadius: 20.r,
//                         color: Colors.black.withOpacity(.1),
//                       )
//                     ],
//                   ),
//                   child: SafeArea(
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: 15.0.w, vertical: 8.h),
//                       child: GNav(
//                         rippleColor: Colors.yellow,
//                         hoverColor: Color.fromARGB(255, 157, 228, 238),
//                         gap: 8.w,
//                         activeColor: Colors.white,
//                         backgroundColor: Color.fromARGB(166, 103, 219, 210),
//                         // iconSize: 24,
//                         padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
//                         duration: Duration(milliseconds: 400),
//                         tabBackgroundColor: Colors.cyan,
//                         color: Colors.white,
//                         tabs: const [
//                           GButton(
//                             icon: Icons.home,
//                             text: 'Home',
//                           ),
//                           GButton(
//                             icon: Icons.event,
//                             text: 'My Event',
//                           ),
//                           GButton(
//                             icon: Icons.calendar_view_day,
//                             text: 'International Days',
//                           ),
//                           GButton(
//                             icon: Icons.festival,
//                             text: 'Festivals',
//                           ),
//                         ],
//                         selectedIndex: _selectedIndex,
//                         onTabChange: (index) {
//                           setState(() {
//                             _selectedIndex = index;
//                             // pages[_selectedIndex];
//                           });
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         });
//   }
// }

// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';

// // class HomePage extends StatefulWidget {
// //   const HomePage({Key? key}) : super(key: key);

// //   @override
// //   State<HomePage> createState() => _HomePageState();
// // }

// // class _HomePageState extends State<HomePage> {
// //   PageController pageController = PageController();
// //   int _page = 0;
// //   @override
// //   void dispose() {
// //     super.dispose();
// //     pageController.dispose();
// //   }

// //   void navigationTapped(int page) {
// //     pageController.jumpToPage(page);
// //   }

// //   void pageChanged(int page) {
// //     setState(() {
// //       _page = page;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Home page'),
// //         backgroundColor: Colors.grey.shade800,
// //       ),
// //       body: PageView(
// //         children: [
// //           Text('Home page'),
// //           Text('My Events'),
// //           Text('International Days'),
// //           Text('Festivals'),
// //         ],
// //         controller: pageController,
// //         onPageChanged: pageChanged,
// //       ),
// //       bottomNavigationBar: CupertinoTabBar(
// //         items: const [
// //           BottomNavigationBarItem(icon: Icon(Icons.home)),
// //           BottomNavigationBarItem(icon: Icon(Icons.event)),
// //           BottomNavigationBarItem(icon: Icon(Icons.calendar_view_day)),
// //           BottomNavigationBarItem(icon: Icon(Icons.festival)),
// //         ],
// //         onTap: navigationTapped,
// //       ),
// //     );
// //   }
// // }
// // // defaultConfig {
// // //     ...

// // //     multiDexEnabled true
// // // }
// // // and

// // // dependencies {
// // //     ...

// // //     implementation 'com.android.support:multidex:1.0.3'
// // // }
// // //multiDexEnabled true
// // //  Run with --stacktrace option to get the stack trace.
// // // > Run with --info or --debug option to get more log output.
// // // > Run with --scan to get full insights.

import 'package:fhooks1_lec6/utills/colors.dart';
import 'package:flutter/material.dart';

class Prects extends StatefulWidget {
  const Prects({Key? key}) : super(key: key);

  @override
  State<Prects> createState() => _PrectsState();
}

class _PrectsState extends State<Prects> {
  bool isOn = false;
  List<int> selectedTile = [];
  List<Developers> developers = [
    Developers(
      name: "HAssan",
      occupation: "Flutter ",
      isSelected: false,
    ),
    Developers(
      name: "Usman",
      occupation: "Flutter ",
      isSelected: false,
    ),
    Developers(
      name: "Haseb",
      occupation: "Wordpress Developer ",
      isSelected: false,
    ),
  ];
  List<Developers> selectedDevelopers = [];

  void selectedListtile(index) {
    if (selectedTile.contains(index)) {
      setState(() {
        selectedTile.remove(index);
      });
    } else {
      setState(() {
        selectedTile.add(index);
      });
    }
  }
  // loadData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   isOn =prefs.getBool("isSelected") as bool;
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   loadData();
  // }
  // GetStorage getStorage = GetStorage();
  // readingData(index) {
  //   if (getStorage.read("isOn") != null) {
  //     developers[index].isSelected = getStorage.read("isOn");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: developers.length,
            itemBuilder: (context, index) {
              // print("isOn$index");
              return Card(
                child: ListTile(
                  title: Text(developers[index].name),
                  subtitle: Text(developers[index].occupation),
                  // leading: Icon(Icons.person),
                  // trailing: Switch(
                  //     value: developers[index].isSelected,
                  //     onChanged: (value) {
                  //       setState(() {
                  //         developers[index].isSelected = value;
                  //       });
                  //     }),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (BuildContext context, setPState) =>
                              AlertDialog(
                            backgroundColor: appBackgroundColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.edit,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                      onPressed: () {},
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => SearchBar(),
                    //   ),
                    // );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Developers {
  String name;
  String occupation;
  bool isSelected;
  Developers({
    required this.name,
    required this.occupation,
    required this.isSelected,
  });
}
