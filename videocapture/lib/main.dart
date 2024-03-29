import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videocapture/Pages/Auth/loginPage.dart';
import 'package:videocapture/Pages/recordPage.dart';
import 'package:videocapture/Pages/Home/viewVideos.dart';
import 'package:videocapture/modal/otpDialog.dart';
import 'package:videocapture/models/user.dart';
import 'package:videocapture/services/auth.dart';
import 'package:videocapture/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<GetUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: const MaterialApp(
        debugShowCheckedModeBanner : false,
          home: Wrapper(),
        )
      
    );
  }
}
