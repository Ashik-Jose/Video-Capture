import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:provider/provider.dart';
import 'package:videocapture/Pages/Home/videoList.dart';
import 'package:videocapture/Pages/recordPage.dart';
import 'package:videocapture/services/auth.dart';
import 'package:videocapture/services/database.dart';
import 'package:videocapture/services/databaseSnapshots.dart';
import 'package:videocapture/services/locations.dart';
import 'package:location/location.dart';

class ViewVideos extends StatelessWidget {
  const ViewVideos({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService _auth = AuthService();
    Location location = Location();
    // DatabaseService(uid: 'N3SfgrnYEkdesYIGzghtAxX7R703').createUser();
    return StreamProvider<List?>.value(
      initialData: null,
      value: DatabaseSnapshots().videos,
      child: Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            title: const Text('View Videos'),
            backgroundColor: Colors.black,
            elevation: 0.0,
            actions: [
              TextButton.icon(
                  onPressed: () async {
                    await _auth.signOut();
                  },
                  icon: const Icon(
                    Icons.logout_rounded,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'logout',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
          body: const VideoList()
        
    )
    );
  }
}


// Navigator.push(context, MaterialPageRoute(builder: (context)=>const RecordPage()));
// Future<List<geo.Placemark>?> address=fetchLocation(location);