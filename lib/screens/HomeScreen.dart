import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/bloc/counter_bloc.dart';
import 'package:learning_bloc/repositories/data_base.dart';
// import 'package:learning_bloc/bloc/list_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DBController db = DBController();

  @override
  void initState() {
    db.getTask();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_task_outlined), onPressed: () {}),
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                context.read<ListBloc>().add(ListAdd());
              },
              child: Text("PRESS")),
          BlocBuilder<ListBloc, CounterBlocState>(
            builder: (context, state) {
              return Expanded(
                  child: ListView.builder(
                key: UniqueKey(),
                itemCount: state.counter.length,
                itemBuilder: (context, index) => Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      gradient: LinearGradient(
                          begin: const FractionalOffset(0.0, 0.0),
                          end: FractionalOffset(
                              1.0, state.counter[index].toDouble() / 10),
                          stops: const [
                            0.0,
                            1.0
                          ],
                          colors: [
                            Colors.blueAccent.shade700,
                            Colors.transparent
                          ])),
                ),
              ));
            },
          )
        ],
      ),
    );
  }
}
