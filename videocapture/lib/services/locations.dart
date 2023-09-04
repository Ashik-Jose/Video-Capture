import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:location/location.dart';

Future<List<geo.Placemark>?> fetchLocation(Location location) async{
  bool serviceAvailable = await location.serviceEnabled();
  PermissionStatus permissionGranted = await location.hasPermission();
  LocationData currPos;
  if(!serviceAvailable){
    serviceAvailable = await location.requestService();
    if(!serviceAvailable){
      return null;
    }
  }
  if(permissionGranted == PermissionStatus.denied){
    permissionGranted = await Location().requestPermission();
    if(permissionGranted!=PermissionStatus.granted){
      return null;
    }
  }

  currPos=await location.getLocation();

  return getAddress(currPos.latitude,currPos.longitude);
}

Future<List<geo.Placemark>> getAddress(double? latitude,double? longitude) async{
  double lat=latitude??0.0;
  double long=longitude??0.0;
List<geo.Placemark> placemarks=await geo.placemarkFromCoordinates(lat, long);
// print(placemarks[3]);
// print(placemarks[8]);
  return placemarks;
}