// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:elearning/screeens/vidscreens/vidao.dart';
import 'package:elearning/screeens/vidscreens/vidbd.dart';
import 'package:elearning/screeens/vidscreens/vidbda.dart';
import 'package:elearning/screeens/vidscreens/vidc.dart';
import 'package:elearning/screeens/vidscreens/vidjava.dart';
import 'package:elearning/screeens/vidscreens/vidri.dart';
import 'package:elearning/screeens/vidscreens/vidse.dart';
import 'package:elearning/widgets/pdfreader.dart';
import 'package:elearning/screeens/pdfscreens/pdfweb.dart';
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
                      image: "assets/images/1web.png",
                      title: 'Pr. M. OUTANOUTE',
                      duration: "44 heures",
                      rating: 5.0),
                  onOption1Tap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Pdfweb(),
                        ));
                  },
                  onOption2Tap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Vidweb()));
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ExpandableWidget(
                  child: ChapterItemexpand(
                    image: "assets/images/c1.svg",
                    title: "C, C++, Structure de données, Algorithmique",
                  ),
                  expandableContent: LectureItemexpand(
                      image: "assets/images/c1.svg",
                      title: 'Pr. R. EL AYACHI',
                      duration: "70 heures",
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
                            builder: (context) => Vidc()));
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ExpandableWidget(
                  child: ChapterItemexpand(
                    image: "assets/images/java1.png",
                    title: "Génie Logiciel (UML, JAVA)",
                  ),
                  expandableContent: LectureItemexpand(
                      image: "assets/images/java1.png",
                      title: 'Pr.Yousef El Mourabit',
                      duration: "40 heures",
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
                            builder: (context) => Vidjava()));
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ExpandableWidget(
                  child: ChapterItemexpand(
                    image: "assets/images/bd1.png",
                    title: "Systeme d'informations et base de données",
                  ),
                  expandableContent: LectureItemexpand(
                      image: "assets/images/bd1.png",
                      title: 'Pr. M. OUTANOUTE',
                      duration: "30 heures",
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
                            builder: (context) => Vidbd()));
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ExpandableWidget(
                  child: ChapterItemexpand(
                    image: "assets/images/ao1.png",
                    title:
                        "Architecture des ordinateurs\nelectronique numerique",
                  ),
                  expandableContent: LectureItemexpand(
                      image: "assets/images/ao1.png",
                      title: 'Pr. Aboulouard',
                      duration: "45 heures",
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
                            builder: (context) => Vidao()));
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ExpandableWidget(
                  child: ChapterItemexpand(
                    image: "assets/images/se1.png",
                    title: "Systèmes d'exploitation",
                  ),
                  expandableContent: LectureItemexpand(
                      image: "assets/images/se1.png",
                      title: 'Pr. Abdellah Amine',
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
                            builder: (context) => Vidse()));
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ExpandableWidget(
                  child: ChapterItemexpand(
                    image: "assets/images/bda1.png",
                    title: "Base de Données Avancées",
                  ),
                  expandableContent: LectureItemexpand(
                      image: "assets/images/bda1.png",
                      title: 'Pr. Driss AIT OMAR',
                      duration: "40 heures",
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
                            builder: (context) => Vidbda()));
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ExpandableWidget(
                  child: ChapterItemexpand(
                    image: "assets/images/ri1.png",
                    title: "Réseaux Informatiques",
                  ),
                  expandableContent: LectureItemexpand(
                      image: "assets/images/ri1.png",
                      title: 'Pr. Driss AIT OMAR',
                      duration: "38 heures",
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
                            builder: (context) => Vidri()));
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
