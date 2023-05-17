import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordDialog extends StatefulWidget {
  final Function() onPasswordEntered;

  PasswordDialog({required this.onPasswordEntered});

  @override
  _PasswordDialogState createState() => _PasswordDialogState();
}

class _PasswordDialogState extends State<PasswordDialog> {
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Verifiez que vous etes Admin',
        style: GoogleFonts.roboto(
            fontSize: 20,
            color: const Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold),
      ),
      content: TextField(
        controller: _passwordController,
        obscureText: true,
        decoration: const InputDecoration(
          hintText: 'Mot de passe',
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Annuler'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Valider'),
          onPressed: () {
            String password = _passwordController.text;
            if (password == 'amine') {
              widget.onPasswordEntered();
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Mot de passe incorrect'),
                    content: const Text('Veuillez réessayer.'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
      ],
    );
  }
}