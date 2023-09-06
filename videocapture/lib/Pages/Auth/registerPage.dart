import 'package:geocoding/geocoding.dart' as geo;
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:videocapture/services/auth.dart';
import 'package:videocapture/services/locations.dart';

import '../../modal/otpDialog.dart';

class RegisterPage extends StatefulWidget {
  final Function toggleView;
  const RegisterPage({super.key,required this.toggleView});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  AuthService _auth=AuthService();
  Location location = Location();

  @override
  Widget build(BuildContext context) {
    String phoneNumber='',name='';
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
                child:  TextField(
                    keyboardType: TextInputType.name,
                    decoration:  const InputDecoration(
                        border:  OutlineInputBorder(
                          borderRadius:  BorderRadius.all(
                             Radius.circular(30),
                          ),
                        ),
                        filled: true,
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.cyan,
                        ),
                        hintText: "Enter Your Name...",
                        fillColor: Colors.white70),
                        onChanged: (value) => name = value,
                  ),
              ),
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
                    // _auth.verifyNumber("+44 7444 555666","123456");
                   await showDialog(context: context, builder: (context)=>otpDialog(context,phoneNumber,name));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ), 
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(15,15,15,15),
                    child: Text('Register'),
                  ),
                  ),
                  TextButton(
                    onPressed: (){
                      // Future<List<geo.Placemark>?> address=fetchLocation(location);
                      // print(address);
                      widget.toggleView();
                    }, 
                    child: const Text('Already Registered? Sign In'))
            ],
                  ),
                ),
          )),
    );
  }
}
