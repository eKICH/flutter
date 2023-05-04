import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Receive the data from loading page
  Map data = {};

  @override
  Widget build(BuildContext context) {
    //Receive the arguments
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
      backgroundColor: Colors.indigo[900],
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          dynamic result = await Navigator.pushNamed(context, '/location');
          setState(() {
            data = {
              'location': result['location'],
              'time': result['time'],
              'flag': result['flag'],
              'isDayTime': result['isDayTime']
            };
          });
        },
        label: const Text(
          'Edit Location',
          style: TextStyle(
            letterSpacing: 2.0,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.indigo[600],
        icon: const Icon(Icons.edit_location),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage(
                        'assets/${data['flag']}',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Text(
                data['location'],
                style: TextStyle(
                    color: Colors.grey[200],
                    fontSize: 40.0,
                    letterSpacing: 2.0),
              ),
              const SizedBox(height: 20.0),
              Text(
                '${data['time']}',
                style: TextStyle(
                  fontSize: 70.0,
                  color: Colors.grey[200],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
