import 'package:blocpattern/bloc/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      fontSize: 50,
    );
    return Center(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                context.read<CounterCubit>().increment();
              },
              child: Container(
                alignment: Alignment.center,
                width: 80,
                height: 80,
                child: Text(
                  '+',
                  style: textStyle,
                ),
              ),
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                SnackBar snackbar;
                if (state.isIncremented) {
                  snackbar = SnackBar(
                    content: Text("Incremented"),
                    duration: Duration(milliseconds: 300),
                  );
                } else {
                  snackbar = SnackBar(
                    content: Text("decremented"),
                    duration: Duration(milliseconds: 300),
                  );
                }
                Scaffold.of(context).showSnackBar(snackbar);
              },
              builder: (context, state) {
                return Container(
                  height: 80,
                  width: 80,
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue[300],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: BlocBuilder<CounterCubit, CounterState>(
                    builder: (context, state) {
                      return Text(
                        state.counterVaue.toString(),
                        style: textStyle,
                      );
                    },
                  ),
                );
              },
            ),
            Container(
              width: 80,
              height: 80,
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  context.read<CounterCubit>().decrement();
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 80,
                  height: 80,
                  child: Text(
                    '-',
                    style: textStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
