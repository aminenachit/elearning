// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
