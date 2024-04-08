import 'package:e_bookwebsitetest/core/networking/api_result.dart';
import 'package:e_bookwebsitetest/core/networking/error_handling.dart';
import 'package:e_bookwebsitetest/core/networking/firebase_services.dart';
import 'package:e_bookwebsitetest/features/authentication/data/model/sign_up_request.dart';
import 'package:firebase_core/firebase_core.dart';

class RegisterRepo {
  
  final FirebaseServices _firebaseServices;
  RegisterRepo(this._firebaseServices);
  String uid = "";

  Future<ApiResult> createAcount(SignUpRequest signUpRequest) async {
    try {
      final response = await _firebaseServices
          .createAccountWithEmailAndPassword(signUpRequest: signUpRequest);
      FirebaseServices.uid = response.user!.uid;
      return ApiResult.success(response);
    } on FirebaseException catch (error) {
      print("0" + error.toString());
      // print(error.message);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult> postDataOfUser(
      {required SignUpRequest signUpRequest,
      required String collectionName}) async {
    try {
      final response = await _firebaseServices.postUserDataOnFireStore(
          collectionName: collectionName, signUpRequest: signUpRequest);
      return ApiResult.success(response);
    } on FirebaseException catch (error) {
      print("0" + error.toString());
      // print(error.message);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

}
