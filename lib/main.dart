import 'package:addtocart/ui/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:addtocart/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
