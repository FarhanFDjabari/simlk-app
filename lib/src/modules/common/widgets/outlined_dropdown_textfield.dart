import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:sizer/sizer.dart';

class OutlinedDropdownTextfield<T> extends StatelessWidget {
  const OutlinedDropdownTextfield({
    this.label,
    this.hintText,
    this.onChanged,
    this.items,
    Key? key,
  }) : super(key: key);

  final String? hintText;
  final TextNunito? label;
  final Function(T?)? onChanged;
  final List<DropdownMenuItem<T>>? items;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) label!,
        if (label != null) const SizedBox(height: 5),
        DropdownButtonFormField<T>(
          iconDisabledColor: Resources.color.neutral300,
          validator: (value) {
            if (value == null) {
              return 'txt_valid_notEmpty'.tr;
            }
            return null;
          },
          hint: TextNunito(
            text: hintText,
            size: 12.sp,
            fontWeight: Weightenum.REGULAR,
          ),
          items: items,
          onChanged: onChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            isDense: true,
          ),
        ),
      ],
    );
  }
}
