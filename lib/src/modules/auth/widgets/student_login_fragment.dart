import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:simlk_app/src/modules/auth/controller/student_login_controller.dart';
import 'package:simlk_app/src/modules/common/widgets/button/primary_button.dart';
import 'package:simlk_app/src/modules/common/widgets/outlined_textfield.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:simlk_app/src/utils/helper/validator.dart';
import 'package:sizer/sizer.dart';

class StudentLoginFragment extends GetView<StudentLoginController> {
  StudentLoginFragment({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            OutlinedTextfield(
              controller: controller.nimController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              hintText: 'Masukkan NIM anda',
              label: TextNunito(
                text: 'NIM',
                size: 14,
                fontWeight: Weightenum.REGULAR,
              ),
              validator: Validator().notEmpty,
            ),
            SizedBox(height: 5.sp),
            Obx(
              () => OutlinedTextfield(
                controller: controller.passwordController,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                hintText: 'Masukkan password anda',
                isObscured: controller.isObscured.isTrue,
                maxLines: 1,
                label: TextNunito(
                  text: 'Password',
                  size: 14,
                  fontWeight: Weightenum.REGULAR,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.isObscured(!controller.isObscured.value);
                  },
                  icon: controller.isObscured.isTrue
                      ? const Icon(Remix.eye_close_line)
                      : const Icon(Remix.eye_line),
                ),
                validator: Validator().notEmpty,
              ),
            ),
            SizedBox(height: 16.sp),
            GetBuilder<StudentLoginController>(
              init: StudentLoginController(),
              builder: (_) {
                return PrimaryButton(
                  isLoading: controller.isLoading,
                  elevation: 0,
                  label: 'Masuk Sebagai Mahasiswa',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.loginMahasiswa();
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
