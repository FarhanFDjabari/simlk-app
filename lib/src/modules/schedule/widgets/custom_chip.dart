import 'package:flutter/material.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:sizer/sizer.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    Key? key,
    this.label,
    this.isSelected = false,
    this.onSelected,
  }) : super(key: key);

  final String? label;
  final bool? isSelected;
  final Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: TextNunito(
        text: label,
        size: 10.sp,
        fontWeight: Weightenum.MEDIUM,
        color: isSelected == true
            ? Resources.color.neutral50
            : Resources.color.indigo700,
      ),
      selected: isSelected == true,
      backgroundColor: Resources.color.neutral50,
      selectedColor: Resources.color.indigo700,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: Resources.color.indigo700,
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      onSelected: onSelected,
    );
  }
}
