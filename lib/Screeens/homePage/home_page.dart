import 'package:fhooks1_lec6/Screeens/homePage/bottom_navigation_bar/Festivals/festivals.dart';
import 'package:fhooks1_lec6/Screeens/homePage/bottom_navigation_bar/add_event.dart';
import 'package:fhooks1_lec6/Screeens/homePage/bottom_navigation_bar/internationalDays/international_days.dart';
import 'package:fhooks1_lec6/Screeens/homePage/bottom_navigation_bar/myEvents/my_events.dart';
import 'package:fhooks1_lec6/Screeens/homePage/bottom_navigation_bar/home.dart';
import 'package:fhooks1_lec6/Screeens/resources/notification_api.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final List<Widget> pages = [
    const Home(),
    const MyEvents(
        // uid: FirebaseAuth.instance.currentUser!.uid,
        ),
    const AddEvent(),
    const InternationalDays(),
    const Festivals(),
  ];
  @override
  void initState() {
    super.initState();
    NotificatonApi.init();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[selectedIndex],
        bottomNavigationBar: ConvexAppBar(
            backgroundColor: Colors.cyan.shade800,
            elevation: 8,
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 11, 165, 185),
                Color.fromARGB(255, 44, 97, 139)
              ],
            ),
            items: const [
              TabItem(
                icon: Icons.home,
                title: 'Home',
              ),
              TabItem(
                icon: Icons.event,
                title: 'My Event',
              ),
              TabItem(
                icon: Icons.add,
                title: 'Add',
              ),
              TabItem(
                icon: Icons.calendar_view_day,
                title: 'global days',
              ),
              TabItem(
                icon: Icons.festival,
                title: 'Festivals',
              ),
            ],
            initialActiveIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            }),
      ),
    );
  }
}
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class Prects extends StatefulWidget {
//   const Prects({Key? key}) : super(key: key);

//   @override
//   State<Prects> createState() => _PrectsState();
// }

// class _PrectsState extends State<Prects> {
//   @override
//   void initState() {
//     super.initState();
//     getTitle();
//   }

//   void getTitle() async {
//     DocumentSnapshot snap = await FirebaseFirestore.instance
//         .collection("users")
//         .doc(FirebaseAuth.instance.currentUser!.uid)
//         .get();
//     print(snap.data());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }
