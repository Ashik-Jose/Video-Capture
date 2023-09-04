import 'package:firebase_auth/firebase_auth.dart';

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
  Future verifyNumber(String phoneNumber,String smsCode) async{
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async{
        UserCredential result= await _auth.signInWithCredential(credential);
        User user = result.user!;
        return _userFromFirebaseUser(user);
        // print(userid);
      },
      verificationFailed: (FirebaseAuthException e){
        return null;
      },
      codeSent: (String verificationId, int? resendToken){
        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
        final result=_auth.signInWithCredential(credential);
        return _userFromFirebaseUser(result.user);
      },
      codeAutoRetrievalTimeout: (String verificationId){
        verificationId = verificationId;
      },
    );
  }



}