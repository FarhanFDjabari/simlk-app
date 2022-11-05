import 'package:flutter/material.dart';
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
    Key? key,
  }) : super(key: key);

  final Function(String) onSave;
  final TextEditingController textInputController;
  final String? label;
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
                  validator: Validator().notEmpty,
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
