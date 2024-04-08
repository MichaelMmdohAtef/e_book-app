import 'package:e_bookwebsitetest/features/authentication/data/model/login_request.dart';
import 'package:e_bookwebsitetest/features/authentication/data/model/sign_up_request.dart';
import 'package:e_bookwebsitetest/features/authentication/logic/repos/login_repo.dart';
import 'package:e_bookwebsitetest/features/authentication/logic/repos/register_repo.dart';
import 'package:e_bookwebsitetest/features/authentication/logic/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationCubit extends Cubit<AuthenticationStates> {
  AuthenticationCubit(this._loginRepo, this._registerRepo)
      : super(InitialStates());

  final LoginRepo _loginRepo;
  final RegisterRepo _registerRepo;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  bool youAreAdmin = false;
  final formKey = GlobalKey<FormState>();

  emitLogin() async {
    emit(OnLoadingLoginStates());
    LoginRequest loginRequest = LoginRequest(
        email: emailController.text, password: passwordController.text);
    final response = await _loginRepo.login(loginRequest);
    response.when(success: (value) {
      emit(OnSuccessLoginStates());
    }, failure: (error) {
      emit(OnErrorLoginStates(error.errorMessage));
    });
  }

  emitCreateEmailAndPassword() async {
    emit(OnLoadingRegisterStates());
    SignUpRequest signUpRequest = SignUpRequest(
        email: emailController.text,
        password: passwordController.text,
        phone: phoneController.text,
        isAdmin: youAreAdmin);
    final response = await _registerRepo.createAcount(signUpRequest);
    response.when(success: (value) async {
      await postUserData(signUpRequest: signUpRequest);
      emit(OnSuccessRegisterStates());
    }, failure: (error) {
      emit(OnErrorRegisterStates(error.errorMessage));
    });
  }

  Future postUserData({required SignUpRequest signUpRequest}) async {
    emit(OnLoadingPostUserDataToFireStoreStates());
    final response = await _registerRepo.postDataOfUser(
        signUpRequest: signUpRequest, collectionName: "users");
    response.when(success: (value) {
      emit(OnSuccessPostUserDataToFireStoreStates());
    }, failure: (error) {
      emit(OnErrorPostUserDataToFireStoreStates(error.errorMessage));
    });
  }
}
