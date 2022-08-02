import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fhooks1_lec6/Screeens/resources/notification_api.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key, required this.snap}) : super(key: key);
  final snap;
  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    Timestamp time = widget.snap["time"];
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            NotificatonApi.showScheduleNotification(
              title: widget.snap["title"],
              body: widget.snap["category"],
              scheduleDate: DateTime.fromMicrosecondsSinceEpoch(
                time.microsecondsSinceEpoch,
              ),
            );
            // print(sc)
          },
          child: const Text(
            "schedule",
          ),
        ),
      ),
    );
  }
}
