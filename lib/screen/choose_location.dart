import 'package:flutter/material.dart';

import '../world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'Bengaluru', flag: 'india.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'Mumbai', flag: 'india.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'Jaipur', flag: 'india.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'Lucknow', flag: 'india.png'),
  ];
  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(
      context,{
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime':instance.isDaytime,
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(title: const Text('Choose Location'), centerTitle: true),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 4.0,
              vertical: 1.0,
            ),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(
                  locations[index].location,
                ),
                leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('asset/images/${locations[index].flag}')),
              ),
            ),
          );
        },
      ),
    );
  }
}
