import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/bloc/counter_bloc.dart';
import 'package:learning_bloc/model/list_item_model.dart';
import 'package:learning_bloc/repositories/data_base.dart';
import 'package:learning_bloc/widgets/Item_list.dart';
import 'package:learning_bloc/widgets/modal_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DBController db = DBController();
  final ScrollController _scrollController = ScrollController();
  num selectedSortMode = 0;
  bool isLoad = true;
  bool sizeAppBar = true;
  @override
  void initState() {
    _initState();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111c2f),
      floatingActionButton: isLoad
          ? FloatingActionButton(
              backgroundColor: const Color(0xFF111c2f),
              child: const Icon(color: Colors.white, Icons.add_task_outlined),
              onPressed: () {
                _addTask();
              })
          : null,
      body: isLoad
          ? BlocBuilder<ListBloc, ListBlocState>(
              builder: (context, state) {
                return Stack(
                  children: [
                    ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.only(top: 160),
                        primary: false,
                        shrinkWrap: true,
                        itemCount: state.list.length,
                        itemBuilder: (context, index) {
                          return ItemList(
                              dataTask: state.list[index], itemIndex: index);
                        }),
                    AnimatedPositioned(
                        curve: Curves.fastOutSlowIn,
                        duration: const Duration(milliseconds: 300),
                        top: 0,
                        left: 0,
                        right: 0,
                        height: sizeAppBar ? 150 : 56 + 24,
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 24, left: 20, right: 20),
                          decoration: const BoxDecoration(
                              color: const Color(0xFF111c2f),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(29),
                                  bottomRight: Radius.circular(29))),
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 30),
                                    'All task :${state.list.length}'),
                                const Spacer(),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      hoverColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      child: const Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Icon(
                                          color: Colors.white,
                                          Icons.tune,
                                        ),
                                      ),
                                      onTap: () {
                                        _showDialog();
                                      },
                                    ),
                                  ),
                                )
                              ],
                            )
                          ]),
                        ))
                  ],
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  _initState() async {
    _scrollController.addListener(() {
      if (_scrollController.offset > 50 && sizeAppBar == true) {
        setState(() {
          sizeAppBar = false;
        });
      } else if (_scrollController.offset <= 50 && sizeAppBar == false) {
        setState(() {
          sizeAppBar = true;
          _scrollController.animateTo(0,
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 270));
        });
      }
    });

    final List<ItemListModel> getTask = await db.getTask();
    final bloc = BlocProvider.of<ListBloc>(context);
    bloc.add(ListStateInit(taskList: getTask));
    if (getTask.isNotEmpty) {
      setState(() {
        isLoad = true;
      });
    }
  }

  _showDialog() async {
    final result = await showDialog<num>(
      context: context,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: AlertDialogSort(
            key: GlobalKey(), selectedSortMode: selectedSortMode),
      ),
    );

    if (result != null) {
      setState(() {
        selectedSortMode = result;
      });
    }
  }

  _addTask() {
    Navigator.pushNamed(context, '/secondScreen');
  }
}
