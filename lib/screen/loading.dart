import 'package:flutter/material.dart';
import 'package:world_time/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //String time = 'loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Bengaluru', flag: 'kolkata.png', url: 'Asia/Kolkata');
    await instance.getTime();
    // setState(() {
    //   time = instance.time;
    // });
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime':instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
