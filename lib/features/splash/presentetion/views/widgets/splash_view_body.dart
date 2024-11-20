import 'package:ecommerce_app/core/service/shared_preferences_service.dart';
import 'package:ecommerce_app/core/utils/app_images.dart';
import 'package:ecommerce_app/core/widgets/hypermart_text_widget.dart';
import 'package:ecommerce_app/features/auth/presentetion/views/sign_in_view.dart';
import 'package:ecommerce_app/features/home/presentetion/views/home_view.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    navigateToHome();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.imagesAppLogo,
            ),
          ],
        ),
        const HyperMartTextWidget(),
      ],
    );
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        String isLoginUserToken =
            SharedPreferencesService.getDataString(key: 'userToken');
        if (isLoginUserToken.isEmpty || isLoginUserToken == '') {
          Navigator.of(context).pushReplacementNamed(
            SignInView.routeName,
          );
        } else {
          Navigator.of(context).pushReplacementNamed(
            HomeView.routeName,
          );
        }
      },
    );
  }
}
