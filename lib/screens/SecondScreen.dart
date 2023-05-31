import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/bloc/counter_bloc.dart';
import 'package:learning_bloc/constants/constants.dart';
import 'package:learning_bloc/model/list_item_model.dart';
import 'package:learning_bloc/repositories/data_base.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final _formKey = GlobalKey<FormState>();
  final DBController db = DBController();
  final nameInputController = TextEditingController();
  final descriptionInputController = TextEditingController();
  final dateTimeInputConttroller = TextEditingController();
  late int _selectedRadio;

  String _stateValueInputName = '';
  String _stateValueInputDescription = '';
  num _selectedMinutes = 00;
  num _selectedHours = 00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text("Add task"),
        actions: [
          IconButton(
              color: Colors.green,
              disabledColor: Colors.grey,
              tooltip: "Add task",
              enableFeedback: true,
              onPressed: _stateValueInputName != '' &&
                      _stateValueInputDescription != ''
                  ? () {
                      _submit();
                    }
                  : null,
              icon: const Icon(Icons.check))
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Material(
                        elevation: 0,
                        child: Wrap(
                          spacing: 5,
                          direction: Axis.horizontal,
                          children: <Widget>[
                            Radio(
                                value: 0,
                                activeColor: Colors.amber,
                                fillColor: MaterialStatePropertyAll(colors[0]),
                                groupValue: _selectedRadio,
                                onChanged: (val) {
                                  _setSelectRadio(val);
                                }),
                            Radio(
                                value: 1,
                                fillColor: MaterialStatePropertyAll(colors[1]),
                                groupValue: _selectedRadio,
                                onChanged: (val) {
                                  _setSelectRadio(val);
                                }),
                            Radio(
                                value: 2,
                                fillColor: MaterialStatePropertyAll(colors[2]),
                                groupValue: _selectedRadio,
                                onChanged: (val) {
                                  _setSelectRadio(val);
                                }),
                            Radio(
                                value: 3,
                                fillColor: MaterialStatePropertyAll(colors[3]),
                                groupValue: _selectedRadio,
                                onChanged: (val) {
                                  _setSelectRadio(val);
                                }),
                            Radio(
                                value: 4,
                                fillColor: MaterialStatePropertyAll(colors[4]),
                                groupValue: _selectedRadio,
                                onChanged: (val) {
                                  _setSelectRadio(val);
                                }),
                            Radio(
                                value: 5,
                                fillColor: MaterialStatePropertyAll(colors[5]),
                                groupValue: _selectedRadio,
                                onChanged: (val) {
                                  _setSelectRadio(val);
                                }),
                            Radio(
                                value: 6,
                                fillColor: MaterialStatePropertyAll(colors[6]),
                                groupValue: _selectedRadio,
                                onChanged: (val) {
                                  _setSelectRadio(val);
                                }),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      height: 90,
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            _stateValueInputName = value;
                          });
                        },
                        controller: nameInputController,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.assignment_add),
                          enabledBorder: UnderlineInputBorder(),
                          label: Text("Enter the name task"),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      height: 150,
                      child: TextFormField(
                        maxLines: 10,
                        maxLength: 1000,
                        onChanged: (value) {
                          setState(() {
                            _stateValueInputDescription = value;
                          });
                        },
                        controller: descriptionInputController,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(),
                          label: Text("Enter the description task"),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      height: 150,
                      child: TextFormField(
                        enableInteractiveSelection: false,
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        maxLines: 1,
                        readOnly: true,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        controller: dateTimeInputConttroller,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                _showMyDialog();
                              },
                              icon: const Icon(
                                  color: Colors.black, Icons.edit_calendar)),
                          enabledBorder: const UnderlineInputBorder(),
                          label: const Text("Time for the task"),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              )),
        ],
      )),
    );
  }

  Future<void> _showMyDialog() async {
    final String? result = await showDialog(
      useSafeArea: true,
      context: context,
      builder: (context) {
        TextEditingController controllerHours =
            TextEditingController(text: "00");
        TextEditingController controllerMinutes =
            TextEditingController(text: "00");

        return AlertDialog(
          title: const Text('Set the time to complete the task.'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: controllerHours,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text("Hours"), border: OutlineInputBorder()),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: TextField(
                    controller: controllerMinutes,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        label: Text("Minutes"), border: OutlineInputBorder()),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                child: const Text('Set'),
                onPressed: () async {
                  Navigator.pop(context,
                      "${controllerHours.text}:${controllerMinutes.text}");
                }),
          ],
        );
      },
    );
    if (result != null) {
      List<String> timeParts = result.split(':');
      setState(() {
        _selectedHours = int.parse(timeParts[0]);
        _selectedMinutes = int.parse(timeParts[1]);
      });
      dateTimeInputConttroller.text =
          "${_selectedHours.toString().padLeft(2, '0')}h:${_selectedMinutes.toString().padLeft(2, '0')}m";
    }
  }

  @override
  void initState() {
    print("LOLOLO");
    print(_selectedHours);
    dateTimeInputConttroller.text =
        "${_selectedHours.toString().padLeft(2, '0')}h:${_selectedMinutes.toString().padLeft(2, '0')}m";
    setState(() {
      _selectedRadio = 0;
    });
    super.initState();
  }

  _setSelectRadio(val) {
    setState(() {
      _selectedRadio = val;
    });
  }

  _submit() {
    final bloc = BlocProvider.of<ListBloc>(context);
    final ItemListModel resultData = ItemListModel(
        complitedTime: "null",
        descriptionTask: _stateValueInputDescription,
        nameTask: _stateValueInputName,
        selectedTime: "${_selectedHours}:${_selectedMinutes}",
        colorTask: _selectedRadio,
        createDate: DateTime.now().toString());
    bloc.add(ListNewTask(listNewTask: resultData));
    if (_formKey.currentState!.validate()) {
      _clearForm();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.greenAccent.shade400,
          content: Row(
            children: [
              const Text(
                "Added",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Icon(
                  Icons.check,
                  color: Colors.greenAccent.shade400,
                ),
              )
            ],
          ),
        ),
      );
    }
  }

  _clearForm() {
    nameInputController.clear();
    descriptionInputController.clear();
    setState(() {
      _stateValueInputDescription = '';
      _stateValueInputName = '';
    });
  }
}
