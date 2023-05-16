import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning/constants/app_constants.dart';
import 'package:elearning/widgets/pdfreader.dart';
import 'package:elearning/widgets/passdialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class Pdfal extends StatefulWidget {
  const Pdfal({super.key});

  @override
  State<Pdfal> createState() => _Pdfal();
}

class _Pdfal extends State<Pdfal> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  List<Map<String, dynamic>> pdfData = [];

  Future<String> uploadPdf(String fileName, File file) async {
    final reference =
        FirebaseStorage.instance.ref().child('al/$fileName.pdf');

    UploadTask uploadTask = reference.putFile(file);

    await uploadTask.whenComplete(() {});

    final downloadLink = await reference.getDownloadURL();

    return downloadLink;
  }

  void pickFile() async {
    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (pickedFile != null) {
      String fileName = pickedFile.files[0].name;

      File file = File(pickedFile.files[0].path!);

      final downloadLink = await uploadPdf(fileName, file);

      _firebaseFirestore.collection("al").add({
        "name": fileName,
        "url": downloadLink,
      });

      print("pdf uploaded sucessfully");
    }
  }

  void showPasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PasswordDialog(
          onPasswordEntered: () {
            pickFile();
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  void getAllPdf() async {
    final results = await _firebaseFirestore.collection("al").get();

    pdfData = results.docs.map((e) => e.data()).toList();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getAllPdf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.primaryColor,
      appBar: AppBar(
        backgroundColor: const Color(0xff9288e4),
        title: const Text("cours pdf"),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: pdfData.length,
          // gridDelegate:
          //     SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, Index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            PDFReaderApp(pdfUrl: pdfData[Index]['url'])),
                  );
                },
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
                            color: const Color(0xff9288e4),
                            borderRadius: BorderRadius.circular(19),
                            image: const DecorationImage(
                                image: AssetImage(
                                    "assets/images/pdflogo.png"))),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pdfData[Index]['name'],
                              overflow: TextOverflow.fade,
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
                                const SizedBox(
                                  width: 12,
                                ),
                                Container(
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff9288e4),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    child: Text(
                                      'Gratuit',
                                      style: GoogleFonts.roboto(
                                          fontSize: 11,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
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
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff9288e4),
        child: const Icon(
          Icons.upload_file,
        ),
        onPressed: () => showPasswordDialog(context),
      ),
    );
  }
}
