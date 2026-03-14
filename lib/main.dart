import 'package:digivizit/app.dart';
import 'package:digivizit/core/constants/app_config.dart';
import 'package:digivizit/core/enums/app_languages.dart';
import 'package:digivizit/core/navigation/navigation_manager.dart';
import 'package:digivizit/core/providers/app_settings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();=
  // Theme datanın font adaptasyonunu sağlıyor
  await ScreenUtil.ensureScreenSize();

  Get.put(AppSettings());
  await AppSettings.instance.init();

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky, // veya immersive
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    MultiProvider(
      providers: [Provider(create: (context) => NavigationService())],
      child: const MyApp(),
    ),
  );
}
