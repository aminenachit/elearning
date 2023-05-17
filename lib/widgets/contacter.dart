// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Contacter extends StatefulWidget {
  const Contacter({super.key});

  @override
  State<Contacter> createState() => _ContacterState();
}

class _ContacterState extends State<Contacter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 40),
            Row(
                  children: [
                    FloatingActionButton(
                        mini: true,
                        backgroundColor: const Color(0xff9288e4),
                        child: const Icon(
                          Icons.arrow_back,size: 20,
                        ),
                        onPressed: () {Navigator.of(context).pop();}),
                        SizedBox(width: 20,),
                    Text(
                      "Contacter :",
                      style: GoogleFonts.roboto(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 40),
            Image.asset(
              'assets/images/w.png', // Remplacez le chemin par le chemin de votre image
              width: 70,
              height: 70,
            ),
            SizedBox(height: 20), // Espace vertical entre l'image et le texte
            Text(
              'Whatsapp/Phone :\n0689241846\n\nE-mail :\naminenachit99@gmail.com',
              style: TextStyle(fontSize: 24, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
