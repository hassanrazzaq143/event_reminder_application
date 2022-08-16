import 'package:fhooks1_lec6/Screeens/homePage/bottom_navigation_bar/Festivals/festival_description.dart';
import 'package:fhooks1_lec6/Screeens/homePage/bottom_navigation_bar/internationalDays/days_discription.dart';
import 'package:fhooks1_lec6/models/festival_model.dart';
import 'package:fhooks1_lec6/prects.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Festivals extends StatefulWidget {
  const Festivals({Key? key}) : super(key: key);
  @override
  State<Festivals> createState() => _FestivalsState();
}

class _FestivalsState extends State<Festivals> {
  List<FestivalModel> festivals = [
    FestivalModel(
      "festival_icons/fitar_icon.jpg",
      "Eid-ul-Fitar",
      "01 Shawal",
      "https://dm0qx8t0i9gc9.cloudfront.net/thumbnails/video/r8114KN4ip5pxqaw/ramadan-kareem-islamic-background-moonrise-over-the-mosque-and-the-light-of-the-stars_bn3c0zzy_thumbnail-1080_01.png",
      "Eid-ul-Fitr, is the most celebrated festival in Islam, marks the end of the holy month of Ramadan, a month when Muslims across the world hold fast from dawn to dusk. Muslims celebrate Eid-ul-Fitr in the month of Shawwal. They offer special prayers on this day. On this day, they congregate in open spaces, mostly at mosques, and pray for their well-being and progress.",
    ),
    FestivalModel(
      "festival_icons/adha_icon.jpg",
      "Eid-ul-Azha",
      "10 Zilhaj",
      "https://mir-s3-cdn-cf.behance.net/project_modules/fs/ec901729800449.560427a791c4b.jpg",
      "The celebration of Eid-ul-Adha is to commemorate Prophet Ibrahim’s devotion to Allah SWT and his readiness to sacrifice his son, Ismail. At the very point of sacrifice, Allah SWT replaced Ismail with a ram, which was to be slaughtered in place of his son. This command from Allah SWT was a test of Prophet Ibrahim’s willingness and commitment to obey his Lord’s command, without question. Therefore, Eid-ul-Adha means the festival of sacrifice.",
    ),
    FestivalModel(
      "festival_icons/brat_icon.jpg",
      "Shab-e-Barat",
      "15th Shaban",
      "https://i.ytimg.com/vi/UbWSgrfD_Qw/maxresdefault.jpg",
      "It is regarded as the night on which fate and fortune are decided. A night to repent and ask for forgiveness. South Asian sweet called ‘halwa’ is distributed among families and neighbours. Donations are also given to the poor.",
    ),
    FestivalModel(
      "festival_icons/christmas_icon.jpg",
      "Christmas",
      "25 Christmas",
      "https://wallpaper-mania.com/wp-content/uploads/2018/09/High_resolution_wallpaper_background_ID_77700985607.jpg",
      "Christmas celebrates the birth of Jesus Christ. It is celebrated by the majority of Christians. The Roman Christian historian Sextus Julius Africanus dated Jesus’s conception to March 25, which, after 9 months, is December 25. Hence, the birth date was decided.",
    ),
    FestivalModel(
      "festival_icons/dewali_icon.jpg",
      "Dewali",
      "24th October",
      "https://whyy.org/wp-content/uploads/2017/07/shutterstock_319871618.jpg",
      "The five-day festival celebrates the victory of light over darkness. Hindus across the world are celebrating Diwali. The five-day festival of lights is one of the most popular holidays in India, and Thursday is the main day of festivities, when the faithful pray to the Hindu goddess of wealth.",
    ),
    FestivalModel(
      "festival_icons/holi_icon.jpg",
      "Holi",
      "17 March",
      "https://wallpapercave.com/wp/wp4164919.jpg",
      "Holi is a Hindu festival that has been celebrated since ancient times. The Holi Festival is celebrated as a way to welcome in spring, and also is seen as a new beginning where people can release all their inhibitions and start fresh.",
    ),
    FestivalModel(
      "festival_icons/raakhi_icon.jpg",
      "Raksha Bandhan",
      "11 Auguest",
      "https://pbs.twimg.com/media/Eeed9aNU4AEBeLz.jpg",
      "Literally meaning “safety” and “bond”, Raksha Bandhan celebrates the unique bond between a brother and his sister. The festival is observed on the full-moon day or Purnima in the Hindu calendar month of Shravan. ",
    ),
    FestivalModel(
      "festival_icons/kutz_icon.jpg",
      "Kutztown Folk",
      "2nd July – 10th July",
      "https://img.traveltriangle.com/blog/wp-content/uploads/2018/11/Kutztown-Folk-Festival-400x213.jpg",
      "Among the most visit-worthy festivals in the United States is the Kutztown festival that had originated in the 1950’s when three local professors decided to celebrate the Pennsylvanian German population in the country. It is the biggest festival in America! Today, it has surpassed it’s 60th-year mark and attracts hundreds of thousands of visitors every year.",
    ),
    FestivalModel(
      "festival_icons/orleans_icon.jpg",
      "New Orleans",
      "6th Jan – 1st Mar",
      "https://wallpapercave.com/wp/wp2065747.jpg",
      "Of all the festivals celebrated in America, there’s nothing more colourful and thrilling than a Mardi Gras festival, which is marked by a lot of parades and events, all over the city. The New Orleans Mardi Gras is an event that is organised by the social clubs in the city, and people dress up in colourful costumes and parade around the city, and giant floats are driven all over the city as well.",
    ),
    FestivalModel(
      "festival_icons/aloha_icon.jpg",
      "Aloha Festival",
      "22 july",
      "https://img.traveltriangle.com/blog/wp-content/uploads/2018/11/Aloha-Festival-400x266.jpg",
      "festival celebrations in the American culture ideal for all types of travelers like families with kids, the Aloha festival which celebrates Hawaiian culture, is the right festival for you! This festival, which takes place on one island to preserve the Hawaiian heritage and culture.",
    ),
  ];
  List<FestivalModel> festival = [];

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
              festival = festivals.where((title) {
                var pName = title.festivalName.toLowerCase();
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
    festival = festivals;
    // SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  listItems(index) {
    final user = festival[index];
    return GestureDetector(
      onTap: () {
        var currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8.0.h),
        // color: const Color.fromARGB(57, 155, 39, 176),
        color: Colors.cyan.shade800,
        child: ListTile(
          title: Text(
            user.festivalName,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
              fontFamily: 'Poppins',
            ),
          ),
          subtitle: Text(
            user.date,
            style: TextStyle(
              fontSize: 15.sp,
              color: Colors.white.withOpacity(.60),
              fontFamily: 'Poppins',
            ),
          ),
          leading: CircleAvatar(
            backgroundImage: AssetImage(user.iconImage),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_outlined,
            size: 12.sp,
          ),
          onTap: () {
            FocusScope.of(context).unfocus();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FestivalDescription(
                  index: index,
                  festivalModel: festival,
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
          itemCount: festival.length + 1,
        )),
      ),
    );
  }
}
