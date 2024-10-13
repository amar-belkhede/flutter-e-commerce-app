import 'package:e_commerce_app/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_app/common/widget/appbar/app_bar.dart';
import 'package:e_commerce_app/common/widget/button/base_app_buttton.dart';
import 'package:e_commerce_app/presentation/auth/page/forgot_password.dart';
import 'package:e_commerce_app/presentation/auth/page/gender_age_selection_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class EnterPasswordPage extends StatelessWidget {
  const EnterPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _signinText(context),
            const SizedBox(height: 20),
            _passwordText(context),
            const SizedBox(height: 20),
            _continueButton(context),
            const SizedBox(height: 20),
            _forgetPassword(context),
          ],
        ),
      ),
    );
  }

  Widget _signinText(BuildContext context) {
    return Text(
      'Sign in',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _passwordText(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Enter Password',
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BaseAppButton(
      onPressed: () {
        // AppNavigator.push(
        //     context, GenderAgeSelectionPage(userCreationReq: userCreationReq));
      },
      title: "Continue",
    );
  }

  Widget _forgetPassword(BuildContext context) {
    return RichText(
        text: TextSpan(
      children: [
        TextSpan(text: 'Forget password? '),
        TextSpan(
            text: 'Reset',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(context, ForgotPassword());
              },
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
      ],
    ));
  }
}
