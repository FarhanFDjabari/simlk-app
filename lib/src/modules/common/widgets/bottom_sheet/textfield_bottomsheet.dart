import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/modules/common/widgets/button/primary_button.dart';
import 'package:simlk_app/src/modules/common/widgets/outlined_textfield.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:simlk_app/src/utils/helper/validator.dart';

class TextfieldBottomsheet extends StatelessWidget {
  TextfieldBottomsheet({
    this.label,
    required this.textInputController,
    required this.onSave,
    this.isLoading,
    Key? key,
  }) : super(key: key);

  final Future<void> Function(String) onSave;
  final TextEditingController textInputController;
  final String? label;
  final bool? isLoading;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Resources.color.neutral50,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(16),
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 4,
                  width: 64,
                  decoration: BoxDecoration(
                    color: Resources.color.neutral300,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(height: 10),
                OutlinedTextfield(
                  controller: textInputController,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  validator: (text) {
                    if (textInputController.text.isEmpty == true) {
                      return 'txt_valid_notEmpty'.tr;
                    }
                    return null;
                  },
                  label: TextNunito(
                    text: label,
                    size: 16,
                    fontWeight: Weightenum.REGULAR,
                  ),
                  maxLines: 8,
                  hintText: 'Tulis laporan akhir...',
                ),
                const SizedBox(height: 16),
                PrimaryButton(
                  elevation: 0,
                  isLoading: isLoading == true,
                  label: 'Tambahkan Laporan',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      onSave(textInputController.text);
                    }
                  },
                  height: 45,
                ),
              ],
            ),
          ),
        ));
  }
}
