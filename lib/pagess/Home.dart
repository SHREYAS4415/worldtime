
import 'package:flutter/material.dart';

class Home extends StatefulWidget {


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data ={};
  @override

  Widget build(BuildContext context) {
    data=data.isNotEmpty?data:ModalRoute.of(context)?.settings.arguments as Map;
    print(data);
    //set background;
    String bgImage = data['isDaytime']?'img.png':'img_1.png';
    Color? bgColor =data['isDaytime']?Colors.blue:Colors.indigo[700];
    return Scaffold(
      backgroundColor:bgColor ,

      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/$bgImage'),
        fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center ,

          children: [

            SizedBox(height:20.0),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(icon: Icon(Icons.edit_location), label: Text('location:'+data['location'],

                    style: TextStyle(
                      fontSize: 29.0,
                      letterSpacing: 2.0,
                      color: Colors.grey,
                    ),
                  ), onPressed: () async{
                    dynamic result=await Navigator.pushNamed(context, '/creat_location');
                    setState(() {
                      data={
                       'time':result['time'],
                        'location':result['location'],
                        'isDaytime':result['isDaytime'],
                        'flage':result['flage'],
                      };
                    });
                  },),

                  SizedBox(height:20.0),
                  Text('Time:'+data['time'],
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 49.0,
                      letterSpacing: 2.0,
                    ),)
                ],
              ),
            )

          ],
        ),
      ),

    );
  }
}
