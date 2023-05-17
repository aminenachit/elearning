// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:elearning/q%20&%20a/ui/showDetail.dart';
import 'package:elearning/widgets/my_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:elearning/main.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}
void main() {

testWidgets('Checking showDetail page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
        const MaterialApp(home: ShowDetail(quest: 'my question', ans: 'my answer')));
    List<String> expectedText = [
      'Question :',
      'my question',
      'Answer :',
      'my answer'
    ];
    // Gets the created widgets
    Iterable<Widget> listOfWidgets = tester.allWidgets;
    checkIfTextsCreatedCorrectly(listOfWidgets, expectedText);
    print('Found all texts\n');
    //Scrolling down to find the button.
    await tester.fling(find.text('my question'), Offset(0, -500), 100);
    // Tap the share button.
    await tester.tap(find.byType(MyElevatedButton));
    // Rebuild the widget after the state has changed.
    await tester.pump();
    // Expect to find the button text.
    expect(find.text('Share answer with your friends'), findsOneWidget);
    print('Found and tapped on the text\n');
  });
}

void checkIfTextsCreatedCorrectly(
    Iterable<Widget> listOfWidgets, List<String> expectedTexts) {
  var textWidgetPosition = 0;
  for (Widget widget in listOfWidgets) {
    if (widget is Text) {
      expect(widget.data, expectedTexts[textWidgetPosition]);
      textWidgetPosition++;
    }
    if (textWidgetPosition == 4) {
      break;
    }
  }

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
