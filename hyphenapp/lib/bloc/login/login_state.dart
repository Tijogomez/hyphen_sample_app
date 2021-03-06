import 'package:hyphenapp/bloc/form_submission_status.dart';

class LoginState {
  String username;
  bool get isValidUsername => username.length >= 0;

  String password;
  bool get isValidPassword => password.length >= 0;

  final FormSubmissionStatus formStatus;

  LoginState({
    this.username = '',
    this.password = '',
    this.formStatus = const InitialFormStatus(),
  });

  LoginState copyWith({
    String username,
    String password,
    FormSubmissionStatus formStatus,
  }) {
    return LoginState(
        username: username ?? this.username,
        password: password ?? this.password,
        formStatus: formStatus ?? this.formStatus);
  }
}
