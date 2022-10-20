import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simlk_app/src/modules/auth/widgets/counselor_login_fragment.dart';
import 'package:simlk_app/src/modules/auth/widgets/student_login_fragment.dart';
import 'package:simlk_app/src/modules/common/widgets/app_logo_widget.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:sizer/sizer.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 10.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height: SizerUtil.height * 0.15),
                const AppLogoWidget(),
                SizedBox(height: 16.sp),
                TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(
                      key: ValueKey('student_login'),
                      text: 'Mahasiswa',
                    ),
                    Tab(
                      key: ValueKey('counselor_login'),
                      text: 'Konselor',
                    ),
                  ],
                  labelStyle: GoogleFonts.nunitoSans(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                  labelColor: Resources.color.indigo900,
                  unselectedLabelColor: Resources.color.neutral400,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: Resources.color.indigo700,
                  indicatorWeight: 2,
                  onTap: (index) {
                    // controller.tabIndex(index);
                  },
                ),
                SizedBox(height: 16.sp),
                SizedBox(
                  height: 250.sp,
                  child: TabBarView(
                    controller: _tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      StudentLoginFragment(),
                      CounselorLoginFragment(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
