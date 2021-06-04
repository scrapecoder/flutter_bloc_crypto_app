import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocpattern/auth/auth_respository.dart';
import 'package:blocpattern/bloc/form_submission.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRespository authRespository;
  LoginBloc({required this.authRespository}) : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    //for username updated
    print("<---->");
    print(event);
    if (event is LoginUsernameChanged) {
      yield LoginState(username: event.username);
    }

    //for password updated
    else if (event is LoginPasswordChanged) {
      yield LoginState(password: event.password);
    }
    //for form submitted
    else if (event is LoginSubmitted) {
      yield LoginState(formSubmissionStatus: FormSubmitting());

      try {
        await authRespository.login();
        yield LoginState(formSubmissionStatus: SubmissionSuccess());
      } catch (e) {
        yield LoginState(formSubmissionStatus: SubmissionFailed(Exception(e)));
      }
    }
  }
}
