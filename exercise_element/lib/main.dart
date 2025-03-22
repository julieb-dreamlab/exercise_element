import 'package:flutter/material.dart';
import 'package:exercise_icons/exercise_icons.dart';
import 'package:exercise_element/common/theme.dart';
import 'package:exercise_element/models/cart.dart';
import 'package:exercise_element/models/catalog.dart';
import 'package:exercise_element/screens/home.dart';
import 'package:exercise_element/screens/cart.dart';
import 'package:exercise_element/screens/catalog.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
//import 'src/app.dart';
//import 'src/settings/settings_controller.dart';
//import 'src/settings/settings_service.dart';

void main()  { //async
  //   ******** TODO: switch to using SettingsController rather than MultiProvider ChangeNotifier  ********
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


GoRouter router() {
  return GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
      GoRoute(
        path: '/catalog',
        builder: (context, state) => const MyCatalog(),
        routes: [
          GoRoute(path: 'cart', builder: (context, state) => const MyCart()),
        ],
      ),
    ],
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.
    return MultiProvider(
      providers: [
        // In this sample app, WholeCatalog never changes, so a simple Provider
        // is sufficient.
        Provider(create: (context) => WholeCatalog()),
        // CartModel is implemented as a ChangeNotifier, which calls for the use
        // of ChangeNotifierProvider. Moreover, CartModel depends
        // on WholeCatalog, so a ProxyProvider is needed.
        ChangeNotifierProxyProvider<WholeCatalog, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            if (cart == null) throw ArgumentError.notNull('cart');
            cart.catalog = catalog;
            return cart;
          },
        ),
      ],
      child: MyApp(),
    );
  }
}
// class MyApp extends StatelessWidget {
//   final List<ListExercises> items;
//   const MyApp({super.key, required this.items});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Generate List'),
//         ),
//         body: ListView.builder(
//           // Let the ListView know how many items to build.
//           itemCount: items.length,
//           // Convert each item into a widget based on the type of item it is.
//           itemBuilder: (context, index) {
//             final item = items[index];
//             print('item index: $index ');
//             if (item is HeadingItem) {
//               return ListTile(
//                 title: Text(item.heading, style: Theme.of(context).textTheme.headlineSmall)
//               );
//             } else if (item is ExerciseItem) {
//               return ListTile(
//                 title: Exercise(id: item.id,)
//               );
//             }
//             return Container();
//           },
//         ),
//       ),
//     );
//   }
// }

// // the base class for listing the exercises
// // defined (eventually) as containing exercise_icon, timer widget, and buttons
// abstract class ListExercises {
//   // The title line
//   Widget buildTitle(BuildContext context);

//   // The exercise element
//   Widget buildExerciseElement(BuildContext context);

//   // The exercise element
//   Widget buildSubtitle(BuildContext context);

// }

// /// A ListItem that contains data to display a heading.
// class HeadingItem implements ListExercises {
//   final String heading;

//   HeadingItem(this.heading);

//   @override
//   Widget buildTitle(BuildContext context) {
//     return Text(heading, style: Theme.of(context).textTheme.headlineSmall);
//   }

//   @override
//   Widget buildExerciseElement(BuildContext context) => Text(heading);

//   @override
//   Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
// }

// /// A ListItem that contains data to display a message.
// class ExerciseItem implements ListExercises {
//   final int id;

//   ExerciseItem(this.id);
//   @override
//   Widget buildTitle(BuildContext context) => const SizedBox.shrink();

//   @override
//   Widget buildExerciseElement(BuildContext context){
//     return ExerciseIcon(id: id,);
//   }
//   @override
//   Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
// }
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
