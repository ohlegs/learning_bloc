import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/blocs/home_cubit/home_cubit.dart';
import 'package:learning_bloc/home_screen.dart';
import 'package:learning_bloc/repositories/info_repository.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>(
              create: (context) => HomeCubit(InfoRepository()))
        ],
        child: MaterialApp(
          home: HomeScreen(),
        ));
  }
}
