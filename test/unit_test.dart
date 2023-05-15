import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elearning/q & a/ui/detail.dart';
import 'package:elearning/Screeens/Home_screen.dart';
import 'package:elearning/q & a/ui/showDetail.dart';

void main() {
  late HomeScreen home;
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    home = HomeScreen();
  });

  group("Check Home page methods returns the widget", () {
    test("create list item", () {
      Widget wid =
          home.createState().getListItems(Colors.blue, Icons.add, 'Add item');
      expect(wid, isNot(null));
    });
  });

  group("Check detail page creation", () {
    test("Creating detail page", () {
      Detail detail = Detail(title: 'Communications Based');
      String text = detail.title;
      Widget items = detail.buildListItems();
      expect(text, isA<String>());
      expect(text, equals('Communications Based'));
      expect(items, isNot(null));
      print('Detail page text is: $text\n\n');
    });
  });

  group('Checking showDetail page', () {
    test('Create a showDetail page object', () {
      ShowDetail showDetail =
          ShowDetail(quest: 'Testing question', ans: 'Testing answer');
      String q = showDetail.quest;
      String a = showDetail.ans;
      expect(q, 'Testing question');
      expect(a, 'Testing answer');
      Widget card = showDetail.createState().cardDetail('testing');
      expect(card, isNot(null));
      print('Question is: $q\n\nAnswer is: $a\n\n');
    });
  });
}
