import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/konselor/konselor.dart';
import 'package:simlk_app/src/modules/common/widgets/simlk_profile_dialog.dart';
import 'package:simlk_app/src/services/base/base_list_controller.dart';

class CoordinatorCounselorAssignController
    extends BaseListController<Konselor> {
  final dummyData = [
    Konselor(
      id: 1,
      name: 'Konselor 1',
      email: 'konselor@email.com',
      major: 'SI',
    ),
    Konselor(
      id: 2,
      name: 'Konselor 2',
      email: 'konselo2r@email.com',
      major: 'TIF',
    ),
  ];

  @override
  void onInit() {
    loadingState();
    Future.delayed(const Duration(milliseconds: 750), () {
      setFinishCallbacks(dummyData);
    });
    super.onInit();
  }

  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    // TODO: implement refreshPage
  }
}
