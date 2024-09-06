import 'package:bloc_practice_project/bloc/counter/counter_bloc.dart';
import 'package:bloc_practice_project/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/switch_example/switch_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider (create: (context) => CounterBloc()),
        BlocProvider (create: (context) => SwitchBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.cyan,
          secondaryHeaderColor: Colors.amber,
          dividerColor: Colors.white,
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
