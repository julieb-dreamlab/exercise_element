library exercise_icons;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

const int maxExerciseID = 3;

/// A widget that displays image1.png.
class Image1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset('packages/exercise_icons/assets/images/ExerciseIcon1.png');
  }
}

/// A widget that displays image2.jpg.
class Image2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset('packages/exercise_icons/assets/images/ExerciseIcon2.png');
  }
}

/// A widget that displays image3.jpg.
class Image3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset('packages/exercise_icons/assets/images/ExerciseIcon3.png');
  }
}

/// A panel with the exercise components: icon, desc, demo
class Exercise_Icon extends StatelessWidget {
  final int id;

  Exercise_Icon({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    print('return Exercise_Icon id: $id ');
        
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        
        child: Image.asset('packages/exercise_icons/assets/images/ExerciseIcon$id.png'),
      ),
    );
  }
}

// class TextAssetWidget() extends StatefulWidget {
//   @override
//   _TextAssetWidgetState createState() => _TextAssetWidgetState();
// }

// class _TextAssetWidgetState extends State<TextAssetWidget> {
//   String _textFromFile = 'Loading...';

//   @override
//   void initState() {
//     super.initState();
//     _loadTextAsset();
//   }

//   Future<void> _loadTextAsset() async {
//     final text = await rootBundle.loadString('assets/descriptions/ExerciseIcon$id.txt');
//     setState(() {
//       _textFromFile = text;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Text(_textFromFile),
//       ),
//     );
//   }

// }