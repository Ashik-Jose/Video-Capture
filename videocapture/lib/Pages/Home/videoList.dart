import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videocapture/Pages/Home/userVideos.dart';

class VideoList extends StatefulWidget {
  const VideoList({super.key});

  @override
  State<VideoList> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  @override
  Widget build(BuildContext context) {

    final videos=Provider.of<List?>(context);
    final videoList=[];
    if(videos!=null){
      videos.forEach((userVideo) {
        userVideo['video'].forEach((video) {
          videoList.add(video);
        });
      });
      print(videoList);
    }
       
      return ListView.builder(
        itemCount: videoList!=[]?videoList.length:0,
        itemBuilder: (context,index){
          // return Text(videoList[index]['title']);
          return Card(
          child: ListTile(
            title: Text(videoList[index]['title']),
            subtitle: Text(videoList[index]['location'] ?? 'Unknown'),
            trailing: Text(videoList[index]['category'] ?? 'Unknown'),
          ),
          );
        }
        );
      

  }
          }

