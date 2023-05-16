// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:elearning/screeens/pdfscreens/pdfad.dart';
import 'package:elearning/screeens/pdfscreens/pdfal.dart';
import 'package:elearning/screeens/pdfscreens/pdfma.dart';
import 'package:elearning/widgets/empty_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:elearning/screeens/course_detail_screen.dart';
import 'package:elearning/widgets/chapter_item_expand.dart';
import 'package:elearning/widgets/expand.dart';
import 'package:elearning/widgets/lecture_item_expand.dart';

class Math extends StatefulWidget {
  const Math({super.key});

  @override
  State<Math> createState() => _MathState();
}

class _MathState extends State<Math> {
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
                Row(
                  children: [
                    FloatingActionButton(
                        mini: true,
                        backgroundColor: const Color(0xff9288e4),
                        child: const Icon(
                          Icons.arrow_back,
                          size: 20,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Section :",
                      style: GoogleFonts.roboto(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 22,
                ),
                Center(
                  child: Text(
                    "Mathématiques",
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
                    image: "assets/images/ma.png",
                    title: "Mathématiques Appliquées",
                  ),
                  expandableContent: LectureItemexpand(
                      image: "assets/images/ma.png",
                      title: 'Pr.Abdelaziz Qaffou',
                      duration: "50 heures",
                      rating: 5.0),
                  onOption1Tap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Pdfma()));
                  },
                  onOption2Tap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Empty()));
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ExpandableWidget(
                  child: ChapterItemexpand(
                    image: "assets/images/an.png",
                    title: "Analyse discrète",
                  ),
                  expandableContent: LectureItemexpand(
                      image: "assets/images/an.png",
                      title: 'Pr. KAJOUNNI',
                      duration: "30 heures",
                      rating: 5.0),
                  onOption1Tap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Pdfad(),
                        ));
                  },
                  onOption2Tap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Empty()));
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ExpandableWidget(
                  child: ChapterItemexpand(
                    image: "assets/images/al.png",
                    title: "Algèbre Linéaire",
                  ),
                  expandableContent: LectureItemexpand(
                      image: "assets/images/al.png",
                      title: 'Pr. EL BOUKARI',
                      duration: "30 heures",
                      rating: 5.0),
                  onOption1Tap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Pdfal()));
                  },
                  onOption2Tap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Empty()));
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
