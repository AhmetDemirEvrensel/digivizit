import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:page_transition/page_transition.dart';
import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/enums/app_languages.dart';
import 'package:digivizit/core/models/auth/login_response.dart';
import 'package:digivizit/core/models/business_cards/contacts_response.dart';
import 'package:digivizit/core/models/personel/profile_response.dart';
import 'package:digivizit/core/navigation/navigation_enums.dart';
import 'package:digivizit/core/providers/async_process_manager.dart';
import 'package:digivizit/core/service/dio_client.dart';
import 'package:digivizit/core/service/general_service.dart';
import 'package:digivizit/core/utils/app_sizer.dart';
import 'package:digivizit/core/utils/shared_preferences_manager.dart';

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
  String? userEmail;
  String? sessionPassword;
  ProfileResponse? profile;
  BusinessCardListResponse? contactsInfo;
  bool rememberMe = false;

  // late PackageInfo _info;
  late SharedPreferencesManager _sharedPreferencesManager;
  late Logger logger;
  bool _isHandlingUnauthorized = false;

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  GeneralService get generalService => _generalService;
  bool get canPop => pageStackCount > 1;
  BuildContext? get context => navigatorKey.currentContext;
  SharedPreferencesManager get sharedPreferencesManager =>
      _sharedPreferencesManager;
  bool get hasActiveToken => apiToken?.trim().isNotEmpty ?? false;
  bool get hasPersistedSession => rememberMe && hasActiveToken;

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
    _generalService = GeneralService(dio: DioClient.instance.generalAPI);
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

    rememberMe =
        await _sharedPreferencesManager.getLocalDb<bool>(
          SharedKeys.rememberMe,
        ) ??
        false;
    userName = await _sharedPreferencesManager.getLocalDb<String>(
      SharedKeys.userName,
    );
    userEmail = await _sharedPreferencesManager.getLocalDb<String>(
      SharedKeys.email,
    );
    sessionPassword = await _sharedPreferencesManager.getLocalDb<String>(
      SharedKeys.password,
    );
    apiToken = await _sharedPreferencesManager.getLocalDb<String>(
      SharedKeys.apiToken,
    );
    final savedProfile = await _sharedPreferencesManager.getLocalDb<String>(
      SharedKeys.profileInfo,
    );
    final savedContactsInfo = await _sharedPreferencesManager
        .getLocalDb<String>(SharedKeys.contactsInfo);

    if (savedProfile?.trim().isNotEmpty ?? false) {
      try {
        profile = profileResponseFromJson(savedProfile!);
      } catch (error, stackTrace) {
        logWarning(
          'Saved profile info could not be parsed and will be cleared.',
        );
        logDebug(error.toString());
        logTrace(stackTrace.toString());
        profile = null;
        await _sharedPreferencesManager.removeItemFromLocalDb(
          SharedKeys.profileInfo,
        );
      }
    }

    if (savedContactsInfo?.trim().isNotEmpty ?? false) {
      try {
        contactsInfo = businessCardListResponseFromJson(savedContactsInfo!);
      } catch (error, stackTrace) {
        logWarning(
          'Saved contacts info could not be parsed and will be cleared.',
        );
        logDebug(error.toString());
        logTrace(stackTrace.toString());
        contactsInfo = null;
        await _sharedPreferencesManager.removeItemFromLocalDb(
          SharedKeys.contactsInfo,
        );
      }
    }

    await _cleanupStaleAuthState();
  }

  Future<void> _cleanupStaleAuthState() async {
    if (!hasActiveToken) {
      apiToken = null;
      userName = null;
      sessionPassword = null;
      contactsInfo = null;
      await _sharedPreferencesManager.removeItemFromLocalDb(
        SharedKeys.apiToken,
      );
      await _sharedPreferencesManager.removeItemFromLocalDb(
        SharedKeys.userName,
      );
      await _sharedPreferencesManager.removeItemFromLocalDb(
        SharedKeys.contactsInfo,
      );
    }

    if (!rememberMe) {
      userEmail = null;
      sessionPassword = null;
      contactsInfo = null;
      await _sharedPreferencesManager.saveLocalDb(SharedKeys.rememberMe, false);
      await _sharedPreferencesManager.removeItemFromLocalDb(SharedKeys.email);
      await _sharedPreferencesManager.removeItemFromLocalDb(
        SharedKeys.password,
      );
      await _sharedPreferencesManager.removeItemFromLocalDb(
        SharedKeys.contactsInfo,
      );
    }
  }

  Future<void> setUserFromLogin(
    LoginResponse loginResponse, {
    required String email,
    required String password,
    required bool rememberUser,
  }) async {
    final loginData = loginResponse.data;
    if (loginData == null) {
      return;
    }
    final userDisplayName = loginData.me.user.name.trim();

    userName = userDisplayName;
    userEmail = email;
    sessionPassword = password;
    apiToken = loginData.token;
    rememberMe = rememberUser;

    await _sharedPreferencesManager.saveLocalDb(
      SharedKeys.rememberMe,
      rememberUser,
    );

    if (rememberUser) {
      await _sharedPreferencesManager.saveLocalDb(
        SharedKeys.userName,
        userDisplayName,
      );
      await _sharedPreferencesManager.saveLocalDb(SharedKeys.email, email);
      await _sharedPreferencesManager.saveLocalDb(
        SharedKeys.password,
        password,
      );
      await _sharedPreferencesManager.saveLocalDb(
        SharedKeys.apiToken,
        loginData.token,
      );
      return;
    }

    await _sharedPreferencesManager.removeItemFromLocalDb(SharedKeys.userName);
    await _sharedPreferencesManager.removeItemFromLocalDb(SharedKeys.email);
    await _sharedPreferencesManager.removeItemFromLocalDb(SharedKeys.password);
    await _sharedPreferencesManager.removeItemFromLocalDb(SharedKeys.apiToken);
  }

  Future<void> clearSession() async {
    apiToken = null;
    userName = null;
    userEmail = null;
    sessionPassword = null;
    profile = null;
    contactsInfo = null;
    rememberMe = false;

    await _sharedPreferencesManager.saveLocalDb(SharedKeys.rememberMe, false);
    await _sharedPreferencesManager.removeItemFromLocalDb(SharedKeys.userName);
    await _sharedPreferencesManager.removeItemFromLocalDb(SharedKeys.email);
    await _sharedPreferencesManager.removeItemFromLocalDb(SharedKeys.password);
    await _sharedPreferencesManager.removeItemFromLocalDb(SharedKeys.apiToken);
    await _sharedPreferencesManager.removeItemFromLocalDb(
      SharedKeys.profileInfo,
    );
    await _sharedPreferencesManager.removeItemFromLocalDb(
      SharedKeys.contactsInfo,
    );
  }

  Future<void> setProfile(ProfileResponse value) async {
    profile = value;
    await _sharedPreferencesManager.saveLocalDb(
      SharedKeys.profileInfo,
      profileResponseToJson(value),
    );
  }

  Future<void> setContactsInfo(BusinessCardListResponse value) async {
    contactsInfo = value;
    await _sharedPreferencesManager.saveLocalDb(
      SharedKeys.contactsInfo,
      businessCardListResponseToJson(value),
    );
  }

  Future<void> logout() async {
    try {
      await _generalService.logout(showLoader: false);
    } catch (_) {
      // Yerel oturum temizliğini engellemesin diye sunucu hatası yutuluyor.
    }
    await clearSession();
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      NavigationEnums.login.rawValue,
      (route) => false,
    );
  }

  Future<void> handleUnauthorizedSession() async {
    if (_isHandlingUnauthorized) return;

    _isHandlingUnauthorized = true;
    await clearSession();
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      NavigationEnums.login.rawValue,
      (route) => false,
    );
    _isHandlingUnauthorized = false;
  }
}
