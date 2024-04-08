import 'package:e_bookwebsitetest/core/helpers/spacing.dart';
import 'package:e_bookwebsitetest/core/theaming/styles.dart';
import 'package:e_bookwebsitetest/core/widgets/app_text_button.dart';
import 'package:e_bookwebsitetest/features/authentication/logic/cubit/cubit.dart';
import 'package:e_bookwebsitetest/features/authentication/ui/widgets/already_have_account_text.dart';
import 'package:e_bookwebsitetest/features/authentication/ui/widgets/are_you_admin_check_box.dart';
import 'package:e_bookwebsitetest/features/authentication/ui/widgets/sign_up_bloc_listener.dart';
import 'package:e_bookwebsitetest/features/authentication/ui/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
              'Create Account',
              style: TextStyles.font24BlueBold,
            ),
            verticalSpace(8),
            Text(
              'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
              style: TextStyles.font14GrayRegular,
            ),
            verticalSpace(36),
            const SignupForm(),
            verticalSpace(12),
            const SignUpAsAdmin(),
            verticalSpace(10),
            AppTextButton(
              buttonText: "Create Account",
              textStyle: TextStyles.font16WhiteSemiBold,
              onPressed: () {
                validateThenDoSignup(context);
              },
            ),
            verticalSpace(10),
            const AlreadyHaveAccountText(),
            const SignupBlocListener(),
          ],
        ),
      ),
    ));
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<AuthenticationCubit>().formKey.currentState!.validate()) {
      context.read<AuthenticationCubit>().emitCreateEmailAndPassword();
    }
  }
}
