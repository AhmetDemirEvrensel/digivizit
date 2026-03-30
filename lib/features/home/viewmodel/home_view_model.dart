import 'dart:io';

import 'package:digivizit/core/common/result.dart';
import 'package:digivizit/core/models/business_cards/contacts_response.dart';
import 'package:digivizit/core/models/ocr/ocr_response.dart';
import 'package:digivizit/core/models/personel/get_personel_info_response.dart';
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
  GetPersonelInfoResponse? getPersonelInfoResponse;

  @observable
  ContactsResponse? getContactsResponse;

  OcrResponse? ocrResponse;

  Datum? get personel {
    final response = getPersonelInfoResponse;
    if (response == null || response.data.isEmpty) {
      return null;
    }

    return response.data.first;
  }

  String get profileName {
    final loginName = AppSettings.instance.userName?.trim();
    if (loginName != null && loginName.isNotEmpty) {
      return loginName;
    }

    return '';
  }

  String? get qrPhotoUrl {
    final currentPersonel = personel;

    if (currentPersonel == null) {
      return null;
    }

    final candidates = [
      currentPersonel.qrPhoto.originalUrl.trim(),
      currentPersonel.qrPhoto.url?.trim() ?? '',
      currentPersonel.qrPhoto.previewUrl.trim(),
      currentPersonel.qrCodeUrl.trim(),
    ];

    for (final candidate in candidates) {
      if (candidate.isNotEmpty) {
        return candidate;
      }
    }

    return null;
  }

  String? get qrShareLink {
    final currentPersonel = personel;
    if (currentPersonel == null) {
      return null;
    }

    final qrCodeUrl = currentPersonel.qrCodeUrl.trim();
    if (qrCodeUrl.isNotEmpty) {
      return qrCodeUrl;
    }

    return null;
  }

  String? get firmLogoUrl {
    final currentPersonel = personel;
    if (currentPersonel == null) {
      return null;
    }

    final candidates = [
      currentPersonel.firmName.logo.url?.trim() ?? '',
      currentPersonel.firmName.logo.originalUrl.trim(),
      currentPersonel.firmName.logo.previewUrl.trim(),
    ];

    for (final candidate in candidates) {
      if (candidate.isNotEmpty) {
        return candidate;
      }
    }

    return null;
  }

  String? get qrPhotoFileName {
    final currentPersonel = personel;
    if (currentPersonel == null) {
      return null;
    }

    final fileName = currentPersonel.qrPhoto.fileName.trim();
    if (fileName.isNotEmpty) {
      return fileName;
    }

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

  String? get qrPhotoMimeType {
    final currentPersonel = personel;
    if (currentPersonel == null) {
      return null;
    }

    final mimeType = currentPersonel.qrPhoto.mimeType.trim();
    if (mimeType.isNotEmpty) {
      return mimeType;
    }

    return null;
  }

  void setInitialPersonelInfo(GetPersonelInfoResponse value) {
    getPersonelInfoResponse = value;
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
    final currentPersonel = personel;
    if (currentPersonel == null) {
      return null;
    }

    final logoUrl = currentPersonel.firmName.logo.originalUrl.trim();
    if (logoUrl.isNotEmpty) {
      return logoUrl;
    }

    final backgroundUrl = currentPersonel.firmName.mainBackground.originalUrl
        .trim();
    if (backgroundUrl.isNotEmpty) {
      return backgroundUrl;
    }

    return null;
  }

  @action
  Future<void> getPersonelInfo() async {
    final result = await AppSettings.instance.generalService.getPersonelInfo();
    if (result.isSuccess) {
      getPersonelInfoResponse = result.data;
      if (result.data != null) {
        await AppSettings.instance.setPersonelInfo(result.data!);
      }
    } else {
      if (result.isFailure && result.error?.code == "6401") {
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

  @action
  Future<void> getContactsInfo(String email, String password) async {
    final result = await AppSettings.instance.generalService.getContactsInfo(
      email: email,
      password: password,
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

  Future<ContactsResponse?> refreshContactsInfo({
    bool showLoader = false,
  }) async {
    final email = await AppSettings.instance.getCurrentUserEmail();
    final password = await AppSettings.instance.getCurrentPassword();

    if ((email?.trim().isEmpty ?? true) || (password?.isEmpty ?? true)) {
      return AppSettings.instance.contactsInfo ?? getContactsResponse;
    }

    final result = await AppSettings.instance.generalService.getContactsInfo(
      email: email!.trim(),
      password: password!,
      showLoader: showLoader,
    );

    if (result.isSuccess && result.data != null) {
      getContactsResponse = result.data;
      await AppSettings.instance.setContactsInfo(result.data!);
      return result.data;
    }

    if (result.isFailure && result.error?.code == "6401") {
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

  Future<Result<OcrResponse>> getOcrData({
    required File imageFile,
    required String engine,
  }) async {
    final result = await AppSettings.instance.generalService.getOcrData(
      imageFile: imageFile,
      engine: engine,
    );

    if (result.isSuccess && result.data != null) {
      ocrResponse = result.data;
      return result;
    }

    if (result.isFailure && result.error?.code == "6401") {
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
}
