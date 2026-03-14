import 'package:get/get.dart';
import 'package:digivizit/core/providers/app_settings.dart';

class AsyncProcessController extends GetxController {
  bool isRunning = false;

  static AsyncProcessController get init => Get.put(AsyncProcessController());
  static AsyncProcessController get instance => Get.find<AsyncProcessController>();

  void updateIsRunning(bool isRunning) {
    this.isRunning = isRunning;
    update();
  }

  /// Build sırasında çağrılsa bile güvenli update
  /* void _safeUpdate() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      update();
    });
  } */

  Future<void> run(Function() function, {bool showLoader = true}) async {
    if (showLoader) {
      isRunning = true;
      update();
    }
    try {
      await function();
    } catch (e, stackTrace) {
      AppSettings.instance.logger.e(e.toString());
      AppSettings.instance.logger.e(stackTrace.toString());
    }
    if (showLoader) {
      isRunning = false;
      update();
    }
  }
}
