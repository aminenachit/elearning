// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:elearning/screeens/course_detail_screen.dart';
import 'package:elearning/widgets/chapter_item_expand.dart';
import 'package:elearning/widgets/expand.dart';
import 'package:elearning/widgets/lecture_item_expand.dart';

class Lan extends StatefulWidget {
  const Lan({super.key});

  @override
  State<Lan> createState() => _LanState();
}

class _LanState extends State<Lan> {
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
                    "Langues et techniques de communication",
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
                    image: "assets/images/fr.png",
                    title: "Français",
                  ),
                  expandableContent: LectureItemexpand(
                      image: "assets/images/fr.png",
                      title: 'Pr. OUSSIKOUM',
                      duration: "20 heures",
                      rating: 5.0),
                  onOption1Tap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CourseDetailScreen(),
                        ));
                  },
                  onOption2Tap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CourseDetailScreen()));
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ExpandableWidget(
                  child: ChapterItemexpand(
                    image: "assets/images/ang.png",
                    title: "Anglais",
                  ),
                  expandableContent: LectureItemexpand(
                      image: "assets/images/ang.png",
                      title: 'Pr. Hamid Masfour',
                      duration: "20 heures",
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
                            builder: (context) => const CourseDetailScreen()));
                  },
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
