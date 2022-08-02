import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fhooks1_lec6/widgets/post_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyEvents extends StatefulWidget {
  const MyEvents({
    Key? key,
  }) : super(key: key);
  // final String uid;

  @override
  State<MyEvents> createState() => _MyEventsState();
}

class _MyEventsState extends State<MyEvents> {
  TextEditingController searchController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  // searchBar() {}
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            title: Text(
              "App Name",
              style: TextStyle(
                fontSize: 15.sp,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          // extendBodyBehindAppBar: true,
          // appBar: AppBar(
          //   elevation: 0.0,
          //   backgroundColor: appBackgroundColor,
          //   title: Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          //     child: TextField(
          //       decoration: InputDecoration(
          //         hoverColor: Colors.cyan[200],
          //         isDense: true, // Added this
          //         contentPadding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 15.h),
          //         fillColor: Colors.blueGrey,
          //         filled: true,
          //         hintText: 'Search...',
          //         hintStyle: TextStyle(fontSize: 18.sp),
          //         border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(20.r),
          //           borderSide: BorderSide.none,
          //         ),
          //       ),
          // onChanged: (value) {
          //   value = value.toLowerCase();
          //   setState(() {
          //     festival = festivals.where((title) {
          //       var pName = title.festivalName.toLowerCase();
          //       return pName.contains(value);
          //     }).toList();
          //   });
          // },
          //     ),
          //   ),
          // ),
          body: StreamBuilder(
            // stream: FirebaseFirestore.instance
            //     .collection("Posts")
            //     .where('uid', isEqualTo: widget.uid)
            //     .snapshots(),
            stream: FirebaseFirestore.instance
                .collection("users")
                .doc(
                  _auth.currentUser!.uid.toString(),
                )
                .collection("Posts")
                .snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return
                  // Text()
                  // FutureBuilder(
                  //     future: FirebaseFirestore.instance
                  //         .collection('Posts')
                  //         .where('title',
                  //             isLessThanOrEqualTo: searchController.text)
                  //         .get(),
                  //     builder: (context, snapshot) {
                  //       return ListView.builder(
                  //           shrinkWrap: true,
                  //           itemCount: (snapshot.data! as dynamic).docs.length,
                  //           itemBuilder: (context, index) {
                  //             return PostCard(
                  //               snap: (snapshot.data! as dynamic)
                  //                   .docs[index]
                  //                   .data(),
                  //             );
                  //           });
                  //     }),
                  ListView.builder(
                      // shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return PostCard(
                          snap: snapshot.data!.docs[index].data(),
                          model: snapshot.data!.docs,
                        );
                      });
            },
          ),
        ),
      ),
    );
  }
}
