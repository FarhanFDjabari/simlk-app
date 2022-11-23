import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/konselor/konselor.dart';
import 'package:simlk_app/src/services/base/base_list_controller.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class CoordinatorReservationHistoryController
    extends BaseListController<Konselor> {
  final dummyData = [
    Konselor(
      name: 'Konselor 1',
      id: 1,
      email: '',
    ),
  ];

  @override
  void onInit() {
    loadingState();
    setFinishCallbacks(dummyData);
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

  void goToDetail({required int id}) {
    Get.toNamed('/coordinator/history/counselor/$id');
  }
}
