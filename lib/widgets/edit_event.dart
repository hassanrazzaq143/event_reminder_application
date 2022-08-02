import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditEvent extends StatefulWidget {
  const EditEvent({Key? key, required this.snapShot}) : super(key: key);
  final snapShot;

  @override
  State<EditEvent> createState() => EditEventState();
}

class EditEventState extends State<EditEvent> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => Scaffold(
              body: Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Update"),
                ),
              ),
            ));
  }
}
