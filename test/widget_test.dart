// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:nike/main.dart';

void main() {
  testWidgets('Nike app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame
    await tester.pumpWidget(NikeApp());

    // Verify that the app shows 'NIKE BY YOU' text
    expect(find.text('NIKE BY YOU'), findsOneWidget);

    // Verify that SKIP and NEXT buttons are present
    expect(find.text('SKIP'), findsOneWidget);
    expect(find.text('NEXT'), findsOneWidget);
  });
}
