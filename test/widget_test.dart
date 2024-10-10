import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:read_rover/main.dart'; // Correct package name

void main() {
  testWidgets('IntroPage displays welcome message and image',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the welcome message is displayed.
    expect(find.text('Welcome to ReadRover!\nA Mobile Library App'),
        findsOneWidget);

    // Verify that the image is displayed (since it's wrapped in a FadeTransition, we'll check the asset path).
    expect(find.byType(Image), findsOneWidget);
  });
}
