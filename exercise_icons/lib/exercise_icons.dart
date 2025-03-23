import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

/// TODO: implement a limit on the exercises provided to the catalog
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
/// A widget that returns image2.png.
class Image2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset('packages/exercise_icons/assets/images/ExerciseIcon2.png');
  }
}

/// A widget that returns image3.png.
class Image3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset('packages/exercise_icons/assets/images/ExerciseIcon3.png');
  }
}

/// A widget that returns a Row with components icon, name, description
class Exercise extends StatelessWidget {
  final int id;

  Exercise({super.key, required this.id});

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        ExerciseIcon(id: id,),
        ExerciseName(id: id,),
        ExerciseText(id: id,)
      ],
    );
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

/// A component for a row containing description read from a text file.
class ExerciseText extends StatelessWidget {
  final int id;

  ExerciseText({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    print('return ExerciseText id: $id ');
        
    return TextAssetWidget(fileName: 'packages/exercise_icons/assets/descriptions/ExerciseIcon$id.txt');
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

/// A component for a row containing exercise name read from a string table.
class ExerciseName extends StatelessWidget {
  final int id;
  final GlobalKey<_StringTableWidgetState2> _key = GlobalKey<_StringTableWidgetState2>();
  ExerciseData xd = ExerciseData(name: 'AnywhereAbs4');
  ExerciseName({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    print('return ExerciseName id: $id ');
    
    // stringTableWidget2 adds ExerciseData
    StringTableWidget2 sw2 = StringTableWidget2(id: id);

    ExerciseData? exData = _key.currentState?.exerciseData;
    print(exData?.name);
    print(xd.name);
    return sw2;
  }
}
class StringTableWidget extends StatefulWidget {
  final int id;
  StringTableWidget({required this.id});
  @override
  _StringTableWidgetState createState() => _StringTableWidgetState();
}

class _StringTableWidgetState extends State<StringTableWidget> {
  int? id;
  String? nameFromTable;

  @override
  void initState() {
    super.initState();
    _loadAndExtractString(id);
  }

  Future<void> _loadAndExtractString(id) async {
    try {
      Future<Map<String, String>> _nameFromTable = loadStringTable("fr");
      Map<String, String> map = await _nameFromTable;
      String value = map[widget.id.toString()] ?? 'Default Value';
      setState(() {
        nameFromTable = value;
      });
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<Map<String, String>> loadStringTable(String languageCode) async {
    final String jsonString = await rootBundle.loadString('packages/exercise_icons/assets/ExerciseNames_$languageCode.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    return jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Text(nameFromTable ?? 'Loading...');
  }
}

/// (name, other data as needed)
class ExerciseData {
  String name;
  ExerciseData({required this.name});
}

/// New StringTableWidget
/// 
/// Repeat StringTableWidget with added ExerciseData
class StringTableWidget2 extends StatefulWidget {
  final int id;
  String name = "AnywhereAbs2";

  StringTableWidget2({Key? key, required this.id}) : super(key: key);
  @override
  _StringTableWidgetState2 createState() => _StringTableWidgetState2();
}

class _StringTableWidgetState2 extends State<StringTableWidget2> {
  int? id;
  String? nameFromTable;
  // String set textData(); // => widget.name;

  // Declare a variable to hold the user data
  late ExerciseData exerciseData;

  @override
  void initState() {
    // initialize the exercise data
    exerciseData = ExerciseData(name: "AnywhereAbs");
    super.initState();
    _loadAndExtractString(id);
    _exerciseData();
  }

  Future<void> _loadAndExtractString(id) async {
    try {
      Future<Map<String, String>> _nameFromTable = loadStringTable("en");
      Map<String, String> map = await _nameFromTable;
      String value = map[widget.id.toString()] ?? 'Default Value';
      setState(() {
        nameFromTable = value;
      });
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<Map<String, String>> loadStringTable(String languageCode) async {
    final String jsonString = await rootBundle.loadString('packages/exercise_icons/assets/ExerciseNames_$languageCode.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    return jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }

  void _exerciseData() {
    setState(() {
      exerciseData = ExerciseData(name: nameFromTable ?? 'Loading...');
      // textData = nameFromTable ?? 'Loading..';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Text(nameFromTable ?? 'Loading...');
  }
}