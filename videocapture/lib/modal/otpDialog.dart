import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videocapture/models/user.dart';
import 'package:videocapture/services/auth.dart';
import 'package:videocapture/services/database.dart';

otpDialog(BuildContext context,String phoneNumber,String name) {
  String otp = '';
  AuthService _auth = AuthService();
  final user=Provider.of<GetUser?>(context);
  if(user!=null)
  {
    Navigator.pop(context);
  }
    return AlertDialog(title: const Text('Enter your OTP'),
            content:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                obscureText: true,
                
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
                onChanged: (value) => otp = value,
              ),
            ),
            contentPadding: const EdgeInsets.all(10.0),
            actions: <Widget>[
              Center(
                child: TextButton(
                  onPressed: () async{
                    
                    // signIn(otp);
                  await _auth.verifyNumber(phoneNumber, otp, name);
                  // Navigator.pop(context);
                  },
                  child: const Text(
                    'Submit',
                  ),
                ),
              ),
            ],
          );
  }