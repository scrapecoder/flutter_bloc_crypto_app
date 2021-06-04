import 'package:blocpattern/bloc/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _userDetails(),
    );
  }

  Widget _userDetails() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Column(
          children: [
            Text("Logged user details"),
            Text(state.password),
            Text(state.password)
          ],
        );
      },
    );
  }
}
