import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    String bgimg = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    //Color bgcolor = data['isDaytime'] ? Colors.blue : Colors.indigo;
    return Scaffold(
      //backgroundColor: bgcolor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('asset/images/$bgimg'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location': result['location'],
                      'isDaytime': result['isDaytime'],
                      'flag': result['flag'],
                    };
                  });
                },
                icon: const Icon(
                  Icons.edit_location,
                  color: Colors.grey,
                ),
                label: const Text('Edit Location'),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: const TextStyle(
                        fontSize: 28, letterSpacing: 2.0, color: Colors.lime),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Text(
                data['time'],
                style: const TextStyle(
                  fontSize: 66,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
