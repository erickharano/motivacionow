import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'marvel_module.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
    ).modular();
  }
}

Future main() async {
  await dotenv.load(fileName: "assets/.env");

  runApp(ModularApp(
    module: MarvelModule(),
    child: const AppWidget(),
  ));
}
