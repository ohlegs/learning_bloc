class TimeConverter {
  late int _hours;
  late int _minutes;
  late num procent;
  late num allSeconds;

  set deadlineTime(String deadlineTime) {
    if (deadlineTime != null) {
      List<String> timeParts = deadlineTime.split(':');
      final int hours = int.parse(timeParts[0]);
      final int minutes = int.parse(timeParts[1]);
      _hours = hours;
      _minutes = minutes;
    }
    getSecond();
  }

  getSecond() {
    if (_hours != null && _minutes != null) {
      print('_hours: $_hours _minutes: $_minutes');

      allSeconds = (_hours * 60 * 60) + (_minutes * 60);
    }
  }

  num getProcentFromTime(num tick) {
    final coefficient = allSeconds / tick;
    final procent = 100 / coefficient;
    this.procent = procent;
    print('allSeconds: ${allSeconds} procent: ${procent}');
    return double.parse(procent.toStringAsFixed(2));
  }

  num procentToNumber(int width) {
    final procent = this.procent;
    final coefficient = width / 100;
    return (coefficient * procent).toInt();
  }
}
