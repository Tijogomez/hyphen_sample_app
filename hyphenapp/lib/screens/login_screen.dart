import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyphenapp/bloc/auth_repo.dart';
import 'package:hyphenapp/bloc/form_submission_status.dart';
import 'package:hyphenapp/bloc/login/login_bloc.dart';
import 'package:hyphenapp/bloc/login/login_events.dart';
import 'package:hyphenapp/bloc/login/login_state.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(
          authRepo: context.read<AuthRepo>(),
        ),
        child: _loginForm(),
      ),
    );
  }

  Widget _loginForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_usernameField(), _passwordField(), _loginButton()],
        ),
      ),
    );
  }

  Widget _usernameField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFormField(
        decoration: InputDecoration(
          hintText: 'Username',
        ),
        validator: (value) =>
            state.isValidUsername ? null : 'Username is short',
        onChanged: (value) => context
            .read<LoginBloc>()
            .add(LoginUsernameChanged(username: value)),
      );
    });
  }

  Widget _passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Password',
        ),
        validator: (value) =>
            state.isValidPassword ? null : 'Min of 8 char required',
        onChanged: (value) => context
            .read<LoginBloc>()
            .add(LoginPasswordChanged(password: value)),
      );
    });
  }

  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return state.formStatus is FormSubmitting
          ? CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () {},
              child: Text('Login'),
            );
    });
  }
}
