import 'package:e_bookwebsitetest/core/helpers/spacing.dart';
import 'package:e_bookwebsitetest/core/theaming/styles.dart';
import 'package:e_bookwebsitetest/features/authentication/logic/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpAsAdmin extends StatefulWidget {
  const SignUpAsAdmin({super.key});

  @override
  State<SignUpAsAdmin> createState() => _SignUpAsAdminState();
}

class _SignUpAsAdminState extends State<SignUpAsAdmin> {
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: context.read<AuthenticationCubit>().youAreAdmin,
          onChanged: (value) {
            setState(() {
              context.read<AuthenticationCubit>().youAreAdmin = value!;
            });
          },
        ),
        horizontalSpace(5),
        Text(
          "Are You Admin?",
          style: TextStyles.font13BlueRegular.copyWith(fontSize: 17.sp),
        )
      ],
    );
  }
}
