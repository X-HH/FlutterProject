import 'dart:core';

class diaryitem {
  String content;
  String time;
  String year;
  String month;
  String day;
  String week;
  String hourSecond;

  diaryitem(diarycontent, diarytime) {
    this.content = diarycontent;
    this.time = diarytime;

    var now = DateTime.fromMillisecondsSinceEpoch(int.parse(diarytime));
    this.year = now.year.toString();
    this.month = '${now.month.toString()}月';
    String day = now.day.toString();
    if (int.parse(day) < 10) {
      day = '0${day}';
    }
    this.day = day;
    String week = now.weekday.toString();
    this.week = coverWeekToStrWeek(int.parse(week));
    this.hourSecond = '${now.hour.toString()}:${now.second.toString()}';
  }

  String coverWeekToStrWeek(int week) {
    String weekStr = '周一';
    switch (week) {
      case 1:
        weekStr = '周一';
        break;
      case 2:
        weekStr = '周二';
        break;
      case 3:
        weekStr = '周三';
        break;
      case 4:
        weekStr = '周四';
        break;
      case 5:
        weekStr = '周五';
        break;
      case 6:
        weekStr = '周六';
        break;
      case 7:
        weekStr = '周日';
        break;
      default:
    }
    return weekStr;
  }
}