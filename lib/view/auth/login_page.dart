import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../bloc/login_bloc.dart';
import '../utils/constants/colors.dart';
import '../utils/shared/custom_widgits.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginBloc loginBloc;

  @override
  void initState() {
    super.initState();
    loginBloc = LoginBloc();
  }

  @override
  void dispose() {
    loginBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 18),
                loginImage(),
                const SizedBox(height: 36),
                Custom.text(
                  text: "Login",
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 12),
                Custom.text(
                  text: "Please sign in to continue",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                const SizedBox(height: 38),
                Form(
                  // key: loginBloc.formKey,
                  child: Column(
                    children: [
                      userNameTextField(),
                      emailTextField(),
                      passwordTextField(),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                loginButton(),
                forgotPasswordButton(),
                newAccountSignup(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Center loginImage() {
    return Center(
      child: Icon(
        CupertinoIcons.burn,
        size: 18.h,
      ),
    );
  }

  SizedBox userNameTextField() {
    return SizedBox(
      height: 88,
      child: Column(
        children: [
          Custom.textField(
            validator: (value) {
              loginBloc.validateUsername(value);
              return null;
            },
            controller: loginBloc.usernameController,
            cursorColor: AppColors.white,
            prefixIcon: Icon(Icons.person, color: AppColors.white),
            hintText: 'Enter user name',
            label: Custom.text(
              text: "User Name",
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  SizedBox emailTextField() {
    return SizedBox(
      height: 88,
      child: Column(
        children: [
          Custom.textField(
            validator: (value) {
              loginBloc.validateEmail(value);
              return null;
            },
            controller: loginBloc.emailController,
            cursorColor: AppColors.white,
            prefixIcon: Icon(Icons.email_outlined, color: AppColors.white),
            hintText: 'Enter your email',
            label: Custom.text(
              text: "EMAIL",
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  SizedBox passwordTextField() {
    return SizedBox(
      height: 88,
      child: Column(
        children: [
          Custom.textField(
            validator: (value) {
              loginBloc.validatePassword(value);
              return null;
            },
            controller: loginBloc.passwordController,
            obscureText: true,
            hintText: 'Enter your password',
            label: Custom.text(
              text: "PASSWORD",
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            cursorColor: AppColors.white,
            prefixIcon: Icon(Icons.lock_outlined, color: AppColors.white),
          ),
        ],
      ),
    );
  }

  TextButton loginButton() {
    return TextButton(
      onPressed: () => loginBloc.loginButton(),
      style: TextButton.styleFrom(
        backgroundColor: AppColors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(600)),
        minimumSize: Size(58.w, 70),
      ),
      child: Custom.text(
        text: "LOGIN",
        textAlign: TextAlign.center,
        fontSize: 20,
        colors: AppColors.darkBlue,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget forgotPasswordButton() {
    return Custom.text(
      text: "Forgot Password?",
      textAlign: TextAlign.center,
      fontSize: 16,
      colors: AppColors.green,
      fontWeight: FontWeight.w600,
    );
  }

  Widget newAccountSignup() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          text: "Don't have an account? ",
          style: Custom.style(
            colors: AppColors.white.withOpacity(0.64),
          ),
          children: [
            WidgetSpan(
              child: Custom.text(
                text: "Sign up",
                colors: AppColors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
