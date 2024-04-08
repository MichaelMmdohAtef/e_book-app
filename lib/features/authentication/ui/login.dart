import 'package:e_bookwebsitetest/core/helpers/spacing.dart';
import 'package:e_bookwebsitetest/core/theaming/styles.dart';
import 'package:e_bookwebsitetest/core/widgets/app_text_button.dart';
import 'package:e_bookwebsitetest/features/authentication/logic/cubit/cubit.dart';
import 'package:e_bookwebsitetest/features/authentication/ui/widgets/dont_have_account_text.dart';
import 'package:e_bookwebsitetest/features/authentication/ui/widgets/email_and_password.dart';
import 'package:e_bookwebsitetest/features/authentication/ui/widgets/login_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back',
                style: TextStyles.font24BlueBold,
              ),
              verticalSpace(8),
              Text(
                'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                style: TextStyles.font14GrayRegular,
              ),
              verticalSpace(36),
              const EmailAndPassword(),
              verticalSpace(40),
              AppTextButton(
                buttonText: "Login",
                textStyle: TextStyles.font16WhiteSemiBold,
                onPressed: () {
                  validateThenDoLogin(context);
                },
              ),
              verticalSpace(30),
              const DontHaveAccountText(),
              const LoginBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  validateThenDoLogin(BuildContext context) {
    if (context.read<AuthenticationCubit>().formKey.currentState!.validate()) {
      context.read<AuthenticationCubit>().emitLogin();
    }
  }
}
