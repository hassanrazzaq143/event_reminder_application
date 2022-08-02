import 'package:fhooks1_lec6/Screeens/resources/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';

final List<OnBoardModel> onBoardData = [
  const OnBoardModel(
    title: "No need to remind Birthday",
    description:
        "It may be your birthday, but you are a gift. You're not special because it's your birthday – you're special because you're you.We will take care of your birthday, and we will remind you. ",
    imgUrl: 'images/event1.jpg',
  ),
  const OnBoardModel(
    title: "Attend Events on time",
    description:
        "Events are a great chance to get some face time with established connections, and to forge some new ones. Events are a way of creating and building bonds – and a strong network is essential for business success.",
    imgUrl: 'images/event2.jpg',
  ),
  const OnBoardModel(
    title: "Attend Events on time",
    description:
        "Events are a great chance to get some face time with established connections, and to forge some new ones. Events are a way of creating and building bonds – and a strong network is essential for business success.",
    imgUrl: 'images/event3.jpg',
  ),
];

class Starting extends StatefulWidget {
  const Starting({Key? key}) : super(key: key);

  @override
  State<Starting> createState() => _StartingState();
}

class _StartingState extends State<Starting> {
  final PageController pageController = PageController();
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: OnBoard(
      onBoardData: onBoardData, pageController: pageController,
      onSkip: () {
        print('skipped');
      },
      // Either Provide onDone Callback or nextButton Widget to handle done state
      onDone: () {
        Anonymous().signIn();
      },
      descriptionStyles: const TextStyle(
        // fontSize: 20,
        fontFamily: "Poppins",
        color: Colors.white,
      ),
    ));
  }
}
