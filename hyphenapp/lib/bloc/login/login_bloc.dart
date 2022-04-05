import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyphenapp/bloc/auth_repo.dart';
import 'package:hyphenapp/bloc/form_submission_status.dart';
import 'package:hyphenapp/bloc/login/login_events.dart';
import 'package:hyphenapp/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepo authRepo;
  LoginBloc({this.authRepo}) : super(LoginState()) {
    on<LoginUsernameChanged>((event, emit) async {
      emit(state.copyWith(username: event.username));
    });
    on<LoginPasswordChanged>((event, emit) async {
      emit(state.copyWith(password: event.password));
    });
    on<LoginSubmitted>((event, emit) async {
      emit(state.copyWith(formStatus: FormSubmitting()));
      try {
        await authRepo.login();
        emit(state.copyWith(formStatus: SubmissionSuccess()));
      } catch (e) {
        emit(state.copyWith(formStatus: SubmissionFailed(e)));
      }
    });
  }
}
