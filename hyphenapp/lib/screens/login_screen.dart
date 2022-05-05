import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyphenapp/bloc/auth_repo.dart';
import 'package:hyphenapp/bloc/form_submission_status.dart';
import 'package:hyphenapp/bloc/login/login_bloc.dart';
import 'package:hyphenapp/bloc/login/login_events.dart';
import 'package:hyphenapp/bloc/login/login_state.dart';
import 'package:hyphenapp/screens/home_screen.dart';

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
          children: [
            _imageSection(),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: _labelLogin(),
            ),
            _usernameField(),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: _passwordField(),
            ),
            _loginButton(),
            forgetPW(),
            _bottomImageSection()
          ],
        ),
      ),
    );
  }

  Widget _usernameField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFormField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            hintText: 'Username',
            hintStyle: TextStyle(color: Color.fromRGBO(192, 193, 192, 15))),
        validator: (value) =>
            state.isValidUsername ? null : 'Username is short',
        onChanged: (value) =>
            context.read<LoginBloc>().add(LoginUsernameChanged(value)),
      );
    });
  }

  Widget _passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFormField(
        obscureText: true,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            hintText: 'Password',
            hintStyle: TextStyle(color: Color.fromRGBO(192, 193, 192, 15))),
        validator: (value) =>
            state.isValidPassword ? null : 'Min of 8 char required',
        onChanged: (value) =>
            context.read<LoginBloc>().add(LoginPasswordChanged(value)),
      );
    });
  }

  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return state.formStatus is FormSubmitting
          ? CircularProgressIndicator()
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 45,
                  width: 400,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        context.read<LoginBloc>().add(LoginSubmitted());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ));
                      }
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Color.fromRGBO(253, 239, 227, 50),
                        fontSize: 18.0,
                        fontFamily: 'Nunito',
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFF47621),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  )));
    });
  }

  Expanded _imageSection() {
    return Expanded(
        flex: 1,
        child: Stack(children: [
          Container(
            transform: Matrix4.translationValues(-50.0, -10.0, 0.0),
            child: const Image(
              image: AssetImage('assets/images/OrangeBlob@3x.png'),
              alignment: Alignment.centerLeft,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            width: double.infinity,
            margin: const EdgeInsets.only(right: 80),
          ),
          Positioned(
            top: 0.0,
            bottom: 00.0,
            right: 0.0,
            left: 0.0,
            child: Image.asset('assets/images/BuilderGMLogo@3x.png'),
          )
        ]));
  }

  Expanded _bottomImageSection() {
    return Expanded(
        flex: 1,
        child: Stack(children: [
          Container(
            transform: Matrix4.translationValues(
              50.0,
              125.0,
              0,
            ),
            child: const Image(
              image: AssetImage('assets/images/Greyblob@3x.png'),
              alignment: Alignment.topRight,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            width: double.infinity,
            margin: const EdgeInsets.only(left: 60),
          ),
          Positioned(
            top: 0.0,
            right: 0.0,
            left: 0.0,
            bottom: 70,
            child: _labelPowereby(),
          )
        ]));
  }

  Widget _labelPowereby() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text(
        "Powered By",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
          color: Colors.grey,
          fontFamily: 'Nunito',
        ),
      ),
      Image.asset(
        'assets/images/logo@3x.png',
        height: 35,
        width: 150,
      )
    ]);
  }

  Widget _labelLogin() {
    return Container(
      alignment: Alignment.center,
      child: const Text(
        "Login",
        style: TextStyle(
          color: Color(0xFF717171),
          fontWeight: FontWeight.bold,
          fontSize: 24,
          fontFamily: 'Nunito',
        ),
      ),
    );
  }

  Widget forgetPW() {
    return Text(
      "Forgot Password",
      style: TextStyle(
        color: Color(0xFF1675B7),
        fontSize: 18.0,
        decoration: TextDecoration.underline,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
