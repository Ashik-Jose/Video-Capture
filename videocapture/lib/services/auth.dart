import 'package:firebase_auth/firebase_auth.dart';
import 'package:videocapture/services/database.dart';

import '../models/user.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  GetUser? _userFromFirebaseUser(User? user){
    return user!=null ? GetUser(uid: user.uid) : null;
  }

  //Auth Change User Stream
  Stream<GetUser?> get user{
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //Verify Phone Number
  Future verifyNumber(String phoneNumber,String smsCode,String name) async{
    UserCredential? result;
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async{
        result= await _auth.signInWithCredential(credential);
        if(name!=''){
        print('Name available');
        await DatabaseService(uid: result!.user!.uid).createUser(name);
      }
        // User user = result.user!;
        // print(userid);
      },
      verificationFailed: (FirebaseAuthException e){
      },
      codeSent: (String verificationId, int? resendToken) async{
        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
        result=await _auth.signInWithCredential(credential);
        if(result!=null && name!=''){
        print('Name available');
        await DatabaseService(uid: result!.user!.uid).createUser(name);
      }
      },
      codeAutoRetrievalTimeout: (String verificationId){
        verificationId = verificationId;
      },
    );
    if(result!=null){
      if(name!=''){
        print('Name available');
        await DatabaseService(uid: result!.user!.uid).createUser(name);
      }
      print('Name available');
      return _userFromFirebaseUser(result!.user);
    }

  }

  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }


}