import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:simlk_app/src/modules/common/widgets/button/dashed_button_icon.dart';
import 'package:simlk_app/src/modules/common/widgets/button/primary_button.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';

class UploadFileBottomsheet extends StatefulWidget {
  UploadFileBottomsheet({
    this.label,
    required this.onSave,
    Key? key,
  }) : super(key: key);

  final Function(File) onSave;
  final String? label;

  @override
  State<UploadFileBottomsheet> createState() => _UploadFileBottomsheetState();
}

class _UploadFileBottomsheetState extends State<UploadFileBottomsheet> {
  File? pickedFile;
  String? fileName;

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
            TextNunito(
              text: widget.label,
              size: 16,
              fontWeight: Weightenum.REGULAR,
            ),
            const SizedBox(height: 5),
            DashedButtonIcon(
              text: fileName ?? 'Upload File',
              icon: Remix.file_2_fill,
              borderRadius: 16,
              callback: () async {
                FilePickerResult? result =
                    await FilePicker.platform.pickFiles();

                if (result != null) {
                  setState(() {
                    pickedFile = File(result.files.single.path!);
                    fileName = result.files.single.name;
                  });
                } else {
                  // User canceled the picker
                }
              },
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              elevation: 0,
              label: 'Tambahkan Laporan',
              onPressed: () {
                if (pickedFile != null) {
                  widget.onSave(pickedFile!);
                }
              },
              isEnabled: pickedFile != null,
              height: 45,
            ),
          ],
        ));
  }
}
