import 'package:flutter/material.dart';

otpDialog(BuildContext context) {
    return AlertDialog(title: const Text('Enter your OTP'),
            content: const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                obscureText: true,
                
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
                // onChanged: (value) {
                //   // otp = value;
                // },
              ),
            ),
            contentPadding: const EdgeInsets.all(10.0),
            actions: <Widget>[
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // signIn(otp);
                  },
                  child: const Text(
                    'Submit',
                  ),
                ),
              ),
            ],
          );
  }