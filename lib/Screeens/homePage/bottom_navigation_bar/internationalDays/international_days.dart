import 'package:fhooks1_lec6/Screeens/homePage/bottom_navigation_bar/internationalDays/days_discription.dart';
import 'package:fhooks1_lec6/models/global_model.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InternationalDays extends StatefulWidget {
  const InternationalDays({Key? key}) : super(key: key);

  @override
  State<InternationalDays> createState() => _InternationalDaysState();
}

class _InternationalDaysState extends State<InternationalDays> {
  // late UserModel userModel;
  List<Globaldays> globalDays = [
    Globaldays(
      "icons/education_icon.jpg",
      'Education Day',
      '24 Jnnuary',
      "images/education_day.jpg",
      " On 24 January 2022, we will be celebrating the fourth International Day of Education under the theme “Changing Course, Transforming Education”. As it was detailed in  UNESCO’s recent global Futures of Education report, transforming the future requires an urgent rebalancing or our relationship.",
    ),
    Globaldays(
      "icons/radio_icon.png",
      'Radio Day',
      '13 February',
      "images/radio_day.jpg",
      "Proclaimed in 2011 by the Member States of UNESCO and adopted by the United Nations General Assembly (A/RES/67/124) in 2012 as an International Day, February 13 became World Radio Day (WRD). Radio is a powerful medium for celebrating humanity in all its diversity and constitutes a platform for democratic discourse.",
    ),
    Globaldays(
      "icons/mother_icon.png",
      "Woman's Day",
      '08 March',
      "images/mother_day.jpg",
      "Mother's Day is a celebration honoring the mother of the family or individual, as well as motherhood, maternal bonds, and the influence of mothers in society. It is celebrated on different days in many parts of the world, most commonly in the months of March or May. It complements similar celebrations, largely pushed by commercial interests, honoring family members.",
    ),
    Globaldays(
      "icons/health_icon.png",
      'Health Day',
      '07 April',
      "images/health_day.jpeg",
      "The bond between brothers is so strong and such a significant part of many people’s lives that it has inspired hundreds of books, films, paintings, poetry, and plays.",
    ),
    Globaldays(
      "icons/tea_icon.png",
      'Tea Day',
      '21 May',
      "images/tea_day.jpg",
      "The International Tea Day is observed on May 21 every year. The day is known to create awareness about safe working conditions of the tea workers, fair trade and a sustainable environment to improve production of tea.",
    ),
    Globaldays(
      "icons/father_icon.jpeg",
      "Brother's Day",
      '24 May',
      "images/brother_day.jpg",
      "Brother’s Day celebrates the family – specifically, brothers. Celebrated on the 24th of May, it’s a great day to let your brother know how much he means to you.",
    ),
    Globaldays(
      "icons/father_icon.jpeg",
      "Father's Day",
      '18 June',
      "images/father_day.jpg",
      "Father's Day is a celebration that honours the role of fathers and forefathers. It is a modern holiday, though the ancient Romans did have a tradition of honouring fathers, every February, but only those who had deceased.",
    ),
    Globaldays(
      "icons/parent_icon.png",
      "Parent's Day",
      '24 July',
      "images/parent_day.jpg",
      "Parents' Day celebrates the important role that parents play in their children's lives and recognizes the enduring love and devotion of new parents. Parents and families are a shared responsibility.",
    ),
    Globaldays(
      "icons/friend_icon.png",
      'FriendShip Day',
      '01 Auguest',
      "images/touarism_day.jpg",
      "The International Day of Friendship was proclaimed in 2011 by the UN General Assembly with the idea that friendship between peoples, countries, cultures and individuals can inspire peace efforts and build bridges between communities.",
    ),
    Globaldays(
      "icons/touarism_icon.png",
      'Tourism Day',
      '27 September',
      "images/touarism.jpg",
      "World Tourism Day has been held on 27 September each year since 1980. The date marks the anniversary of the adoption of the Statutes of the Organization in 1970, paving the way for the establishment of UNWTO five years later.",
    ),
    Globaldays(
      "icons/teacher_icon.jpeg",
      "Teacher's Day",
      '05 October',
      "images/teacher_day.jpg",
      "World Teachers’ Day is held annually on 5 October to celebrate all teachers around the globe.  It commemorates the anniversary of the adoption of the 1966 ILO/UNESCO Recommendation concerning the Status of Teachers, which sets benchmarks regarding the rights and responsibilities of teachers.",
    ),
    Globaldays(
      "icons/iqbal_icon.jpg",
      'Iqbal Day',
      '09 November',
      "images/iqbal_day.jpg",
      "Iqbal Day (Yom-e Iqbal), the birthday of Muhammad Iqbal on 9th of November is structured and celebrated universally in the entire world to compliment Iqbal, the “Poet of the East” every year. This day is celebrated to recall Allama Iqbal's groundbreaking dream.",
    ),
    Globaldays(
      "icons/quaid_icon.jpg",
      'Quaid-e-Azam Day',
      '25 December',
      "images/quaid_day.jpg",
      "The nation will celebrate the birth anniversary of the Founder of Pakistan Quaid-i-Azam Muhammad Ali Jinnah today (Saturday) across the country with traditional zeal and fervour. Quaid-i-Azam Muhammad Ali Jinnah was born on December 25, 1876 in Karachi.",
    ),
  ];
  List<Globaldays> displayDays = [];
  searchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Neumorphic(
        margin: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 15.h),
        style: const NeumorphicStyle(
          color: Colors.blueGrey,
          depth: -10,
          boxShape: NeumorphicBoxShape.stadium(),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 14.h,
          horizontal: 18.w,
        ),
        child: TextField(
          decoration: InputDecoration.collapsed(
            // hoverColor: Colors.cyan[200],
            // isDense: true, // Added this
            // contentPadding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 15.h),
            fillColor: Colors.blueGrey,
            filled: true,
            hintText: 'Search...',
            hintStyle: TextStyle(
              fontSize: 18.sp,
            ),
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(20.r),
            //   borderSide: BorderSide.none,
            // ),
          ),
          onChanged: (value) {
            value = value.toLowerCase();
            setState(() {
              displayDays = globalDays.where((person) {
                var pName = person.name.toLowerCase();
                return pName.contains(value);
              }).toList();
            });
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    displayDays = globalDays;
  }

  listItems(index) {
    final user = displayDays[index];
    return GestureDetector(
      onTap: () {
        var currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Card(
        color: const Color.fromARGB(57, 155, 39, 176),
        child: ListTile(
          title: Text(
            user.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
          subtitle: Text(
            user.occupation,
            style: TextStyle(
                fontSize: 15.sp, color: Colors.white.withOpacity(.60)),
          ),
          leading: CircleAvatar(
            backgroundImage: AssetImage(user.iconImage),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_outlined,
            size: 12.sp,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DaysDescription(
                  userModel: displayDays,
                  index: index,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) => GestureDetector(
        onTap: () {
          var currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
            body: ListView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemBuilder: (context, index) {
            return index == 0
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.w),
                    child: searchBar())
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: listItems(index - 1));
          },
          itemCount: displayDays.length + 1,
        )),
      ),
    );
  }
}
