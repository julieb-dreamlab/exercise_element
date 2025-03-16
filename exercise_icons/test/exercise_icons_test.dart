import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:exercise_icons/exercise_icons.dart';
import 'package:flutter/services.dart';

import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

// Generate a Mock for the rootBundle
class MockAssetBundle extends Mock implements AssetBundle {}

@GenerateMocks([AssetBundle])

void main() {
    testWidgets('Image0 widget returns the correct image', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Image0(),
      ),
    ));

    // Verify that the Image1 widget returns the correct image
    final imageFinder = find.byType(Image);
    expect(imageFinder, findsOneWidget);

    final imageWidget = tester.widget<Image>(imageFinder);
    expect(imageWidget.image, isA<AssetImage>());
    final assetImage = imageWidget.image as AssetImage;
    expect(assetImage.assetName, 'packages/exercise_icons/assets/images/ExerciseIcon0.png');
  });
  testWidgets('Image1 widget returns the correct image', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Image1(),
      ),
    ));

    // Verify that the Image1 widget returns the correct image
    final imageFinder = find.byType(Image);
    expect(imageFinder, findsOneWidget);

    final imageWidget = tester.widget<Image>(imageFinder);
    expect(imageWidget.image, isA<AssetImage>());
    final assetImage = imageWidget.image as AssetImage;
    expect(assetImage.assetName, 'packages/exercise_icons/assets/images/ExerciseIcon1.png');
  });

  testWidgets('Image2 widget returns the correct image', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Image2(),
      ),
    ));

    // Verify that the Image2 widget returns the correct image
    final imageFinder = find.byType(Image);
    expect(imageFinder, findsOneWidget);

    final imageWidget = tester.widget<Image>(imageFinder);
    expect(imageWidget.image, isA<AssetImage>());
    final assetImage = imageWidget.image as AssetImage;
    expect(assetImage.assetName, 'packages/exercise_icons/assets/images/ExerciseIcon2.png');
  });
  //   testWidgets('Text0 widget returns the correct text', (WidgetTester tester) async {
  //   // Arrange
  //   final MockAssetBundle mockAssetBundle = MockAssetBundle();
  //   const String text0 = 'Exercise 0';
   
  //   // Override the rootBundle with the mock
  //   MockAssetBundle rootBundle = mockAssetBundle;
  //   when(rootBundle.loadString(any)).thenAnswer((_) async => text0);

  //   // Act
  //   String fileName = 'packages/exercise_icons/assets/descriptions/ExerciseIcon0.txt';
  //   await tester.pumpWidget(MaterialApp(home: TextAssetWidget(fileName: fileName)));
  //   await tester.pumpAndSettle(); // Wait for all animations to complete

  //   // Assert
  //   expect(find.text(text0), findsOneWidget);
  // });
  testWidgets('ExerciseIcon widget returns the correct image', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      
      home: Scaffold(
        body: ExerciseIcon(id:1),
      ),
    ));

    // Verify that the Image2 widget returns the correct image
    final imageFinder = find.byType(Image);
    expect(imageFinder, findsOneWidget);

    final imageWidget = tester.widget<Image>(imageFinder);
    expect(imageWidget.image, isA<AssetImage>());
    final assetImage = imageWidget.image as AssetImage;
    expect(assetImage.assetName, 'packages/exercise_icons/assets/images/ExerciseIcon1.png');
  });

  testWidgets('ExerciseText widget returns the correct text', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      
      home: Scaffold(
        body: ExerciseText(id:1),
      ),
    ));

    // Verify that the Image2 widget returns the correct image
    final textFinder = find.byType(Text);
    expect(textFinder, findsOneWidget);

    // final textWidget = tester.widget<Text>(textFinder);
    // expect(textWidget.Text, isA<AssetText>());
    // final assetText = textWidget.Text as AssetText;
    // expect(assetText.assetName, 'packages/exercise_icons/assets/dexcriptions/ExerciseIcon1.txt');
  });
}