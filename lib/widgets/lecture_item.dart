import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class LectureItem extends StatelessWidget {
  final String image;
  final String title;
  final String duration;
  final double rating;
  final VoidCallback onTap;
  const LectureItem(
      {super.key,
      required this.onTap,
      required this.image,
      required this.title,
      required this.duration,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: SizedBox(
          height: 134,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                height: 92,
                width: MediaQuery.of(context).size.width -
                    MediaQuery.of(context).size.width * 0.13,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xff3e3a6d),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          spreadRadius: 0,
                          blurRadius: 13,
                          offset: const Offset(0, 4))
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 26, bottom: 19),
                child: Row(
                  children: [
                    Container(
                      height: 115,
                      width: 115,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(image))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              title,
                              overflow: TextOverflow.fade,
                              style: GoogleFonts.roboto(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              duration,
                              style: GoogleFonts.roboto(
                                  fontSize: 12,
                                  color: const Color(0xff8c8c8c),
                                  fontWeight: FontWeight.w400),
                            ),
                            RatingBar.builder(
                                itemCount: 5,
                                minRating: 1,
                                initialRating: rating,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemSize: 18,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 1),
                                itemBuilder: (context, _) {
                                  return const Icon(
                                    Icons.star,
                                    color: Color(0xfff4c465),
                                  );
                                },
                                onRatingUpdate: (rating) {}),
                          ]),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 34,
                right: 0,
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.06,
                  width: MediaQuery.of(context).size.width * 0.06,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xff534ea7)),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
