import 'package:flutter/material.dart';
import 'package:simlk_app/src/modules/common/widgets/button/custom_text_button.dart';
import 'package:simlk_app/src/modules/common/widgets/button/primary_button.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:sizer/sizer.dart';

class SIMLKDialog extends StatelessWidget {
  const SIMLKDialog({
    Key? key,
    this.onSuccessPressed,
    this.onCancelPressed,
    this.title,
    this.description,
    this.successButtonLabel,
    this.cancelButtonLabel,
  }) : super(key: key);

  final Function()? onSuccessPressed;
  final Function()? onCancelPressed;
  final String? title;
  final String? description;
  final String? successButtonLabel;
  final String? cancelButtonLabel;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: 328,
        height: 140.sp,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Resources.color.neutral50,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextNunito(
              text: title,
              size: 20,
              fontWeight: Weightenum.BOLD,
              color: Resources.color.neutral900,
            ),
            const SizedBox(height: 8),
            TextNunito(
              text: description,
              maxLines: 2,
              size: 14,
              fontWeight: Weightenum.REGULAR,
              color: Resources.color.neutral900,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomTextButton(
                  width: 105,
                  height: 48,
                  label: cancelButtonLabel,
                  labelWeight: Weightenum.BOLD,
                  labelSize: 16,
                  onPressed: onCancelPressed,
                ),
                PrimaryButton(
                  width: 95.sp,
                  height: 35.sp,
                  label: successButtonLabel,
                  fontSize: 12.sp,
                  elevation: 0,
                  onPressed: onSuccessPressed,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
