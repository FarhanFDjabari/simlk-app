import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/modules/common/widgets/button/primary_button.dart';
import 'package:simlk_app/src/modules/common/widgets/loading_overlay.dart';
import 'package:simlk_app/src/modules/common/widgets/outlined_textfield.dart';
import 'package:simlk_app/src/modules/common/widgets/state_handle_widget.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/modules/schedule/controllers/create_new_counselor_controller.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:simlk_app/src/utils/helper/validator.dart';
import 'package:sizer/sizer.dart';

class CreateNewCounselorPage extends GetView<CreateNewCounselorController> {
  CreateNewCounselorPage({Key? key}) : super(key: key);

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
          text: 'Tambah Konselor',
          size: 15.sp,
          fontWeight: Weightenum.BOLD,
        ),
        foregroundColor: Resources.color.neutral50,
      ),
      body: GetBuilder<CreateNewCounselorController>(
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
                        controller: controller.nameController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        hintText: 'Masukkan nama konselor',
                        label: TextNunito(
                          text: 'Nama',
                          size: 14,
                          fontWeight: Weightenum.REGULAR,
                        ),
                        validator: Validator().notEmpty,
                      ),
                      SizedBox(height: 2.h),
                      OutlinedTextfield(
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        hintText: 'Masukkan email konselor',
                        label: TextNunito(
                          text: 'Email',
                          size: 14,
                          fontWeight: Weightenum.REGULAR,
                        ),
                        validator: Validator().notEmpty,
                      ),
                      SizedBox(height: 2.h),
                      OutlinedTextfield(
                        controller: controller.majorController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        hintText: 'Masukkan prodi konselor',
                        label: TextNunito(
                          text: 'Program Studi',
                          size: 14,
                          fontWeight: Weightenum.REGULAR,
                        ),
                        validator: Validator().notEmpty,
                      ),
                      SizedBox(height: 2.h),
                      OutlinedTextfield(
                        controller: controller.nimController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        hintText: 'Masukkan NIM konselor',
                        label: TextNunito(
                          text: 'NIM',
                          size: 14,
                          fontWeight: Weightenum.REGULAR,
                        ),
                        validator: Validator().notEmpty,
                      ),
                      SizedBox(height: 2.h),
                      OutlinedTextfield(
                        controller: controller.phoneNumberController,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        hintText: 'Masukkan no. hp anda',
                        label: TextNunito(
                          text: 'No. HP',
                          size: 14,
                          fontWeight: Weightenum.REGULAR,
                        ),
                      ),
                      SizedBox(height: 2.h),
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
                      SizedBox(height: 5.h),
                      PrimaryButton(
                        isLoading: controller.isLoading,
                        elevation: 0,
                        label: 'Buat Akun Konselor',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            controller.registerKonselor();
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
