import 'package:flutter/material.dart';
import 'package:world_time_new/services/world_time.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Europe/Paris', location: 'Paris', flag: 'france.png'),
    WorldTime(url: 'Europe/Moscow', location: 'Moscow', flag: 'russia.jpg'),
    WorldTime(url: 'Europe/Kyiv', location: 'Kyiv', flag: 'ukraine.jpg'),
    WorldTime(url: 'Asia/Hong_Kong', location: 'Hong Kong', flag: 'china.jpg'),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'japan.jpg'),
    WorldTime(url: 'Asia/Jerusalem', location: 'Jerusalem', flag: 'israel.jpg'),
  ];

  //Method to update time after choosing a location
  void updateTime(index) async {

    //Variable to store the location
    WorldTime instance = locations[index];

    //Get time from the getTime method
    await instance.getTime();

    //Navigate to the home screen - Use pop instead of push
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: const Text('Choose Location'),
        centerTitle: true,
        elevation: 3.0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: Card(
                  color: Colors.indigo[600],
                  elevation: 0.0,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/${locations[index].flag}'),
                      ),
                      onTap: () {
                        updateTime(index);
                      },
                      title: Text(
                        locations[index].location,
                        style: TextStyle(
                          color: Colors.grey[200],
                          fontSize: 22.0,
                        ),
                      ),
                    ),
                )
            );
          },
        ),
      ),
    );
  }
}
