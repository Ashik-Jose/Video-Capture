import 'package:geocoding/geocoding.dart' as geo;
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:videocapture/services/auth.dart';
import 'package:videocapture/services/locations.dart';

import '../../modal/otpDialog.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  AuthService _auth=AuthService();
  Location location = Location();

  @override
  Widget build(BuildContext context) {
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
                child: const TextField(
                    keyboardType: TextInputType.name,
                    decoration:  InputDecoration(
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
                  ),
              ),
              Container(
                margin:const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: const TextField(
                    keyboardType: TextInputType.phone,
                    decoration:  InputDecoration(
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
                  ),
              ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: (){
                    showDialog(context: context, builder: (context)=>otpDialog(context));
                    // _auth.verifyNumber("+44 7444 555666","123456");
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
            ],
                  ),
                ),
          )),
    );
  }
}
