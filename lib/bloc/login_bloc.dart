import 'dart:async';

import 'package:flutter/material.dart';

import '../models/login_model.dart';

class LoginBloc {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _loginStateController = StreamController<LoginState>.broadcast();

  Stream<LoginState> get loginStateStream => _loginStateController.stream;

  String? _usernameError;
  String? _emailError;
  String? _passwordError;

  void validateUsername(String? username) {
    if (username == null || username.isEmpty) {
      _usernameError = 'Username is required';
    } else {
      _usernameError = null;
    }
    updateLoginState();
  }

  void validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      _emailError = 'Email is required';
    } else if (!RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
        .hasMatch(email)) {
      _emailError = 'Invalid email format';
    } else {
      _emailError = null;
    }
    updateLoginState();
  }

  void validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      _passwordError = 'Password is required';
    } else if (password != 'pistol' &&
        !RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,16}$')
            .hasMatch(password)) {
      _passwordError = 'Invalid password format';
    } else {
      _passwordError = null;
    }
    updateLoginState();
  }

  void loginButton() {
    final String _username = usernameController.text;
    final String _email = emailController.text;
    final String _password = passwordController.text;

    validateUsername(_username);
    validateEmail(_email);
    validatePassword(_password);

    if (_usernameError == null &&
        _emailError == null &&
        _passwordError == null) {
      final loginModel = LoginModel(email: _email, password: _password);
      login(loginModel);
    }
  }

  void login(LoginModel loginModel) {
    // Simulating async login process
    Future.delayed(const Duration(seconds: 1), () {
      if (loginModel.email == 'eve.holt@reqres.in' &&
          loginModel.password == 'pistol') {
        _loginStateController.add(LoginSuccess(loginModel));
      } else {
        _loginStateController.add(LoginFailure('Invalid email or password'));
      }
    });
  }

  void updateLoginState() {
    _loginStateController.add(LoginFormUpdated(
      usernameError: _usernameError,
      emailError: _emailError,
      passwordError: _passwordError,
    ));
  }

  void dispose() {
    _loginStateController.close();
  }
}

abstract class LoginState {}

class LoginFormUpdated extends LoginState {
  final String? usernameError;
  final String? emailError;
  final String? passwordError;

  LoginFormUpdated({
    this.usernameError,
    this.emailError,
    this.passwordError,
  });
}

class LoginSuccess extends LoginState {
  final LoginModel loginModel;

  LoginSuccess(this.loginModel);
}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure(this.error);
}
