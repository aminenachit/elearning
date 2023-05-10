// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:elearning/widgets/chapter_item.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({super.key});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 392,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(22),
                      bottomRight: Radius.circular(22)),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: const Alignment(1, 0.0),
                      colors: [Color(0xFFF4C465), Color(0XFFC63956)]),
                  image: DecorationImage(
                      image:
                          AssetImage("assets/images/img_saly36_detail.png"))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 22, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RatingBar.builder(
                      itemCount: 5,
                      minRating: 1,
                      initialRating: 4,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemSize: 18,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                      itemBuilder: (context, _) {
                        return const Icon(
                          Icons.star,
                          color: Color(0xfff4c465),
                        );
                      },
                      onRatingUpdate: (rating) {}),
                  const SizedBox(
                    height: 11,
                  ),
                  Text(
                    'Graphic Design Master',
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.roboto(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 29,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 112.5,
                            child: Stack(
                              children: [
                                Positioned(
                                  child: Container(
                                    height: 45,
                                    width: 45,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/img_user1.png"))),
                                  ),
                                ),
                                Positioned(
                                  left: 22.5,
                                  child: Container(
                                    height: 45,
                                    width: 45,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/img_user2.png"))),
                                  ),
                                ),
                                Positioned(
                                  left: 45,
                                  child: Container(
                                    height: 45,
                                    width: 45,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/img_user3.png"))),
                                  ),
                                ),
                                Positioned(
                                  left: 67.5,
                                  child: Container(
                                    height: 45,
                                    width: 45,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/img_user4.png"))),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            '+28K Members',
                            style: GoogleFonts.roboto(
                                fontSize: 18,
                                color: const Color(0xFFCACACA),
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Container(
                        height: 47,
                        width: 54,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: const Color(0XFF353567)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 15),
                          child:
                              SvgPicture.asset("assets/images/icon_like.svg"),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 51,
            ),
            const SizedBox(
              height: 22,
            ),
            SizedBox(
              height: 349,
              child: ListView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                children: <Widget>[
                  ChapterItem(
                    image: "assets/images/img_saly24.png",
                    title: "WEB (html, css, JS, PHP)",
                  ),
                  ChapterItem(
                    image: "assets/images/img_saly24.png",
                    title: "C,C++,Structure de donnees",
                  ),
                  ChapterItem(
                    image: "assets/images/img_saly24.png",
                    title: "WEB (html, css, JS, PHP)",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
