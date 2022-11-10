import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlk_app/initializer.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/res/theme.dart';
import 'package:simlk_app/src/utils/helper/notifications/notification_helper.dart';
import 'package:simlk_app/src/utils/localization/app_translation.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';
import 'package:simlk_app/src/utils/routes/routes.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Initializer.init();
  await Initializer.initHive();
  FirebaseMessaging.onBackgroundMessage(handleIncomingMessageOnBackground);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: GetMaterialApp(
          title: 'SIMPL-K',
          locale: const Locale('id'),
          debugShowCheckedModeBanner: false,
          fallbackLocale: const Locale('id'),
          translations: AppTranslation(),
          theme: AppTheme.buildThemeData(),
          getPages: Routes.pages,
          initialRoute: PageName.splash,
          builder: (BuildContext context, child) {
            return GlowingOverscrollIndicator(
              axisDirection: AxisDirection.up,
              color: Resources.color.neutral50.withOpacity(0),
              showLeading: false,
              showTrailing: false,
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: child ?? Container(),
              ),
            );
          },
        ),
      ),
    );
  }
}
