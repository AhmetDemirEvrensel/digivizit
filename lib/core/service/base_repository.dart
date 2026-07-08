import 'dart:io';

import 'package:digivizit/core/common/result.dart';
import 'package:digivizit/core/models/appointment/appointment_response.dart';
import 'package:digivizit/core/models/auth/login_response.dart';
import 'package:digivizit/core/models/auth/simple_response.dart';
import 'package:digivizit/core/models/business_cards/business_card_scan_response.dart';
import 'package:digivizit/core/models/business_cards/contacts_response.dart';
import 'package:digivizit/core/models/business_cards/media_upload_response.dart';
import 'package:digivizit/core/models/personel/card_response.dart';
import 'package:digivizit/core/models/personel/profile_response.dart';
import 'package:digivizit/core/models/personel/qr_response.dart';

abstract interface class BaseRepository {
  // ----------- Auth ----------- //
  Future<Result<LoginResponse>> login({
    required String email,
    required String password,
  });
  Future<Result<SimpleResponse>> logout({bool showLoader = true});
  Future<Result<SimpleResponse>> forgotPassword({
    required String email,
    bool showLoader = true,
  });
  Future<Result<SimpleResponse>> resetPassword({
    required String token,
    required String email,
    required String password,
    required String passwordConfirmation,
    bool showLoader = true,
  });

  // ----------- Profil ----------- //
  Future<Result<ProfileResponse>> getProfile({bool showLoader = true});
  Future<Result<ProfileResponse>> updateProfile({
    String? email,
    String? phone,
    String? extensionNumber,
    String? instagramUrl,
    String? linkedinUrl,
    String? appointmentStatus,
    bool showLoader = true,
  });
  Future<Result<ProfileResponse>> uploadProfilePhoto({
    required File photo,
    bool showLoader = true,
  });

  // ----------- QR / Kartvizitim ----------- //
  Future<Result<QrResponse>> getMyQr({bool showLoader = true});
  Future<Result<CardResponse>> getMyCard({bool showLoader = true});

  // ----------- Görüşme Talepleri ----------- //
  Future<Result<AppointmentListResponse>> getAppointmentRequests({
    String? status,
    String? sort,
    String? direction,
    int? perPage,
    int? page,
    bool showLoader = true,
  });
  Future<Result<AppointmentDetailResponse>> getAppointmentRequest({
    required int id,
    bool showLoader = true,
  });
  Future<Result<AppointmentDetailResponse>> approveAppointmentRequest({
    required int id,
    bool showLoader = true,
  });
  Future<Result<AppointmentDetailResponse>> rejectAppointmentRequest({
    required int id,
    bool showLoader = true,
  });

  // ----------- Kartvizit Kütüphanesi ----------- //
  Future<Result<BusinessCardListResponse>> getBusinessCards({
    String? search,
    String? sector,
    int? perPage,
    int? page,
    bool showLoader = true,
  });
  Future<Result<BusinessCardDetailResponse>> getBusinessCard({
    required int id,
    bool showLoader = true,
  });
  Future<Result<BusinessCardScanResponse>> scanBusinessCard({
    required File imageFile,
    String? engine,
    bool showLoader = true,
  });
  Future<Result<MediaUploadResponse>> uploadBusinessCardMedia({
    required File file,
    bool showLoader = true,
  });
  Future<Result<BusinessCardDetailResponse>> createBusinessCard({
    required Map<String, dynamic> body,
    bool showLoader = true,
  });
  Future<Result<BusinessCardDetailResponse>> updateBusinessCard({
    required int id,
    required Map<String, dynamic> body,
    bool showLoader = true,
  });
  Future<Result<SimpleResponse>> addBusinessCardNote({
    required int businessCardId,
    required String note,
    bool showLoader = true,
  });
  Future<Result<SimpleResponse>> deleteBusinessCardNote({
    required int businessCardId,
    required int noteId,
    bool showLoader = true,
  });
  Future<Result<SimpleResponse>> deleteBusinessCardMedia({
    required int businessCardId,
    required int mediaId,
    bool showLoader = true,
  });
  Future<Result<SimpleResponse>> deleteBusinessCard({
    required int id,
    bool showLoader = true,
  });
}
