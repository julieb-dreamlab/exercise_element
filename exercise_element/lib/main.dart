import 'package:flutter/material.dart';
import 'package:exercise_icons/exercise_icons.dart';
import 'package:provider/provider.dart';
//import 'src/app.dart';
//import 'src/settings/settings_controller.dart';
//import 'src/settings/settings_service.dart';

void main()  { //async
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  // final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  // await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  // runApp(MyApp(settingsController: settingsController));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Passing ID Example'),
        ),
        body: ListView.builder(
          itemCount: 3, // Example list of 10 items
          itemBuilder: (context, id) {
            return Exercise_Icon(id: id);
          },
        ),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   final int id = 1;

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => MyAppState(),
//       child: Exercise_Icon(
//         id: id
//       ),
//     );
//   }
// }
// class MyAppState extends ChangeNotifier {
//   int id = MyApp.id;
//   var current = Exercise_Icon(id: id);
//   void getNext() {
//     current = Exercise_Icon(id: id);
//     notifyListeners();
//   }

//    var favorites = <Exercise_Icon>[];

//   void toggleFavorite() {
//     if (favorites.contains(current)) {
//       favorites.remove(current);
//     } else {
//       favorites.add(current);
//     }
//     notifyListeners();
//   }
// }

// class DefinedWorkoutPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var appState = context.watch<MyAppState>();
//     var messages = appState.favorites;

//     if (appState.favorites.isEmpty) {
//       return Center (child: Text('No workouts yet.'));
//     }

//     return ListView(
//       children: [
//         Padding(
//           padding: EdgeInsets.all(20),
//           child: Text('You have ${appState.favorites.length} favorites:'),
//           ),
//           for (var exercise in appState.favorites)
//             ListTile(
//               leading: Image.asset(exercise.image),
//               title: Text(exercise.name.asPascalCase),
//               trailing: Text(exercise.duration)
//             )
//         ],
//       );
//   }
// }
