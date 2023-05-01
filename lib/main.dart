import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worker/app/constants/constants.dart';
import 'package:worker/app/services/services.dart';

import 'ui/routers/routers.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _router = Get.find();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConstants.appName,
      routerConfig: _router.config(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColorsConstants.orange,
      ),
    );
  }
}
