import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:simlk_app/src/modules/common/widgets/loading_overlay.dart';
import 'package:simlk_app/src/modules/common/widgets/state_handle_widget.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/modules/history/controllers/counselor/counselor_student_list_controller.dart';
import 'package:simlk_app/src/modules/history/view/supervisor/supervisor_counselor_history_fragment.dart';
import 'package:simlk_app/src/modules/history/view/supervisor/supervisor_reservation_history_fragment.dart';
import 'package:simlk_app/src/res/gen/assets.gen.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:sizer/sizer.dart';

class SupervisorReservationHistoryPage extends StatefulWidget {
  const SupervisorReservationHistoryPage({Key? key}) : super(key: key);

  @override
  State<SupervisorReservationHistoryPage> createState() =>
      _SupervisorReservationHistoryPageState();
}

class _SupervisorReservationHistoryPageState
    extends State<SupervisorReservationHistoryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1);
    super.initState();
  }

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
          text: 'Riwayat Konseling',
          size: 15.sp,
          fontWeight: Weightenum.BOLD,
        ),
        foregroundColor: Resources.color.neutral50,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              key: ValueKey('supervisor'),
              child: TextNunito(
                text: 'Pengawas',
                size: 9.sp,
                fontWeight: Weightenum.SEMIBOLD,
              ),
            ),
            Tab(
              key: ValueKey('counselor'),
              child: TextNunito(
                text: 'Konselor',
                size: 9.sp,
                fontWeight: Weightenum.SEMIBOLD,
              ),
            ),
          ],
          labelColor: Resources.color.neutral50,
          unselectedLabelColor: Resources.color.neutral300,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: Resources.color.indigo100,
          indicatorWeight: 2,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          SupervisorReservationHistoryFragment(),
          SupervisorCounselorHistoryFragment(),
        ],
      ),
    );
  }
}
