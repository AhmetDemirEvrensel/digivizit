import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:page_transition/page_transition.dart';
import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/enums/app_languages.dart';
import 'package:digivizit/core/navigation/navigation_enums.dart';
import 'package:digivizit/core/navigation/navigation_extension.dart';
import 'package:digivizit/core/providers/async_process_manager.dart';
import 'package:digivizit/core/service/dio_client.dart';
import 'package:digivizit/core/service/general_service.dart';
import 'package:digivizit/core/utils/app_sizer.dart';
import 'package:digivizit/core/utils/shared_preferences_manager.dart';
import 'package:digivizit/shared/components/bottom_sheet/custom_bottom_sheet_view.dart';

class AppSettings extends GetxController {
  static AppSettings get instance => Get.find<AppSettings>();

  late final GeneralService _generalService;
  // ileri giderken kullanılacak varsayılanlar
  PageTransitionType forwardPage = PageTransitionType.rightToLeftWithFade;
  TransitionType forwardCustom = TransitionType.rightToLeftWithFade;
  Duration forwardDuration = const Duration(milliseconds: 600);

  // geri / clear / backToPage için kullanılacak varsayılanlar
  PageTransitionType backwardPage = PageTransitionType.leftToRightWithFade;
  TransitionType backwardCustom = TransitionType.leftToRightWithFade;
  Duration backwardDuration = const Duration(milliseconds: 350);

  String? currentPage;
  int pageStackCount = 1;
  AppLanguage language = AppLanguage.en;
  String? apiToken;
  String? userName;

  // late PackageInfo _info;
  late SharedPreferencesManager _sharedPreferencesManager;
  late Logger logger;

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  GeneralService get generalService => _generalService;
  bool get canPop => pageStackCount > 1;
  BuildContext? get context => navigatorKey.currentContext;
  SharedPreferencesManager get sharedPreferencesManager =>
      _sharedPreferencesManager;

  /// PopUntil ile veri aktarımı için geçici depolama
  Object? popUntilData;

  void logInfo(String message) => logger.i(message);

  void logWarning(String message) => logger.w(message);

  void logError(String message, {Object? error, StackTrace? stackTrace}) =>
      logger.e(message, error: error, stackTrace: stackTrace);

  void logDebug(String message) => logger.d(message);

  void logTrace(String message) => logger.t(message);

  Future<void> init() async {
    AsyncProcessController.init;
    await loggerInit();
    AppSizer.setup(
      designWidth: 393,
      designHeight: 852,
      defaultCustomFontFamily: "Inter",
      defaultTextColor: AppColors.baseBlack,
    );
    await initSharedReferences();
    /* _generalService = GeneralService(dio: DioClient.instance.generalAPI); */
  }

  Future<void> loggerInit() async {
    logger = Logger(
      filter: DevelopmentFilter(),
      level: kReleaseMode ? Level.off : Level.all,
      output: ConsoleOutput(),
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 0,
        lineLength: 120,
        colors: false,
        printEmojis: true,
        dateTimeFormat: DateTimeFormat.none,
        noBoxingByDefault: true,
        /* noBoxingByDefault: true,
        dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart, */
      ),
    );
  }

  Future<void> initSharedReferences() async {
    _sharedPreferencesManager = SharedPreferencesManager();
    await _sharedPreferencesManager.init();

    userName = await _sharedPreferencesManager.getLocalDb<String>(
      SharedKeys.userName,
    );
  }
}
