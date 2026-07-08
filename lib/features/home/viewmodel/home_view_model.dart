import 'dart:io';

import 'package:digivizit/core/common/result.dart';
import 'package:digivizit/core/models/business_cards/business_card_scan_response.dart';
import 'package:digivizit/core/models/business_cards/contacts_response.dart';
import 'package:digivizit/core/models/auth/simple_response.dart';
import 'package:digivizit/core/models/common/page_meta.dart';
import 'package:digivizit/core/models/personel/card_response.dart';
import 'package:digivizit/core/models/personel/profile_response.dart';
import 'package:digivizit/core/models/personel/qr_response.dart';
import 'package:digivizit/core/navigation/navigation_enums.dart';
import 'package:digivizit/core/navigation/navigation_extension.dart';
import 'package:digivizit/core/providers/app_settings.dart';
import 'package:digivizit/core/utils/color_extractor.dart';
import 'package:digivizit/shared/components/bottom_sheet/custom_bottom_sheet_view.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_view_model.g.dart';

class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase with Store {
  @observable
  ProfileResponse? profileResponse;

  @observable
  BusinessCardListResponse? getContactsResponse;

  @observable
  QrResponse? qrResponse;

  @observable
  CardResponse? cardResponse;

  BusinessCardScanResponse? scanResponse;

  int _contactsPage = 1;
  bool isLoadingMoreContacts = false;

  ProfileData? get profile => profileResponse?.data;

  String get profileName {
    final loginName = AppSettings.instance.userName?.trim();
    if (loginName != null && loginName.isNotEmpty) {
      return loginName;
    }

    return '';
  }

  bool get hasMoreContacts =>
      getContactsResponse?.data?.meta?.hasMore ?? false;

  String? get qrPhotoUrl {
    final candidates = [
      qrResponse?.data?.qrPhotoUrl?.trim() ?? '',
      qrResponse?.data?.qrPhotoPreview?.trim() ?? '',
      qrResponse?.data?.qrCodeUrl?.trim() ?? '',
    ];

    for (final candidate in candidates) {
      if (candidate.isNotEmpty) {
        return candidate;
      }
    }

    return null;
  }

  String? get qrShareLink {
    final cardUrl = cardResponse?.data?.cardUrl?.trim() ?? '';
    if (cardUrl.isNotEmpty) {
      return cardUrl;
    }

    final qrCodeUrl = qrResponse?.data?.qrCodeUrl?.trim() ?? '';
    if (qrCodeUrl.isNotEmpty) {
      return qrCodeUrl;
    }

    return null;
  }

  String? get qrPhotoFileName {
    final imageUrl = qrPhotoUrl;
    if (imageUrl != null) {
      final uri = Uri.tryParse(imageUrl);
      final lastSegment = uri?.pathSegments.isNotEmpty == true
          ? uri!.pathSegments.last.trim()
          : '';
      if (lastSegment.isNotEmpty) {
        return lastSegment;
      }
    }

    return 'employee_qr.png';
  }

  void setInitialProfile(ProfileResponse value) {
    profileResponse = value;
  }

  Future<({Color topColor, Color bottomColor})> loadBackgroundColors({
    Color topFallback = const Color(0xFF2D1B69),
    Color bottomFallback = const Color(0xFF1A0F3D),
  }) async {
    final imageUrl = _getFirmImageUrl();
    if (imageUrl == null) {
      return (topColor: topFallback, bottomColor: bottomFallback);
    }

    return ColorExtractor.getGradientColorsFromUrl(
      imageUrl,
      topFallback: topFallback,
      bottomFallback: bottomFallback,
    );
  }

  String? _getFirmImageUrl() {
    final photoUrl = profile?.photoUrl?.trim();
    if (photoUrl != null && photoUrl.isNotEmpty) {
      return photoUrl;
    }

    return null;
  }

  @action
  Future<void> getProfile() async {
    final result = await AppSettings.instance.generalService.getProfile();
    if (result.isSuccess) {
      profileResponse = result.data;
      if (result.data != null) {
        await AppSettings.instance.setProfile(result.data!);
      }
    } else {
      if (result.isFailure && result.error?.code == "401") {
        CustomBottomSheet.errorView(
          title: 'Oturumunuz Sonlandı',
          text: result.error?.message ?? "Oturumunuz sonlandı.",
          onButtonPressed: () => NavigationEnums.login.navigateToPageClear(),
        );
      } else {
        CustomBottomSheet.errorView(text: result.error!.message);
      }
    }
  }

  /// QR/kart bilgisi sık değişmediği için yalnızca ilk açılışta çekilir.
  Future<void> ensureQrAndCardLoaded() async {
    if (qrResponse == null) {
      final qrResult = await AppSettings.instance.generalService.getMyQr();
      if (qrResult.isSuccess) {
        qrResponse = qrResult.data;
      }
    }

    if (cardResponse == null) {
      final cardResult = await AppSettings.instance.generalService.getMyCard();
      if (cardResult.isSuccess) {
        cardResponse = cardResult.data;
      }
    }
  }

  @action
  Future<void> getContactsInfo() async {
    _contactsPage = 1;
    final result = await AppSettings.instance.generalService.getBusinessCards(
      page: _contactsPage,
    );
    if (result.isSuccess) {
      getContactsResponse = result.data;
      if (result.data != null) {
        await AppSettings.instance.setContactsInfo(result.data!);
      }
    } else {
      CustomBottomSheet.errorView(text: result.error!.message);
    }
  }

  @action
  Future<void> loadMoreContacts() async {
    if (isLoadingMoreContacts || !hasMoreContacts) {
      return;
    }

    isLoadingMoreContacts = true;
    final nextPage = _contactsPage + 1;
    final result = await AppSettings.instance.generalService.getBusinessCards(
      page: nextPage,
      showLoader: false,
    );

    if (result.isSuccess && result.data?.data != null) {
      final existingItems = getContactsResponse?.data?.items ?? const [];
      final newItems = result.data!.data!.items ?? const [];
      final merged = result.data!.copyWith(
        data: result.data!.data!.copyWith(
          items: [...existingItems, ...newItems],
        ),
      );
      getContactsResponse = merged;
      await AppSettings.instance.setContactsInfo(merged);
      _contactsPage = nextPage;
    }

    isLoadingMoreContacts = false;
  }

  Future<BusinessCardListResponse?> refreshContactsInfo({
    bool showLoader = false,
  }) async {
    if (!AppSettings.instance.hasActiveToken) {
      return AppSettings.instance.contactsInfo ?? getContactsResponse;
    }

    _contactsPage = 1;
    final result = await AppSettings.instance.generalService.getBusinessCards(
      page: _contactsPage,
      showLoader: showLoader,
    );

    if (result.isSuccess && result.data != null) {
      getContactsResponse = result.data;
      await AppSettings.instance.setContactsInfo(result.data!);
      return result.data;
    }

    if (result.isFailure && result.error?.code == "401") {
      CustomBottomSheet.errorView(
        title: 'Oturumunuz Sonlandı',
        text: result.error?.message ?? "Oturumunuz sonlandı.",
        onButtonPressed: () => NavigationEnums.login.navigateToPageClear(),
      );
      return null;
    }

    if (showLoader && result.error != null) {
      CustomBottomSheet.errorView(text: result.error!.message);
    }

    return AppSettings.instance.contactsInfo ?? getContactsResponse;
  }

  Future<Result<BusinessCardDetailResponse>> getBusinessCardDetail(
    int id,
  ) async {
    return AppSettings.instance.generalService.getBusinessCard(id: id);
  }

  Future<Result<BusinessCardScanResponse>> scanBusinessCard({
    required File imageFile,
    String? engine,
  }) async {
    final result = await AppSettings.instance.generalService.scanBusinessCard(
      imageFile: imageFile,
      engine: engine,
    );

    if (result.isSuccess && result.data != null) {
      scanResponse = result.data;
      return result;
    }

    if (result.isFailure && result.error?.code == "401") {
      CustomBottomSheet.errorView(
        title: 'Oturumunuz Sonlandı',
        text: result.error?.message ?? "Oturumunuz sonlandı.",
        onButtonPressed: () => NavigationEnums.login.navigateToPageClear(),
      );
    } else if (result.error != null) {
      CustomBottomSheet.errorView(text: result.error!.message);
    }

    return result;
  }

  Future<Result<BusinessCardDetailResponse>> createBusinessCard(
    Map<String, dynamic> body,
  ) async {
    return AppSettings.instance.generalService.createBusinessCard(body: body);
  }

  Future<Result<BusinessCardDetailResponse>> updateBusinessCard(
    int id,
    Map<String, dynamic> body,
  ) async {
    return AppSettings.instance.generalService.updateBusinessCard(
      id: id,
      body: body,
    );
  }

  Future<Result<SimpleResponse>> addBusinessCardNote(
    int businessCardId,
    String note,
  ) async {
    return AppSettings.instance.generalService.addBusinessCardNote(
      businessCardId: businessCardId,
      note: note,
    );
  }

  Future<Result<SimpleResponse>> deleteBusinessCardNote(
    int businessCardId,
    int noteId,
  ) async {
    return AppSettings.instance.generalService.deleteBusinessCardNote(
      businessCardId: businessCardId,
      noteId: noteId,
    );
  }

  Future<Result<SimpleResponse>> deleteBusinessCardMedia(
    int businessCardId,
    int mediaId,
  ) async {
    return AppSettings.instance.generalService.deleteBusinessCardMedia(
      businessCardId: businessCardId,
      mediaId: mediaId,
    );
  }

  Future<Result<SimpleResponse>> deleteBusinessCard(int id) async {
    return AppSettings.instance.generalService.deleteBusinessCard(id: id);
  }
}
