import 'package:intl/intl.dart';

var time, date;
getDateTime() async{
  time = DateFormat('KK:mm a').format(DateTime.now());
  date = DateFormat('MMMM d, yyyy').format(DateTime.now());
}