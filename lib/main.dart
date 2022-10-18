import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlk_app/initializer.dart';
import 'package:simlk_app/src/res/theme.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';
import 'package:simlk_app/src/utils/routes/routes.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Initializer.init();
  await Initializer.initHive();
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
          locale: const Locale('en'),
          fallbackLocale: const Locale('en'),
          theme: AppTheme.buildThemeData(),
          getPages: Routes.pages,
          initialRoute: PageName.splash,
          builder: (BuildContext context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child ?? Container(),
            );
          },
        ),
      ),
    );
  }
}
