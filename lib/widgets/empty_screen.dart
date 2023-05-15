// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Empty extends StatefulWidget {
  const Empty({super.key});

  @override
  State<Empty> createState() => _EmptyState();
}

class _EmptyState extends State<Empty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/non_disponible.png', // Remplacez le chemin par le chemin de votre image
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20), // Espace vertical entre l'image et le texte
            Text(
              'indisponible pour le moment',
              style: TextStyle(fontSize: 24, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
