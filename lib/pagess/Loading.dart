
import 'package:wt/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});


  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  setupWorldTime() async {
   WorldTime instance = WorldTime(location: 'Banglore', flage: 'India', url:'Asia/Kolkata');
   await instance.getTime();
  Navigator.pushReplacementNamed(context, '/home',arguments:
  {
    'location':instance.location,
    'flag':instance.flage,
    'time':instance.time,
    'isDaytime':instance.isDaytime,
  });




 }


  void initState()
  {
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(

        child:SpinKitRotatingCircle(
          color: Colors.white,
          size: 70.0,
        ),
      ),

    );
  }
}
