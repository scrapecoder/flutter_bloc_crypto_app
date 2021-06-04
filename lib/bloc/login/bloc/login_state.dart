part of 'login_bloc.dart';

// abstract class LoginState extends Equatable {}

class LoginState extends Equatable {
  final String username;
  bool get isValidUserName => username.length > 3;
  final String password;
  bool get isValidPassword => password.length > 3;
  final FormSubmissionStatus formSubmissionStatus;

  LoginState({
    this.username = "",
    this.password = "",
    this.formSubmissionStatus = const InitialFormStatus(),
  });

  @override
  List<Object> get props => [];
}
