import 'package:flutter/material.dart';

extension MyDateTime on DateTime {

  String asString({bool addYear = false, bool addWeekDay = false, bool addMonth = true, bool addTime = false}) {
    StringBuffer buffer = StringBuffer();
    if(addTime){
      if(hour < 10){
        buffer.write('0$hour');
      }
      if(hour > 9){
        buffer.write(hour);
      }
      buffer.write(":");
      if(minute < 10){
        buffer.write('0$minute');
      }
      if(minute > 9){
        buffer.write(minute);
      }
      buffer.write(' ');
    }
    if(addWeekDay){
      buffer.write('${_weekday[weekday]}, ');
    }
    buffer.write(_days[day]);
    if(addMonth){
      buffer.write(' ${_months[month]}');
    }
    if(addYear){
      buffer.write(' $year');
    }
    return buffer.toString();
  }
}

List<String> _weekday = [
  'none',
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat',
  'Sun'
];

List<String> _months = [
  'none',
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec'
];

List<String> _days = [
  'none',
  '1st',
  '2nd',
  '3rd',
  '4th',
  '5th',
  '6th',
  '7th',
  '8th',
  '9th',
  '10th',
  '11th',
  '12th',
  '13th',
  '14th',
  '15th',
  '16th',
  '17th',
  '18th',
  '19th',
  '20th',
  '21st',
  '22nd',
  '23rd',
  '24th',
  '25th',
  '26th',
  '27th',
  '28th',
  '29th',
  '30th',
  '31st'
];