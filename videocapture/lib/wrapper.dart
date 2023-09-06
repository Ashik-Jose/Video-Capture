import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videocapture/Pages/Auth/authenticate.dart';
import 'package:videocapture/Pages/Auth/loginPage.dart';
import 'package:videocapture/Pages/Home/viewVideos.dart';
import 'package:videocapture/models/user.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    
    final user=Provider.of<GetUser?>(context);
    if(user==null){
      return const Authenticate();
    }else{
      return const ViewVideos();
    }
  }
}