import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies_recommendation/data/di.dart';
import 'package:movies_recommendation/utils/routes.dart';

Future<void> main() async {
  String publicKeyMarvel = '';
  String privateKeyMarvel = '';
  String apiUrl = '';
  await dotenv.load();
  if (kIsWeb) {
    publicKeyMarvel = dotenv.env['PUBLIC_KEY_MARVEL'] ?? '';
    privateKeyMarvel = dotenv.env['PRIVATE_KEY_MARVEL'] ?? '';
    apiUrl = dotenv.env['API_KEY_MARVEL'] ?? '';
  } else {
    publicKeyMarvel =
        dotenv.get('PUBLIC_KEY_MARVEL', fallback: 'No encontro nada');
    privateKeyMarvel =
        dotenv.get('PRIVATE_KEY_MARVEL', fallback: 'No encontro nada');
    apiUrl = dotenv.get('API_KEY_MARVEL', fallback: 'No encontro nada');
  }

  setupLocator(apiUrl, publicKeyMarvel, privateKeyMarvel);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      routerConfig: router,
    );
  }
}
