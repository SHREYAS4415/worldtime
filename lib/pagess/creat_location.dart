import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wt/services/world_time.dart';

class creat_location extends StatefulWidget {
  const creat_location({super.key});

  @override
  State<creat_location> createState() => _creat_locationState();
}

class _creat_locationState extends State<creat_location> {
List<WorldTime> locations =[
  WorldTime(url: 'Europe/London',location: 'London',flage: 'uk.png'),
  WorldTime(url: 'America/Chicago',location: 'Amarica',flage: 'Amrica.png'),
  WorldTime(url: 'Africa/Cairo',location: 'Cairo',flage: 'egypt.png'),
  WorldTime(url: 'Africa/Nairobi',location: 'Nairobi',flage: 'kenya.png'),

];
 void updateTime(index) async{
   WorldTime instance =locations[index];
   await instance.getTime();
   // naviate to home screen
   Navigator.pop(context,
   {

     'location':instance.location,
     'flag':instance.flage,
     'time':instance.time,
     'isDaytime':instance.isDaytime,
   }
   );

 }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar:AppBar(title: Text('hii'),
      elevation: 0,
      centerTitle: true,


      ),
        body: ListView.builder(itemCount: locations.length,
      itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){

                  updateTime(index);
                },
                title: Text(locations[index].location),


              ),
            ),
          );

      }
    ),


    );
  }
}
