import 'package:bracuspace_flutter/views/screens/screens.dart';
import 'package:bracuspace_flutter/shared/shared.dart';
import 'package:bracuspace_flutter/views/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(Assets.wave),
          Positioned(
            top: 100.0,
            left: 30.0,
            child: Image.asset(Assets.cloud, scale: 3.0),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 380.0, left: 40.0, right: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome to',
                  style: TextStyle(fontSize: 20.0),
                ),
                const Spacer(flex: 1),
                const Text(
                  'BRACU Space',
                  style: TextStyle(color: Color(0xFF1B1D28), fontSize: 38.0, fontWeight: FontWeight.bold),
                ),
                const Spacer(
                  flex: 2,
                ),
                const Text(
                  'A cloud storage system for individuals to manage their data.\n\n',
                  style: TextStyle(color: Color(0xFF7B7F9E), fontSize: 14.0, height: 2.0),
                ),
                const Spacer(flex: 1),
                Row(
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
                      label: const Text(
                        'SIGN UP',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      icon: const Icon(Icons.supervisor_account_rounded),
                      style: TextButton.styleFrom(
                        primary: kBackgroundBlack,
                        backgroundColor: kTextPikachu,
                        fixedSize: const Size(150, 50),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                    ),
                    const Spacer(flex: 4),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      icon: const Text(
                        'SIGN IN',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      label: const Icon(Icons.login_rounded),
                      style: TextButton.styleFrom(
                        primary: kBackgroundBlack,
                        backgroundColor: kTextPikachu,
                        fixedSize: const Size(150, 50),
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      ),
                    ),
                  ],
                ),
                const Spacer(flex: 10),
                const Align(alignment: Alignment.center, child: Text('Version 1.0.0', style: TextStyle(fontSize: 10.0, color: Color(0xFF3A4276)))),
                const Spacer(flex: 2), // const Spacer(flex: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
