import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/modules/common/widgets/button/primary_button.dart';
import 'package:simlk_app/src/modules/common/widgets/loading_overlay.dart';
import 'package:simlk_app/src/modules/common/widgets/outlined_textfield.dart';
import 'package:simlk_app/src/modules/common/widgets/state_handle_widget.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/modules/profile/controllers/student_complete_profile.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:simlk_app/src/utils/helper/validator.dart';
import 'package:sizer/sizer.dart';

class StudentCompleteProfilePage
    extends GetView<StudentCompleteProfileController> {
  StudentCompleteProfilePage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Resources.color.neutral100,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: Resources.color.gradient600to800,
          ),
        ),
        title: TextNunito(
          text: 'Lengkapi Profilmu',
          size: 15.sp,
          fontWeight: Weightenum.BOLD,
        ),
        foregroundColor: Resources.color.neutral50,
      ),
      body: GetBuilder<StudentCompleteProfileController>(
        builder: (_) {
          return StateHandleWidget(
            shimmerView: const LoadingOverlay(),
            loadingEnabled: controller.isLoading,
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      OutlinedTextfield(
                        controller: controller.studentEmailController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        hintText: 'Masukkan email mahasiswa anda',
                        label: TextNunito(
                          text: 'Email Mahasiswa',
                          size: 14,
                          fontWeight: Weightenum.REGULAR,
                        ),
                        validator: Validator().notEmpty,
                      ),
                      SizedBox(height: 5.sp),
                      OutlinedTextfield(
                        controller: controller.dosenPaController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        hintText: 'Masukkan nama dosen PA anda',
                        label: TextNunito(
                          text: 'Dosen PA',
                          size: 14,
                          fontWeight: Weightenum.REGULAR,
                        ),
                        validator: Validator().notEmpty,
                      ),
                      SizedBox(height: 5.sp),
                      OutlinedTextfield(
                        controller: controller.phoneNumberController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        hintText: 'Masukkan no. hp anda',
                        label: TextNunito(
                          text: 'No. HP',
                          size: 14,
                          fontWeight: Weightenum.REGULAR,
                        ),
                      ),
                      SizedBox(height: 5.sp),
                      OutlinedTextfield(
                        controller: controller.lineIdController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        hintText: 'Masukkan Line ID anda',
                        label: TextNunito(
                          text: 'Line ID',
                          size: 14,
                          fontWeight: Weightenum.REGULAR,
                        ),
                      ),
                      SizedBox(height: 16.sp),
                      PrimaryButton(
                        isLoading: controller.isLoading,
                        elevation: 0,
                        label: 'Simpan',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            controller.updateProfile();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
