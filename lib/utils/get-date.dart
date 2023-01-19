import 'package:intl/intl.dart';

getFormatedDate(_date) {
  var d = _date.toString().split('T')[0];
  var d1 = _date.toString().split('T')[1].split(':')[0] +
      ':' +
      _date.toString().split('T')[1].split(':')[1];
  var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
  var inputDate = inputFormat.parse(d + ' ' + d1);
  var outputFormat = DateFormat('dd-MM-yyyy HH:mm');
  return DateFormat.yMEd().add_jms().format(inputDate);
}

detFormatedDateWithhouTime(_date, int langue) {
  var d = _date.toString().split('T')[0];
  var d1 = _date.toString().split('T')[1].split(':')[0] +
      ':' +
      _date.toString().split('T')[1].split(':')[1];
  var inputFormat = DateFormat('yyyy-MM-dd');
  var inputDate = inputFormat.parse(d);
  print(inputDate);
  var outputFormat = DateFormat('dd-MM-yyyy');
  return langue == 1
      ? '${DateFormat.E().format(inputDate)},${DateFormat.d().format(inputDate)}/${DateFormat.M().format(inputDate)}/${DateFormat.y().format(inputDate)}'
      : '${DateFormat.d().format(inputDate)}/${DateFormat.M().format(inputDate)}/${DateFormat.y().format(inputDate)}';
}

getFormatedDateLiv(_date) {
  var d = _date.toString().split('T')[0];
  var d1 = _date.toString().split('T')[1].split(':')[0] +
      ':' +
      _date.toString().split('T')[1].split(':')[1];
  var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
  var inputDate = inputFormat.parse(d + ' ' + d1);
  var outputFormat = DateFormat('dd-MM-yyyy HH:mm');
  return DateFormat.yMEd().add_jms().format(inputDate.add(Duration(days: 10)));
}
