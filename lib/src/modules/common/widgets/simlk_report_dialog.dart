import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:simlk_app/src/modules/common/widgets/button/custom_text_button.dart';
import 'package:simlk_app/src/modules/common/widgets/button/dashed_button_icon.dart';
import 'package:simlk_app/src/modules/common/widgets/button/primary_button.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:sizer/sizer.dart';

class SIMLKReportDialog extends StatelessWidget {
  const SIMLKReportDialog({
    Key? key,
    required this.onTextPressed,
    required this.onFilePressed,
    this.title,
    this.description,
  }) : super(key: key);

  final Function() onTextPressed;
  final Function() onFilePressed;
  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: 328,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Resources.color.neutral50,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
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
              align: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: DashedButtonIcon(
                    text: 'Tambahkan Laporan Teks',
                    icon: Remix.text,
                    borderRadius: 16,
                    callback: onTextPressed,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 5,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DashedButtonIcon(
                    text: 'Upload File Laporan',
                    icon: Remix.file_3_fill,
                    borderRadius: 16,
                    callback: onFilePressed,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 5,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
