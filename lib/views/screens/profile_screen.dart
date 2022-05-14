import 'package:bracuspace_flutter/components/showSnackBar.dart';
import 'package:bracuspace_flutter/shared/shared.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        elevation: 0.0,
        foregroundColor: kSecondary,
        backgroundColor: kBackground,
        centerTitle: true,
        title: const Text('My Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 400.0,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 30.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 85.0),
                      child: Column(
                        children: [
                          Image.asset(
                            Assets.profileImage,
                            width: 150.0,
                            height: 150.0,
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            whatIsMyName(),
                            style: TextStyle(
                              color: kSecondary,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            "Email: ${whatIsMyEmail()}",
                            style: TextStyle(
                              color: kSecondary.withOpacity(0.6),
                              height: 1.5,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            "Status: ${emailVerified()}",
                            style: TextStyle(
                              color: kSecondary.withOpacity(0.6),
                              height: 1.5,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            "Created on: ${accountCreated()}",
                            style: TextStyle(
                              color: kSecondary.withOpacity(0.6),
                              height: 1.5,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            "Last activity: ${lastLogin()}",
                            style: TextStyle(
                              color: kSecondary.withOpacity(0.6),
                              height: 1.5,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 20.0,
                      right: 20.0,
                      child: Container(
                        width: 40.0,
                        height: 20.0,
                        margin: const EdgeInsets.symmetric(
                          vertical: 4.0,
                          horizontal: 10.0,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF4B8F18),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: const Center(
                          child: Text(
                            'Free',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 340.0,
                      right: 75.0,
                      child: _sendVerification(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sendVerification(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser!;
    return !user.emailVerified
        ? ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.currentUser!.sendEmailVerification();
              showSnackBar(context, 'Verification email sent!');
            },
            child: const Text('Send verification email'),
          )
        : Container();
  }

  String whatIsMyName() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser!;
    String myName = "Not found";

    return user.displayName != null ? user.displayName! : myName;
  }

  String whatIsMyEmail() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser!;
    String myName = "Not found";

    return user.email != null ? user.email! : myName;
  }

  String emailVerified() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser!;

    if (user.emailVerified) {
      return "Verified";
    } else {
      return "Not verified";
    }
  }

  String accountCreated() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser!;

    if (user.metadata.creationTime != null) {
      return DateFormat('MMM d, yyyy')
          .format(user.metadata.creationTime as DateTime)
          .toString();
    } else {
      return "Not found";
    }
  }

  String lastLogin() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser!;

    if (user.metadata.lastSignInTime != null) {
      return DateFormat('MMM d, yyyy')
          .format(user.metadata.lastSignInTime as DateTime)
          .toString();
    } else {
      return "Not found";
    }
  }
}
