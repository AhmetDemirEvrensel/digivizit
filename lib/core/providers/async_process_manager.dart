import 'dart:async';

import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:digivizit/core/providers/app_settings.dart';

class AsyncProcessController extends GetxController {
  bool isRunning = false;
  int _activeProcessCount = 0;
  bool _updateScheduled = false;

  static AsyncProcessController get init => Get.put(AsyncProcessController());
  static AsyncProcessController get instance =>
      Get.find<AsyncProcessController>();

  void updateIsRunning(bool isRunning) {
    this.isRunning = isRunning;
    _safeUpdate();
  }

  void _safeUpdate() {
    if (SchedulerBinding.instance.schedulerPhase !=
        SchedulerPhase.persistentCallbacks) {
      update();
      return;
    }

    if (_updateScheduled) return;
    _updateScheduled = true;
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _updateScheduled = false;
      update();
    });
  }

  Future<void> run(
    FutureOr<void> Function() function, {
    bool showLoader = true,
  }) async {
    if (showLoader) {
      _activeProcessCount++;
      isRunning = true;
      _safeUpdate();
    }

    try {
      await function();
    } catch (e, stackTrace) {
      AppSettings.instance.logger.e(e.toString());
      AppSettings.instance.logger.e(stackTrace.toString());
    } finally {
      if (showLoader) {
        if (_activeProcessCount > 0) _activeProcessCount--;
        isRunning = _activeProcessCount > 0;
        _safeUpdate();
      }
    }
  }
}
