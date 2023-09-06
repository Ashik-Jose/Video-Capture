import 'package:geocoding/geocoding.dart' as geo;
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:videocapture/services/auth.dart';
import 'package:videocapture/services/locations.dart';

import '../../modal/otpDialog.dart';

class LoginPage extends StatefulWidget {
  final Function toggleView;
  const LoginPage({super.key,required this.toggleView});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  AuthService _auth=AuthService();
  Location location = Location();

  @override
  Widget build(BuildContext context) {
    String phoneNumber='';
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            child: Center(
                  child: Column(
            children: [
              const SizedBox(height: 100),
              Image.asset('assets/logo.jpg'),
              const SizedBox(height: 100),
              Container(
                margin:const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                    keyboardType: TextInputType.phone,
                    decoration:  const InputDecoration(
                        border:  OutlineInputBorder(
                          borderRadius:  BorderRadius.all(
                             Radius.circular(30),
                          ),
                        ),
                        filled: true,
                        prefixIcon: Icon(
                          Icons.phone_iphone,
                          color: Colors.cyan,
                        ),
                        hintText: "Enter Your Phone Number...",
                        fillColor: Colors.white70),
                        onChanged: (value) => phoneNumber = value,
                  ),
              ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () async{
                   await _auth.verifyNumber(phoneNumber,'',"");
                    showDialog(context: context, builder: (context)=>otpDialog(context,phoneNumber,""));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ), 
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(15,15,15,15),
                    child: Text('Generate OTP'),
                  ),
                  ),
                  TextButton(
                    onPressed: (){
                      // Future<List<geo.Placemark>?> address=fetchLocation(location);
                      // print(address);
                      widget.toggleView();
                    }, 
                    child: const Text('Not Registered? Sign Up'))
            ],
                  ),
                ),
          )),
    );
  }
}
