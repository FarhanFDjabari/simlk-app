import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';

class TextNunito extends StatelessWidget {
  final double size;
  final Color? color;
  final Weightenum fontWeight;
  final String? text;
  final TextAlign? align;
  final int? maxLines;
  final TextDecoration? textDecoration;
  final bool? isSelectable;

  weightSwitch() {
    switch (fontWeight) {
      case Weightenum.THIN:
        return FontWeight.w100;
      case Weightenum.LIGHT:
        return FontWeight.w300;
      case Weightenum.REGULAR:
        return FontWeight.w400;
      case Weightenum.MEDIUM:
        return FontWeight.w500;
      case Weightenum.SEMIBOLD:
        return FontWeight.w600;
      case Weightenum.BOLD:
        return FontWeight.w700;
      default:
        return FontWeight.w400;
    }
  }

  TextNunito({
    required this.size,
    this.color,
    required this.fontWeight,
    this.text,
    this.align,
    this.maxLines,
    this.textDecoration,
    this.isSelectable,
  });

  @override
  Widget build(BuildContext context) {
    return isSelectable == true
        ? SelectableText(
            text ?? "",
            textAlign: align ?? TextAlign.start,
            style: GoogleFonts.nunitoSans(
              fontWeight: weightSwitch(),
              fontSize: size,
              color: color,
              decoration: textDecoration,
            ),
            maxLines: maxLines,
          )
        : Text(
            text ?? "",
            textAlign: align ?? TextAlign.start,
            style: GoogleFonts.nunitoSans(
              fontWeight: weightSwitch(),
              fontSize: size,
              color: color,
              decoration: textDecoration,
            ),
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: maxLines,
          );
  }
}
