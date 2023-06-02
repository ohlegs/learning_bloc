import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/bloc/counter_bloc.dart';
import 'package:learning_bloc/constants/constants.dart';
import 'package:learning_bloc/model/list_item_model.dart';
import 'package:learning_bloc/utils/time_converter.dart';
import 'package:learning_bloc/utils/custom_timer.dart';
import 'package:vibration/vibration.dart';

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
  String? selectedDate;
  num compleedProcent = 0;
  final GlobalKey _containerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    List<String> timeParts = widget.dataTask.selectedTime!.split(":");
    final int hours = int.parse(timeParts[0]);
    final int minutes = int.parse(timeParts[1]);

    timeConverter.deadlineTime = widget.dataTask.selectedTime!;
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
              colors: [
                const Color.fromARGB(255, 64, 228, 70),
                colors[widget.dataTask.colorTask as int]
              ]),
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
                          color: compleedProcent >= 11
                              ? const Color.fromARGB(255, 64, 228, 70)
                              : colors[widget.dataTask.colorTask as int]),
                      widget.dataTask.nameTask!.length < 15
                          ? widget.dataTask.nameTask ?? ''
                          : '${widget.dataTask.nameTask!.substring(0, 15)}...',
                    )),
              ),
              const Spacer(),
              Text(
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  'Completed on: ${compleedProcent.toDouble().toStringAsFixed(2)}%')
            ]),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 50,
                    onPressed: () {
                      playButton();
                    },
                    icon: pause
                        ? compleedProcent == 100
                            ? Icon(Icons.check)
                            : Icon(Icons.play_circle)
                        : const Icon(Icons.pause_circle)),
                const Spacer(),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(
                    children: [
                      const Icon(Icons.watch_later_outlined),
                      Text(
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          " ${hours.toString().padLeft(2, '0')}h:${minutes.toString().padLeft(2, '0')}m"),
                    ],
                  ),
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
    selectedDate = widget.dataTask.selectedTime;
    super.initState();
  }

  playButton() {
    if (pause == true) {
      if (compleedProcent != 100) {
        widget.customTimer.startTimer(setProcent);
        setState(() {
          pause = false;
          // widget.customTimer.tick = 30;
        });
      }
    } else {
      widget.customTimer.stopTimer();
      setState(() {
        pause = true;
      });
    }
  }

  setProcent(tick) {
    widget.timeConverter.deadlineTime = widget.dataTask.selectedTime!;
    if (compleedProcent == 100) {
      widget.customTimer.stopTimer();
      setState(() {
        pause = true;
      });
    } else {
      setState(() {
        compleedProcent = widget.timeConverter.getProcentFromTime(tick);
        print(compleedProcent);
      });
    }
  }

  _removeOnLongPress({required currentIndex}) async {
    Vibration.vibrate(duration: 100);
    await showDialog<num>(
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
                    Navigator.of(context).pop();
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
                  Text(fullView.descriptionTask ?? ""),
                ],
              ),
            ));
  }
}
