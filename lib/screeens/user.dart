import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:elearning/constants/firebase_consts.dart';
import 'package:elearning/auth/forget_pass.dart';
import 'package:elearning/screeens/loading_manager.dart';
import 'package:elearning/auth/global_methods.dart';
import 'package:elearning/widgets/text_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../auth/login.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  String? _email;
  String? _name;
  bool _isLoading = false;
  final User? user = authInstance.currentUser;
  @override
  void initState() {
    getUserData();
    super.initState();
  }

  Future<void> getUserData() async {
    setState(() {
      _isLoading = true;
    });
    if (user == null) {
      setState(() {
        _isLoading = false;
      });
      return;
    }
    try {
      String _uid = user!.uid;

      final DocumentSnapshot userDoc =
          await FirebaseFirestore.instance.collection('users').doc(_uid).get();
      if (userDoc == null) {
        return;
      } else {
        _email = userDoc.get('email');
        _name = userDoc.get('name');
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      GlobalMethods.errorDialog(subtitle: '$error', context: context);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff534ea7),
        body: LoadingManager(
          isLoading: _isLoading,
          child: Center(
            heightFactor:1.2,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                  children: [
                    FloatingActionButton(
                        mini: true,
                        backgroundColor: const Color(0xff9288e4),
                        child: const Icon(
                          Icons.arrow_back,size: 20,
                        ),
                        onPressed: () {Navigator.of(context).pop();}),
                        const SizedBox(width: 20,),
                    Text(
                      "informations utilisateur :",
                      style: GoogleFonts.roboto(
                          fontSize: 22,
                          color: Colors.white70,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                    const SizedBox(
                      height: 15,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Bienvenu, ',
                        style: const TextStyle(
                          color: Colors.cyan,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: _name == null ? 'user' : _name!,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('My name is pressed');
                                }),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextWidget(
                      text: _email == null ? 'Email' : _email!,
                      color: Colors.white70,
                      textSize: 18,
                      // isTitle: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      thickness: 2,color: Colors.white70
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _listTiles(
                      title: 'mot de passe oublié',
                      icon: IconlyLight.unlock,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ForgetPasswordScreen(),
                          ),
                        );
                      },
                      color: Colors.white70,
                    ),
                    _listTiles(
                      title: user == null ? 'Connexion' : 'Se déconnecter',
                      icon:
                          user == null ? IconlyLight.login : IconlyLight.logout,
                      onPressed: () {
                        if (user == null) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                          return;
                        }
                        GlobalMethods.warningDialog(
                            title: 'Se déconnecter',
                            subtitle: 'Voulez-vous vous déconnecter ?',
                            fct: () async {
                              await authInstance.signOut();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                            context: context);
                      },
                      color: Colors.white70,
                    ),
                    // listTileAsRow(),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget _listTiles({
    required String title,
    String? subtitle,
    required IconData icon,
    required Function onPressed,
    required Color color,
  }) {
    return ListTile(
      title: TextWidget(
        text: title,
        color: color,
        textSize: 22,
        // isTitle: true,
      ),
      subtitle: TextWidget(
        text: subtitle == null ? "" : subtitle,
        color: color,
        textSize: 18,
      ),
      leading: Icon(icon,color: Colors.white70),
      trailing: const Icon(IconlyLight.arrowRight2,color: Colors.white70),
      onTap: () {
        onPressed();
      },
    );
  }
}
