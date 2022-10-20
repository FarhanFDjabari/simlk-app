import 'package:get/get.dart';
import 'package:simlk_app/src/services/base/base_object_controller.dart';

class StudentReservationDetailController extends BaseObjectController {
  final RxInt processIndex = 1.obs;

  final processes = [
    'Diajukan',
    'Dalam Proses',
    'Penanganan',
    'Selesai',
  ].obs;
}
