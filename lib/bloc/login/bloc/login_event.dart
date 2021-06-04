part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUsernameChanged extends LoginEvent {
  final String username;
  LoginUsernameChanged({
    required this.username,
  });
}

class LoginPasswordChanged extends LoginEvent {
  final String password;
  LoginPasswordChanged({
    required this.password,
  });
}

class LoginSubmitted extends LoginEvent {
  final String username;
  final String password;
  LoginSubmitted({
    required this.username,
    required this.password,
  });

  @override
  List<Object> get props => [username, password];
}
