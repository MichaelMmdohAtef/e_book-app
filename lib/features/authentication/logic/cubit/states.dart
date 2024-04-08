abstract class AuthenticationStates{}

class InitialStates extends AuthenticationStates{}

class OnLoadingLoginStates extends AuthenticationStates{}
class OnSuccessLoginStates extends AuthenticationStates {}
class OnErrorLoginStates extends AuthenticationStates {
  String errorMessage;
  OnErrorLoginStates(this.errorMessage);
}

class OnLoadingRegisterStates extends AuthenticationStates {}
class OnSuccessRegisterStates extends AuthenticationStates {}
class OnErrorRegisterStates extends AuthenticationStates {
  String errorMessage;
  OnErrorRegisterStates(this.errorMessage);
}

class OnLoadingPostUserDataToFireStoreStates extends AuthenticationStates {}
class OnSuccessPostUserDataToFireStoreStates extends AuthenticationStates {}
class OnErrorPostUserDataToFireStoreStates extends AuthenticationStates {
  String errorMessage;
  OnErrorPostUserDataToFireStoreStates(this.errorMessage);
}
