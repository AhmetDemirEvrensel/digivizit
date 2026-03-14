import 'package:digivizit/core/constants/global_initializer.dart';
import 'package:digivizit/core/navigation/navigation_router.dart';
import 'package:digivizit/core/providers/app_settings.dart';
import 'package:digivizit/core/providers/async_process_manager.dart';
import 'package:digivizit/shared/components/containers/figma_box.dart';
import 'package:digivizit/shared/widgets/async_process_loader.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        key: _navigatorKey,
        title: 'Petech Mobile PRO',
        navigatorObservers: [GlobalInitializer.routeObserver],
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: const TextScaler.linear(1.0)),
            child: Stack(
              children: [
                child!,
                GetBuilder<AsyncProcessController>(
                  builder: (controller) => controller.isRunning
                      ? const AsyncProcessLoader()
                      : const FigmaBox(),
                ),
              ],
            ),
          );
        },
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        onGenerateRoute: NavigationRoute().generateRoute,
        navigatorKey: AppSettings.instance.navigatorKey,
      ),
    );
  }
}
