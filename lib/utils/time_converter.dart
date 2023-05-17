class TimeConverter {
  late DateTime _time;
  late String _date;
  late String _dateCreate;
  late num procent;
  TimeConverter();

  set time(timeStr) {
    DateTime dt;

    if (timeStr != null) {
      List<String> timeParts = timeStr.split(':');
      final int hours = int.parse(timeParts[0]);
      final int minutes = int.parse(timeParts[1]);
      dt = DateTime(2022, 1, 1, hours, minutes);
      _time = dt;
    } else {
      throw Exception("DateTime.tryParse == false");
    }
  }

  set date(String dateStr) {
    _date = dateStr;
  }

  set dateCreate(String dateStr) {
    _dateCreate = dateStr;
  }

  String get dateCreate => _dateCreate;
  DateTime get time => _time;
  String get date => _date;

  int getSecond() {
    if (_time != null) {
      return _time.hour * 60 * 60 + _time.minute;
    }
    throw Exception("Invalid state: _time is $_time");
  }

  num getProcentFromTime(num tick) {
    final allSeconds = dateDifference();
    print(allSeconds);
    final coefficient = allSeconds / tick;
    final procent = 100 / coefficient;
    this.procent = procent;
    print('allSeconds: ${allSeconds} procent: ${procent}');
    return double.parse(procent.toStringAsFixed(2));
  }

  dateDifference() {
    if (DateTime.tryParse(date) != null) {
      Duration difference =
          DateTime.parse(date).difference(DateTime.parse(dateCreate));

      return difference.inSeconds + getSecond();
    }
  }

  num procentToNumber(int width) {
    final procent = this.procent;
    final coefficient = width / 100;
    return (coefficient * procent).toInt();
  }
}
