import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:learning_bloc/bloc/counter_bloc.dart';

class AlertDialogSort extends StatefulWidget {
  num selectedSortMode = 0;

  AlertDialogSort({Key? key, required this.selectedSortMode}) : super(key: key);

  @override
  _AlertDialogSortState createState() => _AlertDialogSortState();
}

class _AlertDialogSortState extends State<AlertDialogSort> {
  num selectedSortMode = 0;

  @override
  void initState() {
    selectedSortMode = widget.selectedSortMode;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ListBloc>(context);
    return AlertDialog(
      title: const Text('Sort by'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: GestureDetector(
                onTap: () {
                  _selectSortMode(sortMode: 0, bloc: bloc);
                },
                child: Row(
                  children: [
                    const Icon(Icons.calendar_month),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: const Text(
                        'Due date',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Icon(
                        color: selectedSortMode == 0
                            ? Colors.green.shade300
                            : Colors.transparent,
                        Icons.check)
                  ],
                )),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: GestureDetector(
                onTap: () {
                  _selectSortMode(sortMode: 1, bloc: bloc);
                },
                child: Row(
                  children: [
                    const Icon(Icons.sort_by_alpha),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: const Text(
                        'A-Z',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Icon(
                        color: selectedSortMode == 1
                            ? Colors.green.shade300
                            : Colors.transparent,
                        Icons.check)
                  ],
                )),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: GestureDetector(
                onTap: () {
                  _selectSortMode(sortMode: 2, bloc: bloc);
                },
                child: Row(
                  children: [
                    const Icon(Entypo.progress_0),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: const Text(
                        'Least progress',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Icon(
                        color: selectedSortMode == 2
                            ? Colors.green.shade300
                            : Colors.transparent,
                        Icons.check)
                  ],
                )),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: GestureDetector(
                onTap: () {
                  _selectSortMode(sortMode: 3, bloc: bloc);
                },
                child: Row(
                  children: [
                    const Icon(Entypo.progress_3),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: const Text(
                        'Most progress',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Icon(
                        color: selectedSortMode == 3
                            ? Colors.green.shade300
                            : Colors.transparent,
                        Icons.check)
                  ],
                )),
          ),
        ],
      ),
    );
  }

  _selectSortMode({required num sortMode, required bloc}) {
    setState(() {
      selectedSortMode = sortMode;
    });
    bloc.add(SortListBy(typeSort: sortMode as int));
    Navigator.of(context).pop(sortMode);
  }
}
