import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:sizer/sizer.dart';

class DashedButtonIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final double borderRadius;
  final Function callback;
  final EdgeInsetsGeometry? padding;
  final bool? isLoading;
  final double? progressValue;

  const DashedButtonIcon({
    required this.text,
    required this.icon,
    required this.borderRadius,
    required this.callback,
    this.padding,
    this.isLoading,
    this.progressValue,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading == true
          ? null
          : () {
              callback();
            },
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(borderRadius),
        color: Resources.color.neutral500,
        dashPattern: const [6, 3],
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          child: Container(
            width: SizerUtil.width,
            margin: padding ?? EdgeInsets.zero,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isLoading == true)
                  SizedBox(
                    width: 15,
                    height: 15,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      value: progressValue,
                    ),
                  ),
                if (isLoading != true)
                  Icon(
                    icon,
                    size: 35,
                    color: Resources.color.neutral500,
                  ),
                TextNunito(
                  size: 14,
                  color: Resources.color.neutral500,
                  maxLines: 3,
                  fontWeight: Weightenum.REGULAR,
                  text: text,
                  align: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
