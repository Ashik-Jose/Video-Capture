import 'package:flutter/material.dart';

class UserVideos extends StatefulWidget {
  final List? videos;
  const UserVideos({super.key,this.videos});

  @override
  State<UserVideos> createState() => _UserVideosState();
}

class _UserVideosState extends State<UserVideos> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context,index){
         return Card(
          child: ListTile(
            title: Text(widget.videos![index].title),
            subtitle: Text(widget.videos![index].location),
            trailing: Text(widget.videos![index].category),
          ),
         );
      }
      );
  }
}