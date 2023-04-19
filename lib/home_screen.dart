import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/counter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: BlocBuilder<CounterBloc, List>(
        builder: (context, count) {
          return ListView.builder(
            itemCount: count.length,
            itemBuilder: (context, index) => Text('231'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                    child: TextButton(
                        onPressed: () {
                          context
                              .read<CounterBloc>()
                              .add(CounterIncrementPressed());
                        },
                        child: Text('ADD')),
                  ));
        },
      ),
    );
  }
}
