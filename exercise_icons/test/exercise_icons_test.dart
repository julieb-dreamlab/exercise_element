import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:exercise_icons/exercise_icons.dart';

void main() {
    testWidgets('Image0 widget displays the correct image', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Image0(),
      ),
    ));

    // Verify that the Image1 widget displays the correct image
    final imageFinder = find.byType(Image);
    expect(imageFinder, findsOneWidget);

    final imageWidget = tester.widget<Image>(imageFinder);
    expect(imageWidget.image, isA<AssetImage>());
    final assetImage = imageWidget.image as AssetImage;
    expect(assetImage.assetName, 'packages/exercise_icons/assets/images/ExerciseIcon0.png');
  });
  testWidgets('Image1 widget displays the correct image', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Image1(),
      ),
    ));

    // Verify that the Image1 widget displays the correct image
    final imageFinder = find.byType(Image);
    expect(imageFinder, findsOneWidget);

    final imageWidget = tester.widget<Image>(imageFinder);
    expect(imageWidget.image, isA<AssetImage>());
    final assetImage = imageWidget.image as AssetImage;
    expect(assetImage.assetName, 'packages/exercise_icons/assets/images/ExerciseIcon1.png');
  });

  testWidgets('Image2 widget displays the correct image', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Image2(),
      ),
    ));

    // Verify that the Image2 widget displays the correct image
    final imageFinder = find.byType(Image);
    expect(imageFinder, findsOneWidget);

    final imageWidget = tester.widget<Image>(imageFinder);
    expect(imageWidget.image, isA<AssetImage>());
    final assetImage = imageWidget.image as AssetImage;
    expect(assetImage.assetName, 'packages/exercise_icons/assets/images/ExerciseIcon2.png');
  });
  testWidgets('ExerciseIcon widget displays the correct image', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      
      home: Scaffold(
        body: ExerciseIcon(id:1),
      ),
    ));

    // Verify that the Image2 widget displays the correct image
    final imageFinder = find.byType(Image);
    expect(imageFinder, findsOneWidget);

    final imageWidget = tester.widget<Image>(imageFinder);
    expect(imageWidget.image, isA<AssetImage>());
    final assetImage = imageWidget.image as AssetImage;
    expect(assetImage.assetName, 'packages/exercise_icons/assets/images/ExerciseIcon1.png');
  });
}