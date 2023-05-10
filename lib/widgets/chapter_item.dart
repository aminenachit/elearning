import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChapterItem extends StatelessWidget {
  final String image;
  final String title;

  const ChapterItem({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Container(
          height: 82,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19),
              color: const Color(0xFF3E3A6D)),
          child: Row(
            children: [
              Container(
                height: 82,
                width: 99,
                decoration: BoxDecoration(
                    color: const Color(0XFFDB61A1),
                    borderRadius: BorderRadius.circular(19),
                    image: DecorationImage(image: AssetImage(image))),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.roboto(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        /*Text(
                          '12 Minutes',
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              color: const Color(0xFF8C8C8C),
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          width: 12,
                        ),*/
                        Container(
                          height: 20,
                          decoration: BoxDecoration(
                            color: const Color(0XFFDB61A1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            child: Text(
                              'Gratuit',
                              style: GoogleFonts.roboto(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
