import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseItem extends StatelessWidget {
  const CourseItem(
      {super.key,
      required this.onTap,
      required this.headline,
      required this.title,
      required this.startColor,
      required this.endColor,
      required this.image});

  final String headline;
  final String title;
  final int startColor;
  final int endColor;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 26),
        child: Container(
          width: 246,
          height: 349,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: const Alignment(1, 0.0),
                  colors: [Color(startColor), Color(endColor)])),
          child: Stack(
            children: [
              Positioned(
                  left: 11,
                  top: 15,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(39),
                        color: const Color(0xffafa8ee)),
                    child: Text(
                      headline,
                      style: GoogleFonts.roboto(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              Positioned(
                  left: 14,
                  top: 80,
                  child: Text(
                    title,
                    style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: Image.asset(
                    image,
                    scale: 2,
                    height: 220,
                    width: 220,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
