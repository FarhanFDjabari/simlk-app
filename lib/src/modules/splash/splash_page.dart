import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/modules/common/widgets/statefull_wrapper.dart';
import 'package:simlk_app/src/modules/splash/controllers/splash_controller.dart';
import 'package:sizer/sizer.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () {
        controller.initSplash();
      },
      child: Scaffold(
        body: Center(
          child: Image(
            image: const AssetImage('lib/src/res/images/app_logo.png'),
            width: 100.sp,
            height: 50.sp,
          ),
        ),
      ),
    );
  }
}
