import 'package:fhooks1_lec6/Screeens/homePage/bottom_navigation_bar/add_event.dart';
import 'package:fhooks1_lec6/Screeens/at_start.dart';
import 'package:fhooks1_lec6/models/global_model.dart';
import 'package:fhooks1_lec6/prects.dart';
import 'package:fhooks1_lec6/utills/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Screeens/homePage/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDnArra35_-obOrQHuPe2kGjSxeI5KITRI",
        appId: "1:331575284397:web:5b3664b5b775acc445ec24",
        messagingSenderId: "331575284397",
        projectId: "event-reminder-d2ae0",
        storageBucket: "event-reminder-d2ae0.appspot.com",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: appBackgroundColor,
            ),
            home: StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData) {
                      return const HomePage();
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('${snapshot.error}'),
                      );
                    }
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  }
                  return const AtStart();
                }),
          );
        });
  }
}
