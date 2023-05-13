// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:elearning/screeens/categories/droits.dart';
import 'package:elearning/screeens/categories/langues.dart';
import 'package:elearning/screeens/categories/mathematiques.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:elearning/constants/app_constants.dart';
import 'package:elearning/screeens/categories/informatiques.dart';
import 'package:elearning/screeens/course_detail_screen.dart';
import 'package:elearning/widgets/course_item.dart';
import 'package:elearning/widgets/lecture_item.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.primaryColor,
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
                  "Mghila",
                  style: GoogleFonts.roboto(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "EST Beni-Mellal",
                  style: GoogleFonts.roboto(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ]),
          const SizedBox(
            height: 22,
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Lan()));
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
                  "Programme Genie informatique",
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
                            builder: (context) => const CourseDetailScreen()));
                  },
                  image: "assets/images/img_saly24.png",
                  title: 'est bm',
                  duration: "8 heures",
                  rating: 4.0),
              LectureItem(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CourseDetailScreen()));
                  },
                  image: "assets/images/img_saly24.png",
                  title: 'est bm',
                  duration: "8 heures",
                  rating: 4.0),
              LectureItem(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CourseDetailScreen()));
                  },
                  image: "assets/images/img_saly24.png",
                  title: 'est bm',
                  duration: "8 heures",
                  rating: 4.0),
              LectureItem(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CourseDetailScreen()));
                  },
                  image: "assets/images/img_saly24.png",
                  title: 'est bm',
                  duration: "8 heures",
                  rating: 4.0),
              LectureItem(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CourseDetailScreen()));
                  },
                  image: "assets/images/img_saly24.png",
                  title: 'est bm',
                  duration: "8 heures",
                  rating: 4.0),
            ],
          )
        ],
      )),
    );
  }
}
