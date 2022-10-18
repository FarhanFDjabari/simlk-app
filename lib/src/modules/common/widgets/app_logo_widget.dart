import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../res/resources.dart';
import '../../../utils/helper/constant.dart';
import 'text/text_nunito.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.sp,
      height: 50.sp,
      decoration: BoxDecoration(
        border: Border.all(
          color: Resources.color.indigo700,
        ),
      ),
      child: Center(
        child: TextNunito(
          text: 'SIML-K',
          size: 15.sp,
          fontWeight: Weightenum.BOLD,
          color: Resources.color.indigo700,
          align: TextAlign.center,
        ),
      ),
    );
  }
}
