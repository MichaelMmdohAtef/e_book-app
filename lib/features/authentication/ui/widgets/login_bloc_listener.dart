import 'package:e_bookwebsitetest/core/helpers/extensions.dart';
import 'package:e_bookwebsitetest/core/routing/routes.dart';
import 'package:e_bookwebsitetest/core/theaming/colors.dart';
import 'package:e_bookwebsitetest/core/theaming/styles.dart';
import 'package:e_bookwebsitetest/features/authentication/logic/cubit/cubit.dart';
import 'package:e_bookwebsitetest/features/authentication/logic/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationStates>(
      listener: (context, state) {
        if (state is OnLoadingLoginStates) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.mainBlue,
              ),
            ),
          );
        } else if (state is OnSuccessLoginStates) {
          context.pushReplacementNamed(Routes.homeScreen);
        } else if (state is OnErrorLoginStates) {
          setupErrorState(context, state.errorMessage);
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: TextStyles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font14BlueSemiBold,
            ),
          ),
        ],
      ),
    );
  }
}
