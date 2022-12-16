import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:simlk_app/src/data/model/reservation/reservation_schedule.dart';
import 'package:simlk_app/src/modules/common/widgets/simlk_snackbar.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_object_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';
import 'package:simlk_app/src/utils/helper/snackbar_state_enum.dart';

class StudentReservationHistoryDetailController
    extends BaseObjectController<ReservationSchedule> {
  final _port = ReceivePort();
  final RxInt fileReportDownloadProgress = 0.obs;
  final RxBool isDownloading = false.obs;

  @override
  void onInit() {
    getReservationDetail(
        id: int.tryParse(Get.parameters['id'].toString()) ?? 0);
    id = Get.parameters['id'].toString();
    super.onInit();

    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];
      fileReportDownloadProgress(progress);
      update();
    });

    FlutterDownloader.registerCallback(downloadCallback);
  }

  @override
  dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    FlutterDownloader.cancelAll();
    super.dispose();
  }

  Future<void> getReservationDetail({required int id}) async {
    loadingState();
    await client().then((value) {
      value
          .fetchMahasiswaReservationDetail(id: id)
          .validateStatus()
          .then((data) {
        setFinishCallbacks(data.data);
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }

  Future<bool> checkPermission() async {
    var storagePermission = Permission.storage;
    var mediaLibraryPermission = Permission.mediaLibrary;
    if (await storagePermission.request().isDenied ||
        await storagePermission.request().isPermanentlyDenied) {
      Get.showSnackbar(
        SIMLKSnackbar(
          snackbarMessage:
              'Mohon aktifkan izin aplikasi untuk mengakses penyimpanan',
          snackbarStateEnum: SnackbarStateEnum.WARNING,
        ),
      );
      return false;
    }
    if (await mediaLibraryPermission.request().isDenied ||
        await mediaLibraryPermission.request().isPermanentlyDenied) {
      Get.showSnackbar(
        SIMLKSnackbar(
          snackbarMessage:
              'Mohon aktifkan izin aplikasi untuk mengakses penyimpanan media',
          snackbarStateEnum: SnackbarStateEnum.WARNING,
        ),
      );
      return false;
    }
    return true;
  }

  Future<void> downloadReportFile() async {
    if (await checkPermission() == false) {
      return;
    }
    final externalStorageDirectory = await getExternalStorageDirectory();
    final fileName = '${mData?.reportFileUrl?.split("/").last}';
    if (await File("${externalStorageDirectory?.absolute.path}/$fileName")
        .exists()) {
      await OpenFile.open(
          '${externalStorageDirectory?.absolute.path}/$fileName');
    } else if (mData?.reportFileUrl?.isNotEmpty == true) {
      isDownloading(true);
      final taskId = await FlutterDownloader.enqueue(
        url: mData?.reportFileUrl ?? '',
        savedDir: externalStorageDirectory?.absolute.path ??
            "/storage/emulated/0/Download/",
        fileName: fileName,
        showNotification: true,
        openFileFromNotification: true,
        requiresStorageNotLow: false,
      );

      if (taskId != null) {
        isDownloading(false);
        if (await File('${externalStorageDirectory?.absolute.path}/$fileName')
            .exists()) {
          await OpenFile.open(
              '${externalStorageDirectory?.absolute.path}/$fileName');
        }
      }
    }
  }

  @pragma('vm:entry-point')
  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send?.send([id, status, progress]);
  }
}
