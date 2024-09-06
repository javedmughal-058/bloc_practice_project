import 'package:bloc_practice_project/bloc/counter/counter_bloc.dart';
import 'package:bloc_practice_project/bloc/counter/counter_event.dart';
import 'package:bloc_practice_project/bloc/counter/counter_state.dart';
import 'package:bloc_practice_project/ui/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, title: 'Counter Page'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state){
            return Text('Counter ${state.counter}');
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                context.read<CounterBloc>().add(IncrementCounter());
                }, child: const Icon(Icons.add)),
              ElevatedButton(onPressed: (){
                context.read<CounterBloc>().add(DecrementCounter());
                }, child: const Icon(Icons.remove)),
            ],
          ),
        ],
      ),
    );
  }
}
