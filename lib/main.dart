import 'package:bloc_practice_project/bloc/counter_example/counter_bloc.dart';
import 'package:bloc_practice_project/bloc/image_picker_example/image_picker_bloc.dart';
import 'package:bloc_practice_project/bloc/localization/localization_bloc.dart';
import 'package:bloc_practice_project/bloc/news/news_bloc.dart';
import 'package:bloc_practice_project/screens/home_page.dart';
import 'package:bloc_practice_project/services/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/localization/localization_state.dart';
import 'bloc/switch_example/switch_bloc.dart';
import 'bloc/todo_example/todo_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
        BlocProvider(create: (context) => ImagePickerBloc()),
        BlocProvider(create: (context) => TodoBloc()),
        BlocProvider(create: (context) => LocalizationBloc()),
        BlocProvider(create: (context) => NewsBloc()),
      ],
      child: BlocBuilder<LocalizationBloc, LocalizationState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            locale: state.locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: context.read<LocalizationBloc>().supportedLocales,
            theme: ThemeData(
                primaryColor: Colors.cyan,
                secondaryHeaderColor: Colors.amber,
                dividerColor: Colors.white,
                useMaterial3: true,
                brightness: Brightness.dark
            ),
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
