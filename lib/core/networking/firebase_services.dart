import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_bookwebsitetest/features/authentication/data/model/login_request.dart';
import 'package:e_bookwebsitetest/features/authentication/data/model/sign_up_request.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static String uid = "";
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<UserCredential> loginWithEmailAndPassword(
      {required LoginRequest loginRequest}) {
    return auth.signInWithEmailAndPassword(
        email: loginRequest.email, password: loginRequest.password);
  }

  Future<UserCredential> createAccountWithEmailAndPassword(
      {required SignUpRequest signUpRequest}) {
    return auth.createUserWithEmailAndPassword(
        email: signUpRequest.email, password: signUpRequest.password);
  }


  Future postUserDataOnFireStore(
      {required SignUpRequest signUpRequest, required String collectionName}) {
    return firestore
        .collection(collectionName)
        .doc(uid)
        .set(signUpRequest.toJson());
  }

  Future signOut({required SignUpRequest signUpRequest}) {
    return auth.signOut();
  }
}
