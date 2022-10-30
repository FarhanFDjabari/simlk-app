import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';

class DescriptionTextWidget extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final Weightenum fontWeight;
  final TextAlign? textAlign;

  const DescriptionTextWidget({
    required this.text,
    required this.size,
    required this.color,
    required this.fontWeight,
    this.textAlign,
    Key? key,
  }) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return ExpandableText(
      text,
      expandText: 'Lihat selengkapnya',
      collapseText: 'Lihat lebih sedikit',
      maxLines: 2,
      linkColor: Resources.color.indigo700,
      style: GoogleFonts.nunitoSans(
        fontWeight: weightSwitch(),
        fontSize: size,
        color: color,
      ),
      textAlign: TextAlign.justify,
    );
  }
}
