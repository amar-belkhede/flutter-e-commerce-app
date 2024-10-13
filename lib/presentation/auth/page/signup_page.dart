import 'package:e_commerce_app/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_app/common/widget/appbar/app_bar.dart';
import 'package:e_commerce_app/common/widget/button/base_app_buttton.dart';
import 'package:e_commerce_app/data/auth/models/user_creation_req.dart';
import 'package:e_commerce_app/presentation/auth/page/enter_password.dart';
import 'package:e_commerce_app/presentation/auth/page/gender_age_selection_page.dart';
import 'package:e_commerce_app/presentation/auth/page/signin_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _signupText(context),
            const SizedBox(height: 20),
            _firstnameText(context),
            const SizedBox(height: 20),
            _lastNameText(context),
            const SizedBox(height: 20),
            _emailText(context),
            const SizedBox(height: 20),
            _passwordText(context),
            const SizedBox(height: 20),
            _continueButton(context),
            const SizedBox(height: 20),
            _createAccount(context),
          ],
        ),
      ),
    );
  }

  Widget _signupText(BuildContext context) {
    return const Text(
      'Create Account',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _firstnameText(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'firstname',
      ),
    );
  }

  Widget _lastNameText(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'lastname',
      ),
    );
  }

  Widget _emailText(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Enter Email',
      ),
    );
  }

  Widget _passwordText(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'password',
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BaseAppButton(
      onPressed: () {
        // AppNavigator.push(context, const EnterPasswordPage());
        AppNavigator.push(
            context,
            GenderAgeSelectionPage(
              userCreationReq: UserCreationReq(
                // firstName: _firstNameCon.text,
                // email: _emailCon.text,
                // lastName: _lastNameCon.text,
                // password: _passwordCon.text
                firstName: '',
                lastName: '',
                email: '',
                password: '',
              ),
            ));
      },
      title: "Continue",
    );
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(text: 'Do you have an account? '),
          TextSpan(
            text: 'Sign in',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.pushReplacement(context, SigninPage());
              },
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
