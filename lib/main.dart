import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:learning_bloc/bloc/counter_bloc.dart';
import 'package:learning_bloc/screens/HomeScreen.dart';
import 'package:learning_bloc/screens/SecondScreen.dart';

void main(List<String> args) async {
  await Hive.initFlutter();
  runApp(
    BlocProvider(
      create: (context) => ListBloc(),
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        routes: {
          '/': (context) => const HomeScreen(),
          '/secondScreen': (context) => const SecondScreen()
        },
      ),
    ),
  );
}
