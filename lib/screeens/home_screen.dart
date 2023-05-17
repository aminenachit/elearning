// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:elearning/constants/textStyle.dart';
import 'package:elearning/screeens/categories/droits.dart';
import 'package:elearning/screeens/categories/langues.dart';
import 'package:elearning/screeens/categories/mathematiques.dart';
import 'package:elearning/screeens/pdfscreens/pdfjava.dart';
import 'package:elearning/screeens/pdfscreens/pdfma.dart';
import 'package:elearning/screeens/qascreen.dart';
import 'package:elearning/widgets/contacter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:elearning/constants/app_constants.dart';
import 'package:elearning/screeens/categories/informatiques.dart';
import 'package:elearning/widgets/course_item.dart';
import 'package:elearning/widgets/lecture_item.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/apropos.dart';
import 'pdfscreens/pdfbda.dart';
import 'pdfscreens/pdfc.dart';
import 'user.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  var data;

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      key: _sideMenuKey,
      background: const Color.fromARGB(255, 160, 151, 245),
      menu: buildMenu(),
      type: SideMenuType.shrinkNSlide,
      child: Scaffold(
        backgroundColor: AppConstants.primaryColor,
        appBar: AppBar(
            elevation: 10.0,
            centerTitle: true,
            backgroundColor: const Color(0xff9288e4),
            leading: GestureDetector(
              child: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onTap: () {
                final _state = _sideMenuKey.currentState!;
                if (_state.isOpened) {
                  _state.closeSideMenu();
                } else {
                  _state.openSideMenu();
                }
              },
            ),
            title: Image.asset(
              "assets/images/logoclean1amine.png",
              height: 150,
              width: 200,
            )),
        body: SafeArea(
            child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 10),
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "SkillShare",
                    style: GoogleFonts.roboto(
                        fontSize: 36,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Choisir une catégorie :",
                    style: GoogleFonts.roboto(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ]),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 349,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: <Widget>[
                  CourseItem(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Info()));
                      },
                      headline: "INFORMATIQUE",
                      title: "COURS/TD\nTP",
                      startColor: 0xff9288e4,
                      endColor: 0xff534ea7,
                      image: "assets/images/info.png"),
                  CourseItem(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Math()));
                      },
                      headline: "MATHEMATIQUES",
                      title: "COURS/TD\nTP",
                      startColor: 0xff9288e4,
                      endColor: 0xff534ea7,
                      image: "assets/images/math.png"),
                  CourseItem(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Lan()));
                      },
                      headline: "LANGUES",
                      title: "COURS/TD\nTP",
                      startColor: 0xff9288e4,
                      endColor: 0xff534ea7,
                      image: "assets/images/langues.png"),
                  CourseItem(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Droit()));
                      },
                      headline: "DROITS\nORGANISATION",
                      title: "COURS\nTD",
                      startColor: 0xff9288e4,
                      endColor: 0xff534ea7,
                      image: "assets/images/droit.png"),
                ],
              ),
            ),
            const SizedBox(
              height: 34,
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cours gratuits",
                    style: GoogleFonts.roboto(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Programme Génie informatique",
                    style: GoogleFonts.roboto(
                        fontSize: 14,
                        color: const Color(0xff9c9a9a),
                        fontWeight: FontWeight.w500),
                  ),
                ]),
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: <Widget>[
                LectureItem(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Pdfc()));
                    },
                    image: "assets/images/c1.svg",
                    title: 'C, C++, Structure...',
                    duration: "70 heures",
                    rating: 5.0),
                LectureItem(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Pdfjava()));
                    },
                    image: "assets/images/java1.png",
                    title: 'Génie Logiciel',
                    duration: "40 heures",
                    rating: 5.0),
                LectureItem(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Pdfbda()));
                    },
                    image: "assets/images/bda1.png",
                    title: 'Réseaux Informatiques',
                    duration: "40 heures",
                    rating: 5.0),
                LectureItem(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Pdfma()));
                    },
                    image: "assets/images/ma.png",
                    title: 'Mathématiques',
                    duration: "50 heures",
                    rating: 5.0),
              ],
            ),
            const SizedBox(
              height: 10,
            )
          ],
        )),
      ),
    );
  }

  buildMenu() {
    return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: Text('Q & A', style: Style.drawerTextStyle),
              leading: const Icon(Icons.question_answer, color: Colors.white),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
            ),
            ListTile(
              title: Text('Utilisateur', style: Style.drawerTextStyle),
              leading: const Icon(Icons.account_box, color: Colors.white),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserScreen()));
              },
            ),
            ListTile(
              title: Text('Partager l\'app', style: Style.drawerTextStyle),
              leading: const Icon(Icons.share, color: Colors.white),
              onTap: () => _sharer(),
            ),
            ListTile(
              title: Text('Contacter', style: Style.drawerTextStyle),
              leading: const Icon(Icons.phone, color: Colors.white),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Contacter()));
              },
            ),
            ListTile(
              title: Text('Suggestions', style: Style.drawerTextStyle),
              leading: const Icon(Icons.email, color: Colors.white),
              onTap: () => _launchgmail(),
            ),
            ListTile(
              title: Text('A propos', style: Style.drawerTextStyle),
              leading: const Icon(Icons.info, color: Colors.white),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Apropos()));
              },
            ),
          ],
        ));
  }

  _sharer() {
    Share.share("Mghila - Enhance your knowledge.\n" +
        "The app that will make you an amazing student\n"
            "Are you ready?\n"
            "Download it now\n");
  }

  _launchgmail() async {
    final Uri _url = Uri.parse(
        'mailto:aminenachit99@gmail.com?subject=Feedback&body=message :');
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}
