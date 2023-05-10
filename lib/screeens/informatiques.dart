// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:elearning/screeens/vidscreens/vidweb.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:elearning/screeens/course_detail_screen.dart';
import 'package:elearning/widgets/chapter_item_expand.dart';
import 'package:elearning/widgets/expand.dart';
import 'package:elearning/widgets/lecture_item.dart';
import 'package:elearning/widgets/lecture_item_expand.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const BouncingScrollPhysics(),
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Section :",
                  style: GoogleFonts.roboto(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 22,
                ),
                Center(
                  child: Text(
                    "Informatiques",
                    style: GoogleFonts.roboto(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ]),
          const SizedBox(
            height: 22,
          ),
          SizedBox(
            height: 700,
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: <Widget>[
                ExpandableWidget(
                  child: ChapterItemexpand(
                    image: "assets/images/1web.png",
                    title: "WEB (HTML, CSS, JS, PHP)",
                  ),
                  expandableContent: LectureItemexpand(
                      image: "assets/images/2web.png",
                      title: 'prof. M.OUTANOUTE',
                      duration: "36 heures",
                      rating: 5.0),
                  onOption1Tap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CourseDetailScreen()));
                  },
                  onOption2Tap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyHomePage()));
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                ExpandableWidget(
                  child: ChapterItemexpand(
                    image: "assets/images/img_saly24.png",
                    title: "C,C++,Structure de données",
                  ),
                  expandableContent: LectureItemexpand(
                      image: "assets/images/img_saly24.png",
                      title: 'est bm',
                      duration: "8 heures",
                      rating: 4.0),
                  onOption1Tap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CourseDetailScreen()));
                  },
                  onOption2Tap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CourseDetailScreen()));
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                ExpandableWidget(
                  child: ChapterItemexpand(
                    image: "assets/images/img_saly24.png",
                    title: "Génie Logiciel (UML, JAVA)",
                  ),
                  expandableContent: LectureItemexpand(
                      image: "assets/images/img_saly24.png",
                      title: 'est bm',
                      duration: "8 heures",
                      rating: 4.0),
                  onOption1Tap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CourseDetailScreen()));
                  },
                  onOption2Tap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CourseDetailScreen()));
                  },
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
