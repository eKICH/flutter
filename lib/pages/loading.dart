import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time_new/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //Method to setup world time
  void setUpWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Nairobi', url: 'Africa/Nairobi', flag: 'kenya.png');
    await instance.getTime();

    //Redirect to the home page route and pass the setUpWorldTime
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[800],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: SpinKitSpinningLines(
              duration: Duration(seconds: 3),
              color: Colors.amber,
              size: 120.0,
            ),
          ),
          const SizedBox(height: 20.0),
          Text(
            'Getting things ready!..',
            style: TextStyle(
              color: Colors.grey[100],
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
