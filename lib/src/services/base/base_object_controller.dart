import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:simlk_app/src/modules/common/widgets/simlk_snackbar.dart';
import 'package:simlk_app/src/utils/helper/snackbar_state_enum.dart';

import 'base_refresher_status.dart';

abstract class BaseObjectController<T> extends GetxController {
  BaseObjectController({this.id});

  Box<T>? box;
  String? id = "0";
  T? mData;
  String message = "";
  RefresherStatus status = RefresherStatus.initial;

  bool get isInitial => status == RefresherStatus.initial;
  bool get isLoading => status == RefresherStatus.loading;
  bool get isShimmering => isLoading && isEmptyData;
  bool get isEmptyData => status == RefresherStatus.empty || mData == null;
  bool get isSuccess => status == RefresherStatus.success;
  bool get isError => status == RefresherStatus.failed;

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  Future<void> getCacheBox(String hiveConst) async {
    box = Hive.box<T>(hiveConst);
    if (box != null) {
      var obj = box?.get(id);
      setFinishCallbacks(obj);
    }
  }

  Future<void> saveCacheBoxAndFinish(T? data, {String hiveConst = ''}) async {
    box ??= Hive.box<T>(hiveConst);
    box?.put(id, data!);
    setFinishCallbacks(data);
  }

  loadingState() {
    status = RefresherStatus.loading;
    update();
  }

  void _setData(T data) {
    if (data != null) {
      mData = data;
    }
  }

  void setFinishCallbacks(T? data) {
    if (data == null) {
      status = RefresherStatus.empty;
    } else {
      _setData(data);
      status = RefresherStatus.success;
    }
    _finishRefresh();
    update();
  }

  void _setErrorStatus(String message) {
    status = RefresherStatus.failed;
    message = (message.isNotEmpty) ? message : "Something when wrong..";
    Get.showSnackbar(SIMLKSnackbar(
      snackbarMessage: message,
      snackbarStateEnum: SnackbarStateEnum.ERROR,
    ));
  }

  void finishLoadData({String? errorMessage}) {
    _finishRefresh();
    if (errorMessage != null) {
      _setErrorStatus(errorMessage);
    } else {
      status = RefresherStatus.success;
    }
    update();
  }

  void _finishRefresh() {
    if (refreshController.isRefresh) {
      refreshController.refreshCompleted();
    }
    if (refreshController.isLoading) {
      refreshController.loadComplete();
    }
  }
}
