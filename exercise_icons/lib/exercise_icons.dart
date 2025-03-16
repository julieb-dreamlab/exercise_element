import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

const int maxExerciseID = 3;

/// A widget that returns image0.png.
class Image0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset('packages/exercise_icons/assets/images/ExerciseIcon0.png');
  }
}

/// A widget that returns Text0.txt.
class Text0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExerciseText(id: 0,);
  }
}

/// A widget that returns image1.png.
class Image1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset('packages/exercise_icons/assets/images/ExerciseIcon1.png');
  }
}
/// A widget that returns image2.jpg.
class Image2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset('packages/exercise_icons/assets/images/ExerciseIcon2.png');
  }
}

/// A widget that returns image3.jpg.
class Image3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset('packages/exercise_icons/assets/images/ExerciseIcon3.png');
  }
}

/// A widget that returns image3.jpg.
class Exercise extends StatelessWidget {
  final int id;

  Exercise({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ExerciseIcon(id: id,),
        ExerciseText(id: id,)
      ],
    );
  }
}

/// A panel with the exercise components: icon, desc, demo
class ExerciseText extends StatelessWidget {
  final int id;

  ExerciseText({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    print('return ExerciseText id: $id ');
        
    return TextAssetWidget(fileName: 'packages/exercise_icons/assets/descriptions/ExerciseIcon$id.txt');
  }
}
/// A panel with the exercise components: icon, desc, demo
class ExerciseIcon extends StatelessWidget {
  final int id;

  ExerciseIcon({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    print('return ExerciseIcon id: $id ');
        
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        
        child: Image.asset('packages/exercise_icons/assets/images/ExerciseIcon$id.png'),
      ),
    );
  }
}

class TextAssetWidget extends StatefulWidget {
  final String fileName;
  TextAssetWidget({required this.fileName});
  @override
  _TextAssetWidgetState createState() => _TextAssetWidgetState();
}

class _TextAssetWidgetState extends State<TextAssetWidget> {
  String _textFromFile = 'Loading...';

  @override
  void initState() {
    super.initState();
    _loadTextAsset();
  }

  Future<void> _loadTextAsset() async {
    final text = await rootBundle.loadString(widget.fileName);
    setState(() {
      _textFromFile = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(_textFromFile);
    // return Center(
    //   child: Padding(
    //     padding: const EdgeInsets.all(16.0),
    //     child: Text(_textFromFile),
    //   ),
    // );
  }

}