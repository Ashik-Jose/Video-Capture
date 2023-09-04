import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('videos');
  final storageRef = FirebaseStorage.instance.ref();

  Future createUser() async {
    return await userCollection.doc(uid).set({
      'video': [],
    });
  }

  Future addVideos(String path,String title,String location,String category) async {
    print('Sending..');
    // String videoName=path.substring(path.lastIndexOf("/"),path.lastIndexOf('.'));
    final videoReference=storageRef.child('/$title.mp4');
    File file=File(path);

    await videoReference.putFile(file).whenComplete(() async {
        await userCollection.doc(uid).update({
          'video':FieldValue.arrayUnion([{
            'title':title,
            'location':location,
            'category':category,
            'videoUrl':await videoReference.getDownloadURL(),
          }])
    });
    });
  }
}