import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime{
     late String location;
    late String time;
    late String flage;
     late String url;
     late bool isDaytime;

     WorldTime({required this.location,required this.flage,required this.url});
    Future<void> getTime() async
     {
      try {
        Response response = await get(
            Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
        Map data = jsonDecode(response.body);
        String datetime = data['datetime'];
        String offset = data['utc_offset'];
        DateTime now = DateTime.parse(datetime);
        now=now.add(Duration(hours: int.parse(offset.substring(1,3)),minutes:int.parse(offset.substring(4,6))));
        //set the time property
        isDaytime = now.hour>6&&now.hour<13? true:false;
        time = DateFormat.jm().format(now);
      }
      catch(e){
        print('caught error:$e');
        time='could  not get time';
      }


     }

}

