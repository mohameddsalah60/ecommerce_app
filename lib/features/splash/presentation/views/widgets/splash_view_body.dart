import 'package:ecommerce_app/core/utils/app_images.dart';
import 'package:ecommerce_app/widgets/select_lang_bottom_sheet.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    splashViewLogic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Assets.imagesAppIcon),
      ],
    );
  }

  Future<void> splashViewLogic() {
    return Future.delayed(
      const Duration(seconds: 3),
      () {
        selectLanguageBottomSheet(context);
        // Navigator.of(context).pushReplacementNamed(SignInView.routeName);
      },
    );
  }
}
