import 'package:bracuspace_flutter/views/screens/home_screen.dart';
import 'package:bracuspace_flutter/views/screens/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bracuspace_flutter/utilities/constants.dart';

import '../../shared/assets.dart';
import '../../shared/constants.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  Widget _buildBackButton() {
    return GestureDetector(
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const LandingScreen(),
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Icon(Icons.arrow_back_ios, color: kTextHeading, size: 25)),
            Text(
              'Back',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: kTextHeading),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text('Email', style: kLabelStyle),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: const TextField(
            keyboardType: TextInputType.emailAddress,
            cursorColor: Colors.black,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(Icons.email, color: Colors.black),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text('Password', style: kLabelStyle),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            obscureText: _obscurePassword,
            style: const TextStyle(color: Colors.black),
            cursorColor: Colors.black,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14.0),
              prefixIcon: const Icon(Icons.lock, color: Colors.black),
              hintText: 'Enter your password',
              hintStyle: kHintTextStyle,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
                child: IconTheme(
                  data: const IconThemeData(color: Colors.black),
                  child: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text('Confirm Password', style: kLabelStyle),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            obscureText: _obscureConfirmPassword,
            style: const TextStyle(color: Colors.black),
            cursorColor: Colors.black,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14.0),
              prefixIcon: const Icon(Icons.lock, color: Colors.black),
              hintText: 'Confirm your password',
              hintStyle: kHintTextStyle,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  });
                },
                child: IconTheme(
                  data: const IconThemeData(color: Colors.black),
                  child: Icon(_obscureConfirmPassword ? Icons.visibility : Icons.visibility_off),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignupBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        },
        child: const Text(
          'SIGN UP',
          style: TextStyle(fontSize: 16.0),
        ),
        style: TextButton.styleFrom(
          primary: kBackgroundBlack,
          backgroundColor: kTextPikachu,
          fixedSize: const Size(150, 50),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
        ),
      ),
    );
  }

  Widget _buildSignInWithText() {
    return Column(
      children: const <Widget>[
        Text(
          '- OR -',
          // '',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 20.0),
        Text('Sign up with', style: kLabelStyle),
      ],
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              print('Login with Facebook');
            },
            splashRadius: 20.0,
            icon: Image.asset(Assets.instagram, width: 20.0),
          ),
          const SizedBox(width: 50.0),
          IconButton(
            onPressed: () {
              print('Login with Google');
            },
            splashRadius: 20.0,
            icon: Image.asset(Assets.twitter, width: 20.0),
          ),
          const SizedBox(width: 50.0),
          IconButton(
            onPressed: () {
              print('Login with Twitter');
            },
            splashRadius: 20.0,
            icon: Image.asset(Assets.facebook, height: 20.0),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return GestureDetector(
      onTap: () => {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        ),
      },
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Already have an account? ',
              style: TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w400),
            ),
            TextSpan(
              text: 'Login',
              style: TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => {print('Signup Screen Tapped'), FocusScope.of(context).unfocus()},
          child: Stack(
            children: <Widget>[
              SizedBox(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 60.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildBackButton(),
                      const Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20.0),
                      _buildEmailTF(),
                      const SizedBox(height: 20.0),
                      _buildPasswordTF(),
                      const SizedBox(height: 20.0),
                      _buildConfirmPasswordTF(),

                      // _buildForgotPasswordBtn(),
                      // _buildRememberMeCheckbox(),
                      _buildSignupBtn(),
                      _buildSignInWithText(),
                      _buildSocialBtnRow(),
                      _buildLoginBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
