import 'package:bracuspace_flutter/views/screens/screens.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'shared/shared.dart';

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      title: 'BRACU Space',
      theme: themeData,
      home: const LandingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
