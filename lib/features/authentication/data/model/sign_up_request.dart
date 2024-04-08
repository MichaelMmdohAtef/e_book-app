import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequest{
  String email;
  String password;
  String phone;
  bool isAdmin;

  SignUpRequest({required this.email, required this.password, required this.phone,required this.isAdmin});

  Map<String,dynamic> toJson() => _$SignUpRequestToJson(this);
}