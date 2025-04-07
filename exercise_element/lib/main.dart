import 'package:exercise_element/services/local_data_service.dart';
import 'package:flutter/material.dart';
import 'package:exercise_element/common/theme.dart';
import 'package:exercise_element/view_models/cart.dart';
import 'package:exercise_element/view_models/catalog.dart';
import 'package:exercise_element/screens/home.dart';
import 'package:exercise_element/screens/cart.dart';
import 'package:exercise_element/screens/catalog.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'repositories/exercise_repository_local.dart';

//import 'src/app.dart';
//import 'src/settings/settings_controller.dart';
//import 'src/settings/settings_service.dart';

void main() async  { 
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

  // WidgetsFlutterBinding.ensureInitialized ensures that the Flutter framework is fully initialized before you proceed
  // with any other code that relies on Flutter's engine or services.
  // This is particularly important when you need to use platform channels, interact with native code,
  // or perform certain operations before the runApp() method is called.
  WidgetsFlutterBinding.ensureInitialized();
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
    final LocalDataService localDataService = LocalDataService();
    final ExerciseRepositoryLocal exerciseRepository = ExerciseRepositoryLocal(localDataService: localDataService);

    return MultiProvider(
      providers: [
        // 
        ChangeNotifierProvider<WholeCatalog>(create: (context) => WholeCatalog(exerciseRepository: exerciseRepository)),
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
      child: MaterialApp.router(
        title: 'Provider Demo',
        theme: appTheme,
        routerConfig: router(),
      ),
    );
  }
}
