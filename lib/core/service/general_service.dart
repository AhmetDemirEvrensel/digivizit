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
import 'package:digivizit/core/providers/async_process_manager.dart';
import 'package:digivizit/core/service/base_repository.dart';
import 'package:digivizit/core/service/general_service_enum.dart';
import 'package:dio/dio.dart';

class GeneralService implements BaseRepository {
  final Dio dio;

  GeneralService({required this.dio});

  /// Ortak istek/parse/hata-yönetimi iskeleti. Her uç noktanın tekrar eden
  /// try/catch + AsyncProcessController + DioException gövdesini tek yerde toplar.
  Future<Result<T>> _request<T>({
    required Future<Response> Function() call,
    required T Function(Map<String, dynamic> json) parse,
    bool Function(T model)? isFailureModel,
    String? Function(T model)? failureMessage,
    bool showLoader = true,
  }) async {
    try {
      Result<T>? result;
      await AsyncProcessController.init.run(() async {
        try {
          final response = await call();
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(
              Failure(
                message: response.statusMessage ?? 'Sunucu hatası',
                raw: response.data,
              ),
            );
            return;
          }
          final model = parse(response.data);
          if (isFailureModel?.call(model) ?? false) {
            result = Result.failure(
              Failure(
                message: failureMessage?.call(model) ?? 'İşlem başarısız.',
                raw: model,
              ),
            );
            return;
          }
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          T? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = parse(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(
              message: errorModel != null
                  ? (failureMessage?.call(errorModel) ?? failure.message)
                  : failure.message,
              code: failure.code,
              raw: errorModel ?? failure.raw,
            ),
          );
        }
      }, showLoader: showLoader);
      return result ?? Result.failure(await getAppropriateFailure());
    } on DioException catch (e) {
      return Result.failure(failureFromDio(e));
    } catch (e) {
      return Result.failure(Failure(message: 'Bilinmeyen hata: $e'));
    }
  }

  Map<String, dynamic> _withoutNulls(Map<String, dynamic> body) {
    final copy = Map<String, dynamic>.from(body);
    copy.removeWhere((key, value) => value == null);
    return copy;
  }

  // ----------- Auth ----------- //

  @override
  Future<Result<LoginResponse>> login({
    required String email,
    required String password,
    bool showLoader = true,
  }) {
    return _request<LoginResponse>(
      call: () => dio.post(
        GeneralPathEnum.login.path,
        data: {"email": email, "password": password},
      ),
      parse: LoginResponse.fromJson,
      isFailureModel: (model) => model.success == false,
      failureMessage: (model) => model.message,
      showLoader: showLoader,
    );
  }

  @override
  Future<Result<SimpleResponse>> logout({bool showLoader = true}) {
    return _request<SimpleResponse>(
      call: () => dio.post(GeneralPathEnum.logout.path),
      parse: SimpleResponse.fromJson,
      isFailureModel: (model) => model.success == false,
      failureMessage: (model) => model.message,
      showLoader: showLoader,
    );
  }

  @override
  Future<Result<SimpleResponse>> forgotPassword({
    required String email,
    bool showLoader = true,
  }) {
    return _request<SimpleResponse>(
      call: () => dio.post(
        GeneralPathEnum.forgotPassword.path,
        data: {"email": email},
      ),
      parse: SimpleResponse.fromJson,
      isFailureModel: (model) => model.success == false,
      failureMessage: (model) => model.message,
      showLoader: showLoader,
    );
  }

  @override
  Future<Result<SimpleResponse>> resetPassword({
    required String token,
    required String email,
    required String password,
    required String passwordConfirmation,
    bool showLoader = true,
  }) {
    return _request<SimpleResponse>(
      call: () => dio.post(
        GeneralPathEnum.resetPassword.path,
        data: {
          "token": token,
          "email": email,
          "password": password,
          "password_confirmation": passwordConfirmation,
        },
      ),
      parse: SimpleResponse.fromJson,
      isFailureModel: (model) => model.success == false,
      failureMessage: (model) => model.message,
      showLoader: showLoader,
    );
  }

  // ----------- Profil ----------- //

  @override
  Future<Result<ProfileResponse>> getProfile({bool showLoader = true}) {
    return _request<ProfileResponse>(
      call: () => dio.get(GeneralPathEnum.profile.path),
      parse: ProfileResponse.fromJson,
      isFailureModel: (model) => model.success == false,
      failureMessage: (model) => model.message,
      showLoader: showLoader,
    );
  }

  @override
  Future<Result<ProfileResponse>> updateProfile({
    String? email,
    String? phone,
    String? extensionNumber,
    String? instagramUrl,
    String? linkedinUrl,
    String? appointmentStatus,
    bool showLoader = true,
  }) {
    return _request<ProfileResponse>(
      call: () => dio.put(
        GeneralPathEnum.profile.path,
        data: _withoutNulls({
          "email": email,
          "phone": phone,
          "extension_number": extensionNumber,
          "instagram_url": instagramUrl,
          "linkedin_url": linkedinUrl,
          "appointment_status": appointmentStatus,
        }),
      ),
      parse: ProfileResponse.fromJson,
      isFailureModel: (model) => model.success == false,
      failureMessage: (model) => model.message,
      showLoader: showLoader,
    );
  }

  @override
  Future<Result<ProfileResponse>> uploadProfilePhoto({
    required File photo,
    bool showLoader = true,
  }) {
    return _request<ProfileResponse>(
      call: () async => dio.post(
        GeneralPathEnum.profilePhoto.path,
        data: FormData.fromMap({
          "photo": await MultipartFile.fromFile(
            photo.path,
            filename: photo.path.split('/').last,
          ),
        }),
        options: Options(contentType: Headers.multipartFormDataContentType),
      ),
      parse: ProfileResponse.fromJson,
      isFailureModel: (model) => model.success == false,
      failureMessage: (model) => model.message,
      showLoader: showLoader,
    );
  }

  // ----------- QR / Kartvizitim ----------- //

  @override
  Future<Result<QrResponse>> getMyQr({bool showLoader = true}) {
    return _request<QrResponse>(
      call: () => dio.get(GeneralPathEnum.myQr.path),
      parse: QrResponse.fromJson,
      isFailureModel: (model) => model.success == false,
      failureMessage: (model) => model.message,
      showLoader: showLoader,
    );
  }

  @override
  Future<Result<CardResponse>> getMyCard({bool showLoader = true}) {
    return _request<CardResponse>(
      call: () => dio.get(GeneralPathEnum.myCard.path),
      parse: CardResponse.fromJson,
      isFailureModel: (model) => model.success == false,
      failureMessage: (model) => model.message,
      showLoader: showLoader,
    );
  }

  // ----------- Görüşme Talepleri ----------- //

  @override
  Future<Result<AppointmentListResponse>> getAppointmentRequests({
    String? status,
    String? sort,
    String? direction,
    int? perPage,
    int? page,
    bool showLoader = true,
  }) {
    return _request<AppointmentListResponse>(
      call: () => dio.get(
        GeneralPathEnum.appointmentRequests.path,
        queryParameters: _withoutNulls({
          "status": status,
          "sort": sort,
          "direction": direction,
          "per_page": perPage,
          "page": page,
        }),
      ),
      parse: AppointmentListResponse.fromJson,
      isFailureModel: (model) => model.success == false,
      failureMessage: (model) => model.message,
      showLoader: showLoader,
    );
  }

  @override
  Future<Result<AppointmentDetailResponse>> getAppointmentRequest({
    required int id,
    bool showLoader = true,
  }) {
    return _request<AppointmentDetailResponse>(
      call: () => dio.get("${GeneralPathEnum.appointmentRequests.path}/$id"),
      parse: AppointmentDetailResponse.fromJson,
      isFailureModel: (model) => model.success == false,
      failureMessage: (model) => model.message,
      showLoader: showLoader,
    );
  }

  @override
  Future<Result<AppointmentDetailResponse>> approveAppointmentRequest({
    required int id,
    bool showLoader = true,
  }) {
    return _request<AppointmentDetailResponse>(
      call: () =>
          dio.post("${GeneralPathEnum.appointmentRequests.path}/$id/approve"),
      parse: AppointmentDetailResponse.fromJson,
      isFailureModel: (model) => model.success == false,
      failureMessage: (model) => model.message,
      showLoader: showLoader,
    );
  }

  @override
  Future<Result<AppointmentDetailResponse>> rejectAppointmentRequest({
    required int id,
    bool showLoader = true,
  }) {
    return _request<AppointmentDetailResponse>(
      call: () =>
          dio.post("${GeneralPathEnum.appointmentRequests.path}/$id/reject"),
      parse: AppointmentDetailResponse.fromJson,
      isFailureModel: (model) => model.success == false,
      failureMessage: (model) => model.message,
      showLoader: showLoader,
    );
  }

  // ----------- Kartvizit Kütüphanesi ----------- //

  @override
  Future<Result<BusinessCardListResponse>> getBusinessCards({
    String? search,
    String? sector,
    int? perPage,
    int? page,
    bool showLoader = true,
  }) {
    return _request<BusinessCardListResponse>(
      call: () => dio.get(
        GeneralPathEnum.businessCards.path,
        queryParameters: _withoutNulls({
          "search": search,
          "sector": sector,
          "per_page": perPage,
          "page": page,
        }),
      ),
      parse: BusinessCardListResponse.fromJson,
      isFailureModel: (model) => model.success == false,
      failureMessage: (model) => model.message,
      showLoader: showLoader,
    );
  }

  @override
  Future<Result<BusinessCardDetailResponse>> getBusinessCard({
    required int id,
    bool showLoader = true,
  }) {
    return _request<BusinessCardDetailResponse>(
      call: () => dio.get("${GeneralPathEnum.businessCards.path}/$id"),
      parse: BusinessCardDetailResponse.fromJson,
      isFailureModel: (model) => model.success == false,
      failureMessage: (model) => model.message,
      showLoader: showLoader,
    );
  }

  @override
  Future<Result<BusinessCardScanResponse>> scanBusinessCard({
    required File imageFile,
    String? engine,
    bool showLoader = true,
  }) {
    return _request<BusinessCardScanResponse>(
      call: () async => dio.post(
        GeneralPathEnum.businessCardScan.path,
        data: FormData.fromMap(
          _withoutNulls({
            "engine": engine,
            "image_file": await MultipartFile.fromFile(
              imageFile.path,
              filename: imageFile.path.split('/').last,
            ),
          }),
        ),
        options: Options(contentType: Headers.multipartFormDataContentType),
      ),
      parse: BusinessCardScanResponse.fromJson,
      isFailureModel: (model) => model.success == false,
      failureMessage: (model) => model.message,
      showLoader: showLoader,
    );
  }

  @override
  Future<Result<MediaUploadResponse>> uploadBusinessCardMedia({
    required File file,
    bool showLoader = true,
  }) {
    return _request<MediaUploadResponse>(
      call: () async => dio.post(
        GeneralPathEnum.businessCardMedia.path,
        data: FormData.fromMap({
          "file": await MultipartFile.fromFile(
            file.path,
            filename: file.path.split('/').last,
          ),
        }),
        options: Options(contentType: Headers.multipartFormDataContentType),
      ),
      parse: MediaUploadResponse.fromJson,
      isFailureModel: (model) => model.success == false,
      failureMessage: (model) => model.message,
      showLoader: showLoader,
    );
  }

  @override
  Future<Result<BusinessCardDetailResponse>> createBusinessCard({
    required Map<String, dynamic> body,
    bool showLoader = true,
  }) {
    return _request<BusinessCardDetailResponse>(
      call: () => dio.post(
        GeneralPathEnum.businessCards.path,
        data: _withoutNulls(body),
      ),
      parse: BusinessCardDetailResponse.fromJson,
      isFailureModel: (model) => model.success == false,
      failureMessage: (model) => model.message,
      showLoader: showLoader,
    );
  }

  @override
  Future<Result<BusinessCardDetailResponse>> updateBusinessCard({
    required int id,
    required Map<String, dynamic> body,
    bool showLoader = true,
  }) {
    return _request<BusinessCardDetailResponse>(
      call: () => dio.put(
        "${GeneralPathEnum.businessCards.path}/$id",
        data: _withoutNulls(body),
      ),
      parse: BusinessCardDetailResponse.fromJson,
      isFailureModel: (model) => model.success == false,
      failureMessage: (model) => model.message,
      showLoader: showLoader,
    );
  }

  @override
  Future<Result<SimpleResponse>> addBusinessCardNote({
    required int businessCardId,
    required String note,
    bool showLoader = true,
  }) {
    return _request<SimpleResponse>(
      call: () => dio.post(
        "${GeneralPathEnum.businessCards.path}/$businessCardId/notes",
        data: {"note": note},
      ),
      parse: SimpleResponse.fromJson,
      isFailureModel: (model) => model.success == false,
      failureMessage: (model) => model.message,
      showLoader: showLoader,
    );
  }

  @override
  Future<Result<SimpleResponse>> deleteBusinessCardNote({
    required int businessCardId,
    required int noteId,
    bool showLoader = true,
  }) {
    return _request<SimpleResponse>(
      call: () => dio.delete(
        "${GeneralPathEnum.businessCards.path}/$businessCardId/notes/$noteId",
      ),
      parse: SimpleResponse.fromJson,
      isFailureModel: (model) => model.success == false,
      failureMessage: (model) => model.message,
      showLoader: showLoader,
    );
  }

  @override
  Future<Result<SimpleResponse>> deleteBusinessCardMedia({
    required int businessCardId,
    required int mediaId,
    bool showLoader = true,
  }) {
    return _request<SimpleResponse>(
      call: () => dio.delete(
        "${GeneralPathEnum.businessCards.path}/$businessCardId/media/$mediaId",
      ),
      parse: SimpleResponse.fromJson,
      isFailureModel: (model) => model.success == false,
      failureMessage: (model) => model.message,
      showLoader: showLoader,
    );
  }

  @override
  Future<Result<SimpleResponse>> deleteBusinessCard({
    required int id,
    bool showLoader = true,
  }) {
    return _request<SimpleResponse>(
      call: () => dio.delete("${GeneralPathEnum.businessCards.path}/$id"),
      parse: SimpleResponse.fromJson,
      isFailureModel: (model) => model.success == false,
      failureMessage: (model) => model.message,
      showLoader: showLoader,
    );
  }
}
