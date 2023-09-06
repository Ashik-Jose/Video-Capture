import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseSnapshots {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('videos');

  List _videoListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return doc.data();
    }).toList();
  }

  Stream<List> get videos {
    return userCollection.snapshots().map(_videoListFromSnapshot);
  }
}
