import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:simlk_app/src/modules/auth/controller/counselor_login_controller.dart';
import 'package:simlk_app/src/modules/common/widgets/button/primary_button.dart';
import 'package:simlk_app/src/modules/common/widgets/outlined_dropdown_textfield.dart';
import 'package:simlk_app/src/modules/common/widgets/outlined_textfield.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:simlk_app/src/utils/helper/validator.dart';
import 'package:sizer/sizer.dart';

class CounselorLoginFragment extends GetView<CounselorLoginController> {
  CounselorLoginFragment({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                OutlinedDropdownTextfield<int>(
                  label: TextNunito(
                    text: 'Masuk Sebagai',
                    size: 14,
                    fontWeight: Weightenum.REGULAR,
                  ),
                  hintText: 'Pengawas/Koordinator/Konselor',
                  items: [
                    DropdownMenuItem(
                      value: 0,
                      child: TextNunito(
                        text: 'Pengawas',
                        size: 13.sp,
                        fontWeight: Weightenum.REGULAR,
                      ),
                    ),
                    DropdownMenuItem(
                      value: 1,
                      child: TextNunito(
                        text: 'Koordinator',
                        size: 13.sp,
                        fontWeight: Weightenum.REGULAR,
                      ),
                    ),
                    DropdownMenuItem(
                      value: 2,
                      child: TextNunito(
                        text: 'Konselor',
                        size: 13.sp,
                        fontWeight: Weightenum.REGULAR,
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    controller.role(value);
                    controller.update();
                  },
                ),
                SizedBox(height: 5.sp),
                OutlinedTextfield(
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  hintText: 'Masukkan email anda',
                  label: TextNunito(
                    text: 'Email',
                    size: 14,
                    fontWeight: Weightenum.REGULAR,
                  ),
                  validator: Validator().email,
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
                GetBuilder<CounselorLoginController>(
                  init: CounselorLoginController(),
                  builder: (_) {
                    return PrimaryButton(
                      isLoading: controller.isLoading,
                      elevation: 0,
                      label:
                          'Masuk Sebagai ${controller.role.value == 0 ? 'Pengawas' : controller.role.value == 1 ? 'Koordinator' : controller.role.value == 2 ? 'Konselor' : 'Lainnya'}',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.loginKonselor();
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
