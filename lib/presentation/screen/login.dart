import 'package:blocpattern/auth/auth_respository.dart';
import 'package:blocpattern/bloc/form_submission.dart';
import 'package:blocpattern/bloc/login/bloc/login_bloc.dart';
import 'package:blocpattern/presentation/screen/user_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return _loginForm();
  }

  Widget _loginForm() {
    return Center(
      child: BlocProvider(
        create: (context) => LoginBloc(
          authRespository: context.read<AuthRespository>(),
        ),
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _userNameField(),
                SizedBox(
                  height: 20,
                ),
                _passwordField(),
                SizedBox(
                  height: 20,
                ),
                _signInButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: true,
          decoration:
              InputDecoration(icon: Icon(Icons.security), hintText: "Password"),
          validator: (value) =>
              state.isValidPassword ? null : "Password is too short",
          onChanged: (value) => context
              .read<LoginBloc>()
              .add(LoginPasswordChanged(password: value)),
        );
      },
    );
  }

  Widget _userNameField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        print(state);
        return TextFormField(
          decoration:
              InputDecoration(icon: Icon(Icons.person), hintText: "Username"),
          validator: (value) =>
              state.isValidUserName ? null : "Username is too short",
          onChanged: (value) => context
              .read<LoginBloc>()
              .add(LoginUsernameChanged(username: value)),
        );
      },
    );
  }

  Widget _signInButton() {
    return BlocConsumer<LoginBloc, LoginState>(builder: (context, state) {
      if (state.formSubmissionStatus is FormSubmitting)
        return CircularProgressIndicator();
      return ElevatedButton(
        onPressed: () {
          // if (_formKey.currentState!.validate()) {
          context.read<LoginBloc>().add(LoginSubmitted(
              username: usernameController.text,
              password: passwordController.text));
          // }
        },
        child: Text("Login"),
      );
    }, listener: (context, state) {
      if (state.formSubmissionStatus is SubmissionSuccess) {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                    value: BlocProvider.of<LoginBloc>(context),
                    child: UserDetail(),
                  )),
        );
      }
    });
  }
}
