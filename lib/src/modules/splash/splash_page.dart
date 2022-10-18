import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/modules/common/widgets/app_logo_widget.dart';
import 'package:simlk_app/src/modules/common/widgets/statefull_wrapper.dart';
import 'package:simlk_app/src/modules/splash/controllers/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () {
        controller.initSplash();
      },
      child: const Scaffold(
        body: Center(
          // child: Assets.lib.theme.resources.images.appLogo.image(
          //   width: 88,
          //   height: 88,
          // ),
          child: AppLogoWidget(),
        ),
      ),
    );
  }
}
