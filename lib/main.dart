import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nike_app/firebase_options.dart';
import 'package:nike_app/utils/app_theme.dart';
import 'package:nike_app/utils/route/app_router.dart';
import 'package:nike_app/utils/route/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nike App',
      theme: AppTheme.lightTheme(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: AppRoutes.bottomNavbar,
    );
  }
}
