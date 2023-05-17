import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/bloc/counter_bloc.dart';
import 'package:learning_bloc/constants/constants.dart';
import 'package:learning_bloc/model/list_item_model.dart';
import 'package:learning_bloc/utils/time_converter.dart';
import 'package:learning_bloc/utils/custom_timer.dart';

class ItemList extends StatefulWidget {
  final ItemListModel dataTask;
  num itemIndex = 0;
  CustomTimer customTimer = CustomTimer();
  TimeConverter timeConverter = TimeConverter();
  ItemList({Key? key, required this.dataTask, required this.itemIndex})
      : super(key: key);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  bool pause = true;
  TimeConverter timeConverter = TimeConverter();
  DateTime? selectedDate;
  num compleedProcent = 0;
  GlobalKey _containerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // double? containerWidth = _containerKey.currentContext?.size?.width;

    timeConverter.time = widget.dataTask.selectedTime;
    return GestureDetector(
      onLongPress: () {
        final num currentIndex = widget.itemIndex;
        _removeOnLongPress(currentIndex: currentIndex);
      },
      onTap: () {
        _showModalBottomSheet(fullView: widget.dataTask);
      },
      child: Container(
        key: _containerKey,
        height: 140,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [compleedProcent.toDouble() / 100, 0.0],
              tileMode: TileMode.clamp,
              colors: [Colors.green, colors[widget.dataTask.colorTask as int]]),
          borderRadius: const BorderRadius.all(Radius.circular(29)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 50),
                child: Container(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 6, bottom: 6),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromRGBO(72, 68, 78, 1)),
                    child: Text(
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: colors[widget.dataTask.colorTask as int]),
                        widget.dataTask.nameTask.length < 15
                            ? widget.dataTask.nameTask
                            : '${widget.dataTask.nameTask.substring(0, 15)}...')),
              ),
              const Spacer(),
              Text(
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  'Completed on: ${compleedProcent.toDouble().toStringAsFixed(2)}%')
            ]),
            const Spacer(),
            Row(
              children: [
                IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 50,
                    onPressed: () {
                      playButton();
                    },
                    icon: pause
                        ? const Icon(Icons.play_circle)
                        : const Icon(Icons.pause_circle)),
                const Spacer(),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(
                    children: [
                      const Icon(Icons.watch_later_outlined),
                      Text(
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          ' ${widget.dataTask.selectedTime}'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.calendar_month),
                      Text(
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          ' ${selectedDate!.day} ${months[selectedDate!.month]} ${selectedDate!.year}')
                    ],
                  )
                ])
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    selectedDate = DateTime.parse(widget.dataTask.selectedDate);

    super.initState();
  }

  playButton() {
    if (pause == true) {
      widget.customTimer.startTimer(setProcent);
      setState(() {
        pause = false;
      });
    } else {
      widget.customTimer.stopTimer();
      setState(() {
        pause = true;
      });
    }
  }

  setProcent(tick) {
    widget.timeConverter.time = widget.dataTask.selectedTime;
    widget.timeConverter.date = widget.dataTask.selectedDate;
    widget.timeConverter.dateCreate = widget.dataTask.createDate;
    double? containerWidth = _containerKey.currentContext?.size?.width;
    setState(() {
      compleedProcent = widget.timeConverter.getProcentFromTime(tick);
    });
  }

  _removeOnLongPress({required currentIndex}) async {
    final result = await showDialog<num>(
      context: context,
      builder: (context) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AlertDialog(
            title: const Text(
                style: TextStyle(color: Colors.white),
                "Delete the selected task"),
            backgroundColor: colors[3],
            actions: [
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                  label: const Text('Cancel')),
              ElevatedButton.icon(
                  onPressed: () {
                    final bloc = BlocProvider.of<ListBloc>(context);
                    bloc.add(RemoveTask(removeByIndex: currentIndex));
                  },
                  icon: const Icon(Icons.delete_forever),
                  label: const Text('Delete')),
            ],
          )),
    );
  }

  _showModalBottomSheet({required ItemListModel fullView}) {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (_) => Container(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 10,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade600,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                      ),
                    ],
                  ),
                  Text(fullView.descriptionTask),
                ],
              ),
            ));
  }
}
