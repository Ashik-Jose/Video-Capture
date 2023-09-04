import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:videocapture/Pages/recordPage.dart';
import 'package:videocapture/services/database.dart';
import 'package:videocapture/services/locations.dart';
import 'package:location/location.dart';

class ViewVideos extends StatelessWidget {
  const ViewVideos({super.key});

  @override
  Widget build(BuildContext context) {

    Location location = Location();
    DatabaseService(uid: 'N3SfgrnYEkdesYIGzghtAxX7R703').createUser();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('View Videos'),
        backgroundColor: Colors.black,
        elevation: 0.0,
        actions: [
          TextButton.icon(
            onPressed: (){}, 
            icon: const Icon(Icons.logout_rounded,color: Colors.white,), 
            label: const Text('logout',style: TextStyle(color: Colors.white),))
        ],
      ),
      body: Center(
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: (){
            // Future<List<geo.Placemark>?> address=fetchLocation(location);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const RecordPage()));
          }, 
          child: const Icon(Icons.add), ),
      ),
      
    );
  }
}