import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:watch_hour/model/app_config.dart';
import 'package:watch_hour/services/http_service.dart';
import 'package:watch_hour/services/movie_service.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onInitializationComplete;
  const SplashScreen({
    super.key,
    required this.onInitializationComplete,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
    ).then(
      (_) => _setUp(context).then(
        (_) => widget.onInitializationComplete(),
      ),
    );
  }

  Future<void> _setUp(BuildContext context) async {
    final getIt = GetIt.instance;
//?fetching data from main.json file
    final configFile = await rootBundle.loadString('assets/config/main.json');
    final configData = jsonDecode(configFile);

//?and made it accessible globally in our app through the getit package as a singleton
    getIt.registerSingleton<AppConfig>(AppConfig(
      BASE_API_URL: configData['BASE_API_URL'],
      BASE_IMG_API_URL: configData['BASE_IMG_API_URL'],
      API_KEY: configData['API_KEY'],
    ));

    getIt.registerSingleton<HTTPService>(HTTPService());

    getIt.registerSingleton<MovieService>(MovieService());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Watch Hour',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Center(
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }
}
