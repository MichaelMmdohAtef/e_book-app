import 'package:e_bookwebsitetest/core/constants/constant.dart';
import 'package:e_bookwebsitetest/core/helpers/cach_helper.dart';
import 'package:e_bookwebsitetest/core/networking/api_result.dart';
import 'package:e_bookwebsitetest/core/networking/error_handling.dart';
import 'package:e_bookwebsitetest/core/networking/firebase_services.dart';
import 'package:e_bookwebsitetest/features/authentication/data/model/login_request.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginRepo {
  final FirebaseServices _firebaseServices;
  LoginRepo(this._firebaseServices);
  Future<ApiResult> login(LoginRequest loginRequest) async {
    try {
      final response = await _firebaseServices.loginWithEmailAndPassword(
          loginRequest: loginRequest);
      await CachHelper().putData(key: AppConstants.UID_USER_KEY, value: response.user!.uid);    
      return ApiResult.success(response);
    } on FirebaseException catch (error) {
      print("0" + error.toString());
      // print(error.message);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
