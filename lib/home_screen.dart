import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/blocs/home_cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<HomeCubit>().updateInfo(
              value: "lol",
              length: context.read<HomeCubit>().state.productItems.length);
        },
      ),
      backgroundColor: Colors.white,
      body: Column(children: [
        SizedBox(
          height: 350,
          child: BlocBuilder<HomeCubit, HomeCubitState>(
            builder: (context, state) => state.maybeMap(
                init: (initState) => ListView.builder(
                    itemCount: initState.productItems.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        child: Text(initState.productItems[index] ?? ''),
                      );
                    }),
                orElse: () => SizedBox()),
          ),
        )
      ]),
    );
  }
}
