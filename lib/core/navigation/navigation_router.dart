import 'dart:io';

import 'package:digivizit/core/models/personel/get_personel_info_response.dart';
import 'package:digivizit/features/auth/login/view/login_view.dart';
import 'package:digivizit/features/home/view/contact_detail_view.dart';
import 'package:digivizit/features/home/view/contacts_view.dart' hide ActivityModel;
import 'package:digivizit/features/home/view/home_view.dart';
import 'package:digivizit/features/main_navigation/view/main_navigation_view.dart';
import 'package:digivizit/features/splash/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:digivizit/core/navigation/navigation_args.dart';
import 'package:digivizit/core/navigation/navigation_enums.dart';
import 'package:digivizit/core/providers/app_settings.dart';

class NavigationRoute {
  Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    NavigationArgs? navArgs;
    if (args is NavigationArgs) {
      navArgs = args;
    } else if (args != null) {
      navArgs = NavigationArgs(data: args);
    }

    final screenEnum = NavigationEnums.splash.normalValue(routeSettings.name);

    switch (screenEnum) {
      // ------------- Splash View ------------- //

      case NavigationEnums.splash:
        return _buildRoute(
          widget: const SplashView(),
          screenEnum: NavigationEnums.splash,
          navArgs: navArgs,
        );

      // ------------- Login View ------------- //

      case NavigationEnums.login:
        return _buildRoute(
          widget: LoginView(),
          screenEnum: NavigationEnums.login,
          navArgs: navArgs,
        );

      // ------------- Home View ------------- //

      case NavigationEnums.home:
        return _buildRoute(
          widget: HomeView(personelInfo: navArgs?.data as GetPersonelInfoResponse),
          screenEnum: NavigationEnums.home,
          navArgs: navArgs,
        );

      case NavigationEnums.mainNavigation:
        return _buildRoute(
          widget: MainNavigationView(personelInfo: navArgs?.data as GetPersonelInfoResponse),
          screenEnum: NavigationEnums.mainNavigation,
          navArgs: navArgs,
        );

      case NavigationEnums.cardsList:
        return _buildRoute(
          widget: const ContactsView(),
          screenEnum: NavigationEnums.cardsList,
          navArgs: navArgs,
        );

      case NavigationEnums.contactDetail:
        return _buildRoute(
          widget: ContactDetailView(
            contact: ContactDetailModel(
              name: 'name',
              company: 'company',
              position: 'position',
              phone: 'phone',
              email: 'email',
              website: 'website',
              location: 'location',
              sector: 'sector',
              tags: ['Flutter', 'Dart', 'Mobile Development'],
              tagColors: [Colors.blue, Colors.green, Colors.orange],
              businessCardImages: [''],
              activities: [
                ActivityModel(date: 'date', description: 'description'),
              ],
            ),
          ),
          screenEnum: NavigationEnums.contactDetail,
          navArgs: navArgs,
        );

      /* case NavigationEnums.settings:
        return _buildRoute(
          widget: const SettingsView(),
          screenEnum: NavigationEnums.settings,
          navArgs: navArgs,
        ); */

      // ------------- Onboarding View ------------- //

      /* case NavigationEnums.onboarding:
        return _buildRoute(
          widget: const OnboardingView(),
          screenEnum: NavigationEnums.onboarding,
          navArgs: navArgs,
        );

      // ------------- Register View ------------- //

      case NavigationEnums.register:
        return _buildRoute(
          widget: RegisterView(
            isAddStationMode: navArgs?.data as bool? ?? false,
          ),
          screenEnum: NavigationEnums.register,
          navArgs: navArgs,
        );

      // ------------- Home View ------------- //

      case NavigationEnums.home:
        return _buildRoute(
          widget: HomeView(),
          screenEnum: NavigationEnums.home,
          navArgs: navArgs,
        );

      case NavigationEnums.station:
        final data = navArgs?.data as Map<String, dynamic>?;
        return _buildRoute(
          widget: StationView(
            stations: data?['stations'] as List<LoginStation>,
            fromChangeStation: data?['fromChangeStation'] as bool?,
            stationColors: data?['stationColors'] as Map<int, Color>?,
          ),
          screenEnum: NavigationEnums.station,
          navArgs: navArgs,
        );

      case NavigationEnums.tankStockDetail:
        return _buildRoute(
          widget: TankStockDetailView(
            navigationData: navArgs?.data as Map<String, dynamic>,
          ),
          screenEnum: NavigationEnums.tankStockDetail,
          navArgs: navArgs,
        );

      case NavigationEnums.unitPrice:
        return _buildRoute(
          widget: UnitPriceView(
            initialData: navArgs?.data as UnitPricesResponse?,
          ),
          screenEnum: NavigationEnums.unitPrice,
          navArgs: navArgs,
        );

      case NavigationEnums.changeUnitPrice:
        return _buildRoute(
          widget: ChangeUnitPriceView(
            initialData: navArgs?.data as UnitPricesResponse?,
          ),
          screenEnum: NavigationEnums.changeUnitPrice,
          navArgs: navArgs,
        );

      case NavigationEnums.confirmUnitPrice:
        return _buildRoute(
          widget: ConfirmUnitPriceView(
            confirmData: navArgs?.data as ConfirmUnitPriceData?,
          ),
          screenEnum: NavigationEnums.confirmUnitPrice,
          navArgs: navArgs,
        );

      case NavigationEnums.service:
        return _buildRoute(
          widget: const ServiceView(),
          screenEnum: NavigationEnums.service,
          navArgs: navArgs,
        );

      case NavigationEnums.createService:
        return _buildRoute(
          widget: const CreateServiceView(),
          screenEnum: NavigationEnums.createService,
          navArgs: navArgs,
        );

      case NavigationEnums.robiChat:
        return _buildRoute(
          widget: const RobiChatView(),
          screenEnum: NavigationEnums.robiChat,
          navArgs: navArgs,
        );

      // ------------- Home View Subs ------------- //

      case NavigationEnums.shift:
        return _buildRoute(
          widget: const ShiftView(),
          screenEnum: NavigationEnums.shift,
          navArgs: navArgs,
        );

      case NavigationEnums.tankStock:
        return _buildRoute(
          widget: const TankStockView(),
          screenEnum: NavigationEnums.tankStock,
          navArgs: navArgs,
        );

      // ------------- Drawer Menu Items ------------- //
      case NavigationEnums.contact:
        return _buildRoute(
          widget: const ContactView(),
          screenEnum: NavigationEnums.contact,
          navArgs: navArgs,
        );
      case NavigationEnums.reports:
        return _buildRoute(
          widget: const ReportsView(),
          screenEnum: NavigationEnums.reports,
          navArgs: navArgs,
        );

      case NavigationEnums.userDefine:
        return _buildRoute(
          widget: UserDefineView(
            clientUserResponse: navArgs?.data as ClientUserResponse,
          ),
          screenEnum: NavigationEnums.userDefine,
          navArgs: navArgs,
        );

      case NavigationEnums.userUpdate:
        return _buildRoute(
          widget: UserUpdateView(
            user: navArgs?.data as GetClientUsersListModel?,
          ),
          screenEnum: NavigationEnums.userUpdate,
          navArgs: navArgs,
        );

      case NavigationEnums.changePassword:
        return _buildRoute(
          widget: const ChangePasswordView(),
          screenEnum: NavigationEnums.changePassword,
          navArgs: navArgs,
        );

      case NavigationEnums.shortcutManager:
        return _buildRoute(
          widget: const ShortcutManagerView(),
          screenEnum: NavigationEnums.shortcutManager,
          navArgs: navArgs,
        );

      case NavigationEnums.pastShiftList:
        return _buildRoute(
          widget: PastShiftListView(
            pastShifts: navArgs?.data as PastShiftListResponse?,
          ),
          screenEnum: NavigationEnums.pastShiftList,
          navArgs: navArgs,
        );

      case NavigationEnums.pastShiftDetail:
        return _buildRoute(
          widget: PastShiftDetailView(
            pastShiftDetail: navArgs?.data as PastShiftDetailResponse?,
          ),
          screenEnum: NavigationEnums.pastShiftDetail,
          navArgs: navArgs,
        );

      case NavigationEnums.shiftReport:
        final data = navArgs?.data as Map<String, dynamic>?;
        return _buildRoute(
          widget: PdfViewerScreen(
            pdfBytes: data?['pdfBytes'],
            pdfTime: data?['pdfTime'] ?? '',
          ),
          screenEnum: NavigationEnums.shiftReport,
          navArgs: navArgs,
        );
      case NavigationEnums.saleReport:
        return _buildRoute(
          widget: SaleReportsView(
            initialData: navArgs?.data as SaleReportResponseModel?,
          ),
          screenEnum: NavigationEnums.saleReport,
          navArgs: navArgs,
        );

      case NavigationEnums.plateSaleReport:
        return _buildRoute(
          widget: const PlateSaleView(),
          screenEnum: NavigationEnums.plateSaleReport,
          navArgs: navArgs,
        );

      case NavigationEnums.annualSales:
        return _buildRoute(
          widget: AnnualSalesView(
            initialData: navArgs?.data as AnnualSalesResponseModel?,
          ),
          screenEnum: NavigationEnums.annualSales,
          navArgs: navArgs,
        );

      case NavigationEnums.proPayment:
        final data = navArgs?.data as Map<String, dynamic>?;
        return _buildRoute(
          widget: ProPaymentView(paymentUrl: data?['paymentUrl']),
          screenEnum: NavigationEnums.proPayment,
          navArgs: navArgs,
        );

      case NavigationEnums.oldShifts:
        final data = navArgs?.data as Map<String, dynamic>?;
        return _buildRoute(
          widget: OldShiftsView(
            initialData: data?['initialData'] as OldShiftResponseModel?,
            historyData: data?['historyData'] as HistoryShiftResponseModel?,
          ),
          screenEnum: NavigationEnums.oldShifts,
          navArgs: navArgs,
        );

      case NavigationEnums.periodicSums:
        return _buildRoute(
          widget: PeriodicSumsReportView(
            initialData: navArgs?.data as PeriodicSumsResponseModel?,
          ),
          screenEnum: NavigationEnums.periodicSums,
          navArgs: navArgs,
        );
      case NavigationEnums.stockAverageReport:
        return _buildRoute(
          widget: StockAverageReportView(
            initialData: navArgs?.data as StockAverageResponseModel?,
          ),
          screenEnum: NavigationEnums.stockAverageReport,
          navArgs: navArgs,
        );

      case NavigationEnums.monthlyRefill:
        return _buildRoute(
          widget: MonthlyRefillReportView(
            initialData: navArgs?.data as MonthlyRefillResponseModel?,
          ),
          screenEnum: NavigationEnums.monthlyRefill,
          navArgs: navArgs,
        );
      case NavigationEnums.endOfTermStock:
        return _buildRoute(
          widget: EndOfTermStockView(
            initialData: navArgs?.data as EndOfTermStockResponseModel?,
          ),
          screenEnum: NavigationEnums.endOfTermStock,
          navArgs: navArgs,
        );

      case NavigationEnums.currentStockStatusReport:
        return _buildRoute(
          widget: CurrentStockStatusReportView(
            initialData: navArgs?.data as CurrentStockStatusResponseModel?,
          ),
          screenEnum: NavigationEnums.currentStockStatusReport,
          navArgs: navArgs,
        );

      case NavigationEnums.stationManagement:
        return _buildRoute(
          widget: const StationManagementView(),
          screenEnum: NavigationEnums.stationManagement,
          navArgs: navArgs,
        ); */

      /* // ------------- Base Navigation View ------------- //
      case NavigationEnums.carDetailsView:
        return _buildRoute(
          widget: CarDetailsView(vehicle: navArgs?.data as GetVehicleResponse?),
          screenEnum: NavigationEnums.carDetailsView,
          navArgs: navArgs,
        );

      case NavigationEnums.carLiveWatch:
        return _buildRoute(
          widget: CarLiveWatch(vehicle: navArgs?.data as GetVehicleResponse?),
          screenEnum: NavigationEnums.carLiveWatch,
          navArgs: navArgs,
        );

      case NavigationEnums.reports:
        return _buildRoute(
          widget: ReportsView(vehicle: navArgs?.data as GetVehicleResponse?),
          screenEnum: NavigationEnums.reports,
          navArgs: navArgs,
        );

      return _buildRoute(
        widget: EducationSubjectView(
          data: map?['data'],
          id: map?['id'],
        ),
        screenEnum: NavigationEnums.childEducationSubject,
        navArgs: navArgs,
      ); */
    }
  }

  Route<dynamic> _buildRoute({
    required Widget widget,
    required NavigationEnums screenEnum,
    NavigationArgs? navArgs,
  }) {
    if (navArgs?.transitionType != null) {
      final transitionType = navArgs!.transitionType!;
      final duration =
          navArgs.transitionDuration ?? const Duration(milliseconds: 300);
      final childCurrent = navArgs.childCurrent;

      if (_requiresPageTransition(transitionType)) {
        return PageTransition(
          type: _mapToPageTransitionType(transitionType),
          child: widget,
          childCurrent: childCurrent,
          duration: duration,
          reverseDuration: const Duration(milliseconds: 350),
          settings: RouteSettings(
            name: screenEnum.rawValue,
            arguments: navArgs.data,
          ),
          curve: Curves.easeInOut,
        );
      }

      return PageRouteBuilder(
        settings: RouteSettings(
          name: screenEnum.rawValue,
          arguments: navArgs.data,
        ),
        transitionDuration: duration,
        pageBuilder: (_, __, ___) => widget,
        transitionsBuilder: (_, animation, __, child) {
          return _buildSimpleTransition(animation, transitionType, child);
        },
      );
    }

    return PageTransition(
      type: AppSettings.instance.backwardPage,
      child: widget,
      settings: RouteSettings(
        name: screenEnum.rawValue,
        arguments: navArgs?.data,
      ),
      isIos: Platform.isIOS ? true : false,
      duration: const Duration(milliseconds: 450),
      reverseDuration: const Duration(milliseconds: 450),
    );
  }

  bool _requiresPageTransition(TransitionType type) {
    return [
      TransitionType.leftToRightWithFade,
      TransitionType.rightToLeftWithFade,
      TransitionType.leftToRightJoined,
      TransitionType.rightToLeftJoined,
      TransitionType.topToBottomJoined,
      TransitionType.bottomToTopJoined,
      TransitionType.leftToRightPop,
      TransitionType.rightToLeftPop,
      TransitionType.topToBottomPop,
      TransitionType.bottomToTopPop,
    ].contains(type);
  }

  PageTransitionType _mapToPageTransitionType(TransitionType type) {
    switch (type) {
      case TransitionType.leftToRightWithFade:
        return PageTransitionType.leftToRightWithFade;
      case TransitionType.rightToLeftWithFade:
        return PageTransitionType.rightToLeftWithFade;
      case TransitionType.leftToRightJoined:
        return PageTransitionType.leftToRightJoined;
      case TransitionType.rightToLeftJoined:
        return PageTransitionType.rightToLeftJoined;
      case TransitionType.topToBottomJoined:
        return PageTransitionType.topToBottomJoined;
      case TransitionType.bottomToTopJoined:
        return PageTransitionType.bottomToTopJoined;
      case TransitionType.leftToRightPop:
        return PageTransitionType.leftToRightPop;
      case TransitionType.rightToLeftPop:
        return PageTransitionType.rightToLeftPop;
      case TransitionType.topToBottomPop:
        return PageTransitionType.topToBottomPop;
      case TransitionType.bottomToTopPop:
        return PageTransitionType.bottomToTopPop;
      default:
        throw Exception('Unsupported PageTransitionType');
    }
  }

  Widget _buildSimpleTransition(
    Animation<double> animation,
    TransitionType type,
    Widget child,
  ) {
    switch (type) {
      case TransitionType.fade:
        return FadeTransition(opacity: animation, child: child);
      case TransitionType.scale:
        return ScaleTransition(scale: animation, child: child);
      case TransitionType.rotate:
        return RotationTransition(turns: animation, child: child);
      case TransitionType.size:
        return SizeTransition(sizeFactor: animation, child: child);
      case TransitionType.slideLeftToRight:
        return SlideTransition(
          position: animation.drive(
            Tween(
              begin: const Offset(-1.0, 0.0),
              end: Offset.zero,
            ).chain(CurveTween(curve: Curves.easeInOut)),
          ),
          child: child,
        );
      case TransitionType.slideRightToLeft:
        return SlideTransition(
          position: animation.drive(
            Tween(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).chain(CurveTween(curve: Curves.easeInOut)),
          ),
          child: child,
        );
      case TransitionType.slideTopToBottom:
        return SlideTransition(
          position: animation.drive(
            Tween(
              begin: const Offset(0.0, -1.0),
              end: Offset.zero,
            ).chain(CurveTween(curve: Curves.easeInOut)),
          ),
          child: child,
        );
      case TransitionType.slideBottomToTop:
        return SlideTransition(
          position: animation.drive(
            Tween(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).chain(CurveTween(curve: Curves.easeInOut)),
          ),
          child: child,
        );
      default:
        return child;
    }
  }
}
