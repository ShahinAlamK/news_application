import 'package:timeago/timeago.dart'as timeago;
import 'package:intl/intl.dart';

//const String apikey="3120fffd5de5418796fbab343da2dacc";
const String apikey="fac3ddb22c714826821e6f6955048ba2";
const String baseUrl="https://newsapi.org/v2/";

dateFormat(date){
  return DateFormat.yMMMMd().format(date);
}

agoTimeByDate(date){
  return timeago.format(date);
}