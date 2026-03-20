import 'package:digivizit/core/models/auth/login_response.dart';
import 'package:digivizit/core/models/personel/get_personel_info_response.dart';
import 'package:digivizit/core/providers/app_settings.dart';
import 'package:dio/dio.dart';
import 'package:digivizit/core/common/result.dart';
import 'package:digivizit/core/providers/async_process_manager.dart';
import 'package:digivizit/core/service/base_repository.dart';
import 'package:digivizit/core/service/general_service_enum.dart';

class GeneralService implements BaseRepository {
  final Dio dio;

  GeneralService({required this.dio});
  @override
  Future<Result<LoginResponse>> login({
    required String email,
    required String password,
    bool showLoader = true,
  }) async {
    try {
      Result<LoginResponse>? result;
      final data = {"email": email, "password": password};

      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.post(
            GeneralPathEnum.login.path,
            data: data,
          );
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(
              Failure(
                message: response.statusMessage ?? 'Sunucu hatası',
                raw: response.data,
              ),
            );
            return;
          }
          final model = LoginResponse.fromJson(response.data);
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          LoginResponse? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = LoginResponse.fromJson(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(
              message: errorModel?.message ?? failure.message,
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

  @override
  Future<Result<GetPersonelInfoResponse>> getPersonelInfo({
    bool showLoader = true,
  }) async {
    try {
      Result<GetPersonelInfoResponse>? result;
      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.get(
            GeneralPathEnum.getPersonelInfo.path,
            options: Options(
              headers: {
                "Authorization": "Bearer ${AppSettings.instance.apiToken}",
              },
            ),
          );
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(
              Failure(
                message: response.statusMessage ?? 'Sunucu hatası',
                raw: response.data,
              ),
            );
            return;
          }
          final model = GetPersonelInfoResponse.fromJson(response.data);
          if (model.success == false) {
            result = Result.failure(
              Failure(
                message: model.message?.toString() ?? 'İstasyon Seçilemedi.',
                code: model.data.toString(),
                raw: model,
              ),
            );
            return;
          }
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          GetPersonelInfoResponse? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = GetPersonelInfoResponse.fromJson(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(
              message: errorModel?.message?.toString() ?? failure.message,
              code: errorModel?.data?.toString() ?? failure.code,
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

  /* 

  @override
  Future<Result<BaseResponse>> forgotPassword({required String phoneNumber, bool showLoader = true}) async {
    try {
      Result<BaseResponse>? result;
      var data = {"PhoneNumber": phoneNumber};
      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.post(GeneralPathEnum.forgotPassword.path, data: data);
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(Failure(message: response.statusMessage ?? 'Sunucu hatası', raw: response.data));
            return;
          }
          final model = BaseResponse.fromJson(response.data);
          if (model.error == true) {
            result = Result.failure(
              Failure(message: model.message?.toString() ?? 'Şifremi Unuttum servisinde sorun oluştu.', code: model.code?.toString(), raw: model),
            );
            return;
          }
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          BaseResponse? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = BaseResponse.fromJson(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(
              message: errorModel?.message?.toString() ?? failure.message,
              code: errorModel?.code?.toString() ?? failure.code,
              raw: errorModel ?? failure.raw,
            ),
          );
        }
      }, showLoader: showLoader);
      return result ?? Result.failure(await getAppropriateFailure());
    } on DioException catch (e) {
      return Result.failure(failureFromDio(e));
    } catch (e) {
      return Result.failure(Failure(message: 'Beklenmeyen bir hata oluştu. Lütfen Tekrar deneyiniz.'));
    }
  }

  @override
  Future<Result<StationRegistrationResponse>> stationRegistration({
    required String phoneNumber,
    required String phoneId,
    required String qrData,
    required HardwareInfo hardwareInfo,
    bool showLoader = true,
  }) async {
    try {
      Result<StationRegistrationResponse>? result;
      final data = StationRegistrationRequest(phoneNumber: phoneNumber, phoneId: phoneId, hardwareInfo: hardwareInfo, data: qrData);
      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.post(GeneralPathEnum.stationRegistration.path, data: data);
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(Failure(message: response.statusMessage ?? 'Sunucu hatası', raw: response.data));
            return;
          }
          final model = StationRegistrationResponse.fromJson(response.data);
          if (model.error == true) {
            result = Result.failure(Failure(message: model.message ?? 'İstasyon Kayıt Edilemedi.', code: model.code?.toString(), raw: model));
            return;
          }
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          StationRegistrationResponse? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = StationRegistrationResponse.fromJson(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(message: errorModel?.message ?? failure.message, code: errorModel?.code?.toString() ?? failure.code, raw: errorModel ?? failure.raw),
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

  @override
  Future<Result<BaseResponse>> smsConfirmation({required String phoneNumber, required String code, required int clientType, bool showLoader = true}) async {
    try {
      Result<BaseResponse>? result;
      final data = SmsConfirmRequest(phoneNumber: phoneNumber, code: code, clientType: clientType);
      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.post(GeneralPathEnum.smsConfirm.path, data: data);
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(Failure(message: response.statusMessage ?? 'Sunucu hatası', raw: response.data));
            return;
          }
          final model = BaseResponse.fromJson(response.data);
          if (model.error == true) {
            result = Result.failure(Failure(message: model.message ?? 'SMS Doğrulanamadı.', code: model.code?.toString(), raw: model));
            return;
          }
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          BaseResponse? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = BaseResponse.fromJson(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(message: errorModel?.message ?? failure.message, code: errorModel?.code?.toString() ?? failure.code, raw: errorModel ?? failure.raw),
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

  @override
  Future<Result<BaseResponse>> createPassword({
    required String phoneNumber,
    required String password,
    required String confirmPassword,
    bool showLoader = true,
  }) async {
    try {
      Result<BaseResponse>? result;
      final cryptoPassword = md5.convert(utf8.encode(password));
      final cryptoPasswordConfirm = md5.convert(utf8.encode(confirmPassword));
      final data = {"PhoneNumber": phoneNumber, "Password": cryptoPassword, "ConfirmPassword": cryptoPasswordConfirm};
      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.post(GeneralPathEnum.createPassword.path, data: data);
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(Failure(message: response.statusMessage ?? 'Sunucu hatası', raw: response.data));
            return;
          }
          final model = BaseResponse.fromJson(response.data);
          if (model.error == true) {
            result = Result.failure(Failure(message: model.message ?? 'Şifre Değiştirilemedi.', code: model.code?.toString(), raw: model));
            return;
          }
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          BaseResponse? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = BaseResponse.fromJson(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(message: errorModel?.message ?? failure.message, code: errorModel?.code?.toString() ?? failure.code, raw: errorModel ?? failure.raw),
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

  @override
  Future<Result<BaseResponse>> changePassword({
    required String phoneNumber,
    required String oldPassword,
    required String newPassword,
    bool showLoader = true,
  }) async {
    try {
      Result<BaseResponse>? result;
      final cryptoOldPassword = md5.convert(utf8.encode(oldPassword));
      final cryptoNewPassword = md5.convert(utf8.encode(newPassword));
      final data = {"PhoneNumber": phoneNumber.toString(), "OldPassword": cryptoOldPassword.toString(), "NewPassword": cryptoNewPassword.toString()};
      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.post(
            GeneralPathEnum.changePassword.path,
            data: data,
            options: Options(headers: {"Authorization": "Bearer ${AppSettings.instance.apiToken}"}),
          );
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(Failure(message: response.statusMessage ?? 'Sunucu hatası', raw: response.data));
            return;
          }
          final model = BaseResponse.fromJson(response.data);
          if (model.error == true) {
            result = Result.failure(Failure(message: model.message ?? 'Şifre Değiştirilemedi.', code: model.code?.toString(), raw: model));
            return;
          }
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          BaseResponse? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = BaseResponse.fromJson(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(message: errorModel?.message ?? failure.message, code: errorModel?.code?.toString() ?? failure.code, raw: errorModel ?? failure.raw),
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

  @override
  Future<Result<SelectStationResponse>> selectStation({required int stationId, bool showLoader = true}) async {
    try {
      Result<SelectStationResponse>? result;
      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.post(
            GeneralPathEnum.selectStation.path,
            data: {"ClientStationId": stationId},
            options: Options(headers: {"Authorization": "Bearer ${AppSettings.instance.apiToken}"}),
          );
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(Failure(message: response.statusMessage ?? 'Sunucu hatası', raw: response.data));
            return;
          }
          final model = SelectStationResponse.fromJson(response.data);
          if (model.error == true) {
            result = Result.failure(Failure(message: model.message?.toString() ?? 'İstasyon Seçilemedi.', code: model.code?.toString(), raw: model));
            return;
          }
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          SelectStationResponse? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = SelectStationResponse.fromJson(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(
              message: errorModel?.message?.toString() ?? failure.message,
              code: errorModel?.code?.toString() ?? failure.code,
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

  @override
  Future<Result<GetCurrentShiftResponse>> getCurrentShift({bool showLoader = true}) async {
    try {
      Result<GetCurrentShiftResponse>? result;
      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.get(
            GeneralPathEnum.getCurrentShift.path,
            options: Options(headers: {"Authorization": "Bearer ${AppSettings.instance.apiToken}"}),
          );
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(Failure(message: response.statusMessage ?? 'Sunucu hatası', raw: response.data));
            return;
          }
          final model = GetCurrentShiftResponse.fromJson(response.data);
          if (model.error == true) {
            result = Result.failure(Failure(message: model.message?.toString() ?? 'İstasyon Seçilemedi.', code: model.code?.toString(), raw: model));
            return;
          }
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          GetCurrentShiftResponse? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = GetCurrentShiftResponse.fromJson(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(
              message: errorModel?.message?.toString() ?? failure.message,
              code: errorModel?.code?.toString() ?? failure.code,
              raw: errorModel ?? failure.raw,
            ),
          );
        }
      }, showLoader: showLoader);
      return result ?? Result.failure(await getAppropriateFailure());
    } on DioException catch (e) {
      return Result.failure(failureFromDio(e));
    } catch (e) {
      return Result.failure(Failure(message: 'Beklenmeyen bir hata oluştu. Lütfen Tekrar deneyiniz.'));
    }
  }

  @override
  Future<Result<ServiceResponseModel>> getServices({bool showLoader = true}) async {
    try {
      Result<ServiceResponseModel>? result;
      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.get(
            GeneralPathEnum.getServices.path,
            options: Options(headers: {"Authorization": "Bearer ${AppSettings.instance.apiToken}"}),
          );
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(Failure(message: response.statusMessage ?? 'Sunucu hatası', raw: response.data));
            return;
          }
          final model = ServiceResponseModel.fromJson(response.data);
          if (model.error == true) {
            result = Result.failure(Failure(message: model.message?.toString() ?? 'Servis kayıtları alınamadı.', code: model.code?.toString(), raw: model));
            return;
          }
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          ServiceResponseModel? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = ServiceResponseModel.fromJson(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(
              message: errorModel?.message?.toString() ?? failure.message,
              code: errorModel?.code?.toString() ?? failure.code,
              raw: errorModel ?? failure.raw,
            ),
          );
        }
      }, showLoader: showLoader);
      return result ?? Result.failure(await getAppropriateFailure());
    } on DioException catch (e) {
      return Result.failure(failureFromDio(e));
    } catch (e) {
      return Result.failure(Failure(message: 'Beklenmeyen bir hata oluştu. Lütfen Tekrar deneyiniz.'));
    }
  }

  @override
  Future<Result<CreateServiceResponseModel>> createService({required String password, required String comment, bool showLoader = true}) async {
    try {
      var bytes = utf8.encode(password);
      var cryptoPassword = md5.convert(bytes).toString();
      Result<CreateServiceResponseModel>? result;
      final data = CreateServiceRequestModel(
        password: cryptoPassword,
        data: Data(comment: comment),
      ).toJson();
      debugPrint(data.toString());
      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.post(
            GeneralPathEnum.createService.path,
            data: data,
            options: Options(headers: {"Authorization": "Bearer ${AppSettings.instance.apiToken}", "Content-Type": "application/json"}),
          );
          if (response.statusCode == 200 && response.data != null) {
            final model = CreateServiceResponseModel.fromJson(response.data);
            result = Result.success(model);
            return;
          }
          final serverMsg = (response.data is Map) ? (response.data['message'] as String?) : null;
          result = Result.failure(Failure(message: serverMsg?.trim().isNotEmpty == true ? serverMsg! : 'Servis kayıtları alınamadı.', raw: response.data));
        } on DioException catch (e) {
          result = Result.failure(failureFromDio(e));
        }
      }, showLoader: showLoader);

      return result ?? Result.failure(await getAppropriateFailure());
    } on DioException catch (e) {
      return Result.failure(failureFromDio(e));
    } catch (e) {
      return Result.failure(Failure(message: 'Bilinmeyen hata: $e'));
    }
  }

  @override
  Future<Result<BaseResponse>> closeShift({required String password, bool showLoader = true}) async {
    try {
      var bytes = utf8.encode(password);
      var cryptoPassword = md5.convert(bytes).toString();
      Result<BaseResponse>? result;
      final data = {"Password": cryptoPassword};
      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.post(
            GeneralPathEnum.closeShift.path,
            data: data,
            options: Options(headers: {"Authorization": "Bearer ${AppSettings.instance.apiToken}"}),
          );
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(Failure(message: response.statusMessage ?? 'Sunucu hatası', raw: response.data));
            return;
          }
          final model = BaseResponse.fromJson(response.data);
          if (model.error == true) {
            result = Result.failure(Failure(message: model.message?.toString() ?? 'İstasyon Seçilemedi.', code: model.code?.toString(), raw: model));
            return;
          }
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          BaseResponse? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = BaseResponse.fromJson(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(
              message: errorModel?.message?.toString() ?? failure.message,
              code: errorModel?.code?.toString() ?? failure.code,
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

  @override
  Future<Result<PastShiftListResponse>> getPastShifts({bool showLoader = true}) async {
    try {
      Result<PastShiftListResponse>? result;
      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.get(
            GeneralPathEnum.getPastShifts.path,
            options: Options(headers: {"Authorization": "Bearer ${AppSettings.instance.apiToken}"}),
          );
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(Failure(message: response.statusMessage ?? 'Sunucu hatası', raw: response.data));
            return;
          }
          final model = PastShiftListResponse.fromJson(response.data);
          if (model.error == true) {
            result = Result.failure(Failure(message: model.message?.toString() ?? 'İstasyon Seçilemedi.', code: model.code?.toString(), raw: model));
            return;
          }
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          PastShiftListResponse? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = PastShiftListResponse.fromJson(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(
              message: errorModel?.message?.toString() ?? failure.message,
              code: errorModel?.code?.toString() ?? failure.code,
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

  @override
  Future<Result<PastShiftDetailResponse>> getPastShiftDetail({DateTime? shiftDate, int? shiftNo, bool showLoader = true}) async {
    debugPrint("${GeneralPathEnum.getPastShiftDetail.path}/$shiftNo?shiftDate=${shiftDate?.toIso8601String()}");
    try {
      Result<PastShiftDetailResponse>? result;
      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.get(
            "${GeneralPathEnum.getPastShiftDetail.path}/$shiftNo?shiftDate=${shiftDate?.toIso8601String()}",
            options: Options(headers: {"Authorization": "Bearer ${AppSettings.instance.apiToken}"}),
          );
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(Failure(message: response.statusMessage ?? 'Sunucu hatası', raw: response.data));
            return;
          }
          final model = PastShiftDetailResponse.fromJson(response.data);
          if (model.error == true) {
            result = Result.failure(Failure(message: model.message?.toString() ?? 'İstasyon Seçilemedi.', code: model.code?.toString(), raw: model));
            return;
          }
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          PastShiftDetailResponse? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = PastShiftDetailResponse.fromJson(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(
              message: errorModel?.message?.toString() ?? failure.message,
              code: errorModel?.code?.toString() ?? failure.code,
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

  @override
  Future<Result<ShiftReportsResponse>> getShiftReport({DateTime? shiftDate, int? shiftNo, bool showLoader = true}) async {
    try {
      Result<ShiftReportsResponse>? result;
      final data = {
        "shiftDateTime": shiftDate?.toIso8601String(), //DateTime.now().subtract(const Duration(days: 1)),
        "shiftNumber": shiftNo, //1,
      };
      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.get(
            GeneralPathEnum.getShiftReport.path,
            data: data,
            options: Options(headers: {"Authorization": "Bearer ${AppSettings.instance.apiToken}"}),
          );
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(Failure(message: response.statusMessage ?? 'Sunucu hatası', raw: response.data));
            return;
          }
          final model = ShiftReportsResponse.fromJson(response.data);
          if (model.error == true) {
            result = Result.failure(Failure(message: model.message?.toString() ?? 'İstasyon Seçilemedi.', code: model.code?.toString(), raw: model));
            return;
          }
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          ShiftReportsResponse? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = ShiftReportsResponse.fromJson(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(
              message: errorModel?.message?.toString() ?? failure.message,
              code: errorModel?.code?.toString() ?? failure.code,
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

  @override
  Future<Result<TankStockResponseModel>> getTankStocks({bool showLoader = true}) async {
    try {
      Result<TankStockResponseModel>? result;
      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.get(
            GeneralPathEnum.getTankStock.path,
            options: Options(headers: {"Authorization": "Bearer ${AppSettings.instance.apiToken}"}),
          );
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(Failure(message: response.statusMessage ?? 'Sunucu hatası', raw: response.data));
            return;
          }
          final model = TankStockResponseModel.fromJson(response.data);
          if (model.error == true) {
            result = Result.failure(Failure(message: model.message?.toString() ?? 'Tank kayıtları alınamadı.', code: model.code?.toString(), raw: model));
            return;
          }
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          TankStockResponseModel? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = TankStockResponseModel.fromJson(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(
              message: errorModel?.message?.toString() ?? failure.message,
              code: errorModel?.code?.toString() ?? failure.code,
              raw: errorModel ?? failure.raw,
            ),
          );
        }
      }, showLoader: showLoader);
      return result ?? Result.failure(await getAppropriateFailure());
    } on DioException catch (e) {
      return Result.failure(failureFromDio(e));
    } catch (e) {
      return Result.failure(Failure(message: 'Beklenmeyen bir hata oluştu. Lütfen Tekrar deneyiniz.'));
    }
  }

  @override
  Future<Result<Last30TankStockResponseModel>> getLast30TankStocks({required int tankNo, bool showLoader = true}) async {
    try {
      Result<Last30TankStockResponseModel>? result;
      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.get(
            "${GeneralPathEnum.getLast30TankStock.path}?tankNo=$tankNo",
            options: Options(headers: {"Authorization": "Bearer ${AppSettings.instance.apiToken}"}),
          );
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(Failure(message: response.statusMessage ?? 'Sunucu hatası', raw: response.data));
            return;
          }
          final model = Last30TankStockResponseModel.fromJson(response.data);
          if (model.error == true) {
            result = Result.failure(
              Failure(message: model.message?.toString() ?? 'Son 30 gün tank kayıtları alınamadı.', code: model.code?.toString(), raw: model),
            );
            return;
          }
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          Last30TankStockResponseModel? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = Last30TankStockResponseModel.fromJson(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(
              message: errorModel?.message?.toString() ?? failure.message,
              code: errorModel?.code?.toString() ?? failure.code,
              raw: errorModel ?? failure.raw,
            ),
          );
        }
      }, showLoader: showLoader);
      return result ?? Result.failure(await getAppropriateFailure());
    } on DioException catch (e) {
      return Result.failure(failureFromDio(e));
    } catch (e) {
      return Result.failure(Failure(message: 'Beklenmeyen bir hata oluştu. Lütfen Tekrar deneyiniz.'));
    }
  }

  @override
  Future<Result<SaleReportResponseModel>> getSaleReport({
    required DateTime startDate,
    required DateTime endDate,
    required int period,
    bool showLoader = true,
  }) async {
    try {
      Result<SaleReportResponseModel>? result;
      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.get(
            "${GeneralPathEnum.getSaleReport.path}?StartDate=${startDate.toIso8601String()}&EndDate=${endDate.toIso8601String()}&SalesPeriods=$period",
            options: Options(headers: {"Authorization": "Bearer ${AppSettings.instance.apiToken}"}),
          );
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(Failure(message: response.statusMessage ?? 'Sunucu hatası', raw: response.data));
            return;
          }
          final model = SaleReportResponseModel.fromJson(response.data);
          if (model.error == true) {
            result = Result.failure(Failure(message: model.message?.toString() ?? 'Satış raporu alınamadı.', code: model.code?.toString(), raw: model));
            return;
          }
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          SaleReportResponseModel? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = SaleReportResponseModel.fromJson(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(
              message: errorModel?.message?.toString() ?? failure.message,
              code: errorModel?.code?.toString() ?? failure.code,
              raw: errorModel ?? failure.raw,
            ),
          );
        }
      }, showLoader: showLoader);
      return result ?? Result.failure(await getAppropriateFailure());
    } on DioException catch (e) {
      return Result.failure(failureFromDio(e));
    } catch (e) {
      return Result.failure(Failure(message: 'Beklenmeyen bir hata oluştu. Lütfen Tekrar deneyiniz.'));
    }
  }

  @override
  Future<Result<PlateSaleResponseModel>> getPlateSaleReport({required String plate, bool showLoader = true}) async {
    try {
      Result<PlateSaleResponseModel>? result;
      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.get(
            "${GeneralPathEnum.getPlateSaleReport.path}&plate=$plate",
            options: Options(headers: {"Authorization": "Bearer ${AppSettings.instance.apiToken}"}),
          );
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(Failure(message: response.statusMessage ?? 'Sunucu hatası', raw: response.data));
            return;
          }
          final model = PlateSaleResponseModel.fromJson(response.data);
          if (model.error == true) {
            result = Result.failure(Failure(message: model.message?.toString() ?? 'Satış raporu alınamadı.', code: model.code?.toString(), raw: model));
            return;
          }
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          PlateSaleResponseModel? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = PlateSaleResponseModel.fromJson(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(
              message: errorModel?.message?.toString() ?? failure.message,
              code: errorModel?.code?.toString() ?? failure.code,
              raw: errorModel ?? failure.raw,
            ),
          );
        }
      }, showLoader: showLoader);
      return result ?? Result.failure(await getAppropriateFailure());
    } on DioException catch (e) {
      return Result.failure(failureFromDio(e));
    } catch (e) {
      return Result.failure(Failure(message: 'Beklenmeyen bir hata oluştu. Lütfen Tekrar deneyiniz.'));
    }
  }

  @override
  Future<Result<AnnualSalesResponseModel>> getAnnualSales({required DateTime startDate, required DateTime endDate, bool showLoader = true}) async {
    try {
      Result<AnnualSalesResponseModel>? result;
      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.get(
            "${GeneralPathEnum.getAnnualSales.path}?StartDate=${startDate.toIso8601String()}&EndDate=${endDate.toIso8601String()}& =1.2",
            options: Options(headers: {"Authorization": "Bearer ${AppSettings.instance.apiToken}"}),
          );
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(Failure(message: response.statusMessage ?? 'Sunucu hatası', raw: response.data));
            return;
          }
          final model = AnnualSalesResponseModel.fromJson(response.data);
          if (model.error == true) {
            result = Result.failure(Failure(message: model.message?.toString() ?? 'Satış raporu alınamadı.', code: model.code?.toString(), raw: model));
            return;
          }
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          AnnualSalesResponseModel? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = AnnualSalesResponseModel.fromJson(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(
              message: errorModel?.message?.toString() ?? failure.message,
              code: errorModel?.code?.toString() ?? failure.code,
              raw: errorModel ?? failure.raw,
            ),
          );
        }
      }, showLoader: showLoader);
      return result ?? Result.failure(await getAppropriateFailure());
    } on DioException catch (e) {
      return Result.failure(failureFromDio(e));
    } catch (e) {
      return Result.failure(Failure(message: 'Beklenmeyen bir hata oluştu. Lütfen Tekrar deneyiniz.'));
    }
  }

  @override
  Future<Result<UnitPricesResponse>> getUnitPrices({bool showLoader = true}) async {
    try {
      Result<UnitPricesResponse>? result;
      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.get(
            GeneralPathEnum.getUnitPrice.path,
            options: Options(headers: {"Authorization": "Bearer ${AppSettings.instance.apiToken}"}),
          );
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(Failure(message: response.statusMessage ?? 'Sunucu hatası', raw: response.data));
            return;
          }
          final model = UnitPricesResponse.fromJson(response.data);
          if (model.error == true) {
            result = Result.failure(Failure(message: model.message?.toString() ?? 'İstasyon Seçilemedi.', code: model.code?.toString(), raw: model));
            return;
          }
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          UnitPricesResponse? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = UnitPricesResponse.fromJson(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(
              message: errorModel?.message?.toString() ?? failure.message,
              code: errorModel?.code?.toString() ?? failure.code,
              raw: errorModel ?? failure.raw,
            ),
          );
        }
      }, showLoader: showLoader);
      return result ?? Result.failure(await getAppropriateFailure());
    } on DioException catch (e) {
      return Result.failure(failureFromDio(e));
    } catch (e) {
      return Result.failure(Failure(message: 'Beklenmeyen bir hata oluştu. Lütfen Tekrar deneyiniz.'));
    }
  }

  @override
  Future<Result<SetUnitPriceResponse>> setUnitPrice({
    required List<Map<String, dynamic>> productInfoList,
    required String password,
    required int timeStatusNumber,
    required DateTime dateTime,
    required bool shiftIsClose,
    bool showLoader = true,
  }) async {
    try {
      Result<SetUnitPriceResponse>? result;
      var bytes = utf8.encode(password);
      var cryptoPassword = md5.convert(bytes);

      var data = {
        "Password": cryptoPassword.toString(),
        "Data": {"ProductInfo": productInfoList, "Status": timeStatusNumber, "UpdateTime": dateTime.toIso8601String(), "CloseShift": shiftIsClose},
      };
      debugPrint(data.toString());

      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.post(
            GeneralPathEnum.setUnitPrice.path,
            data: data,
            options: Options(headers: {"Authorization": "Bearer ${AppSettings.instance.apiToken}"}),
          );
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(Failure(message: response.statusMessage ?? 'Sunucu hatası', raw: response.data));
            return;
          }
          final model = SetUnitPriceResponse.fromJson(response.data);
          if (model.error == true) {
            result = Result.failure(Failure(message: model.message?.toString() ?? 'Fiyat güncellenemedi.', code: model.code?.toString(), raw: model));
            return;
          }
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          SetUnitPriceResponse? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = SetUnitPriceResponse.fromJson(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(
              message: errorModel?.message?.toString() ?? failure.message,
              code: errorModel?.code?.toString() ?? failure.code,
              raw: errorModel ?? failure.raw,
            ),
          );
        }
      }, showLoader: showLoader);
      return result ?? Result.failure(await getAppropriateFailure());
    } on DioException catch (e) {
      return Result.failure(failureFromDio(e));
    } catch (e) {
      return Result.failure(Failure(message: 'Beklenmeyen bir hata oluştu. Lütfen Tekrar deneyiniz.'));
    }
  }

  @override
  Future<Result<SessionTokenResponse>> getPaymentSessionToken({bool showLoader = true}) async {
    try {
      Result<SessionTokenResponse>? result;
      String? ip = await AppSettings.instance.getIpAddress();
      var data = {"CustomerIp": ip, "CustomerEmail": "asd@gmail.com", "FullName": "asd"};
      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.post(
            GeneralPathEnum.getPaymentSessionToken.path,
            data: data,
            options: Options(headers: {"Authorization": "Bearer ${AppSettings.instance.apiToken}"}),
          );
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(Failure(message: response.statusMessage ?? 'Sunucu hatası', raw: response.data));
            return;
          }
          final model = SessionTokenResponse.fromJson(response.data);
          if (model.error == true) {
            result = Result.failure(Failure(message: model.message?.toString() ?? 'Oturum tokeni alınamadı.', code: model.code?.toString(), raw: model));
            return;
          }
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          SessionTokenResponse? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = SessionTokenResponse.fromJson(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(
              message: errorModel?.message?.toString() ?? failure.message,
              code: errorModel?.code?.toString() ?? failure.code,
              raw: errorModel ?? failure.raw,
            ),
          );
        }
      }, showLoader: showLoader);
      return result ?? Result.failure(await getAppropriateFailure());
    } on DioException catch (e) {
      return Result.failure(failureFromDio(e));
    } catch (e) {
      return Result.failure(Failure(message: 'Beklenmeyen bir hata oluştu. Lütfen Tekrar deneyiniz.'));
    }
  }

  @override
  Future<Result<OldShiftResponseModel>> getOldShiftReport({bool showLoader = true}) async {
    try {
      Result<OldShiftResponseModel>? result;
      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.get(
            GeneralPathEnum.getOldShiftReport.path,
            options: Options(headers: {"Authorization": "Bearer ${AppSettings.instance.apiToken}"}),
          );
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(Failure(message: response.statusMessage ?? 'Sunucu hatası', raw: response.data));
            return;
          }
          final model = OldShiftResponseModel.fromJson(response.data);
          if (model.error == true) {
            result = Result.failure(Failure(message: model.message?.toString() ?? 'Eski Vardiya Raporu Alınamadı.', code: model.code?.toString(), raw: model));
            return;
          }
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          OldShiftResponseModel? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = OldShiftResponseModel.fromJson(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(
              message: errorModel?.message?.toString() ?? failure.message,
              code: errorModel?.code?.toString() ?? failure.code,
              raw: errorModel ?? failure.raw,
            ),
          );
        }
      }, showLoader: showLoader);
      return result ?? Result.failure(await getAppropriateFailure());
    } on DioException catch (e) {
      return Result.failure(failureFromDio(e));
    } catch (e) {
      return Result.failure(Failure(message: 'Beklenmeyen bir hata oluştu. Lütfen Tekrar deneyiniz.'));
    }
  }

  @override
  Future<Result<HistoryShiftResponseModel>> getHistoryShiftReport({bool showLoader = true}) async {
    try {
      Result<HistoryShiftResponseModel>? result;
      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.get(
            GeneralPathEnum.getHistoryShiftReport.path,
            options: Options(headers: {"Authorization": "Bearer ${AppSettings.instance.apiToken}"}),
          );
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(Failure(message: response.statusMessage ?? 'Sunucu hatası', raw: response.data));
            return;
          }
          final model = HistoryShiftResponseModel.fromJson(response.data);
          if (model.error == true) {
            result = Result.failure(Failure(message: model.message?.toString() ?? 'Eski Vardiya Raporu Alınamadı.', code: model.code?.toString(), raw: model));
            return;
          }
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          HistoryShiftResponseModel? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = HistoryShiftResponseModel.fromJson(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(
              message: errorModel?.message?.toString() ?? failure.message,
              code: errorModel?.code?.toString() ?? failure.code,
              raw: errorModel ?? failure.raw,
            ),
          );
        }
      }, showLoader: showLoader);
      return result ?? Result.failure(await getAppropriateFailure());
    } on DioException catch (e) {
      return Result.failure(failureFromDio(e));
    } catch (e) {
      return Result.failure(Failure(message: 'Beklenmeyen bir hata oluştu. Lütfen Tekrar deneyiniz.'));
    }
  }

  @override
  Future<Result<OldShiftResponseModel>> getHistoryShiftDetailsReport({required DateTime date, required int shiftNo, bool showLoader = true}) async {
    try {
      Result<OldShiftResponseModel>? result;
      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.get(
            "${GeneralPathEnum.getHistoryShiftDetailsReport.path}/$shiftNo?shiftDate=$date",
            options: Options(headers: {"Authorization": "Bearer ${AppSettings.instance.apiToken}"}),
          );
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(Failure(message: response.statusMessage ?? 'Sunucu hatası', raw: response.data));
            return;
          }
          final model = OldShiftResponseModel.fromJson(response.data);
          if (model.error == true) {
            result = Result.failure(Failure(message: model.message?.toString() ?? 'Eski Vardiya Raporu Alınamadı.', code: model.code?.toString(), raw: model));
            return;
          }
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          OldShiftResponseModel? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = OldShiftResponseModel.fromJson(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(
              message: errorModel?.message?.toString() ?? failure.message,
              code: errorModel?.code?.toString() ?? failure.code,
              raw: errorModel ?? failure.raw,
            ),
          );
        }
      }, showLoader: showLoader);
      return result ?? Result.failure(await getAppropriateFailure());
    } on DioException catch (e) {
      return Result.failure(failureFromDio(e));
    } catch (e) {
      return Result.failure(Failure(message: 'Beklenmeyen bir hata oluştu. Lütfen Tekrar deneyiniz.'));
    }
  }

  @override
  Future<Result<PeriodicSumsResponseModel>> getPeriodicSumsReport({bool showLoader = true}) async {
    try {
      Result<PeriodicSumsResponseModel>? result;
      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.get(
            GeneralPathEnum.getPeriodicSumsReport.path,
            options: Options(headers: {"Authorization": "Bearer ${AppSettings.instance.apiToken}"}),
          );
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(Failure(message: response.statusMessage ?? 'Sunucu hatası', raw: response.data));
            return;
          }
          final model = PeriodicSumsResponseModel.fromJson(response.data);
          if (model.error == true) {
            result = Result.failure(
              Failure(message: model.message?.toString() ?? 'Periyodik Toplam Raporu Alınamadı.', code: model.code?.toString(), raw: model),
            );
            return;
          }
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          PeriodicSumsResponseModel? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = PeriodicSumsResponseModel.fromJson(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(
              message: errorModel?.message?.toString() ?? failure.message,
              code: errorModel?.code?.toString() ?? failure.code,
              raw: errorModel ?? failure.raw,
            ),
          );
        }
      }, showLoader: showLoader);
      return result ?? Result.failure(await getAppropriateFailure());
    } on DioException catch (e) {
      return Result.failure(failureFromDio(e));
    } catch (e) {
      return Result.failure(Failure(message: 'Beklenmeyen bir hata oluştu. Lütfen Tekrar deneyiniz.'));
    }
  }

  @override
  Future<Result<StockAverageResponseModel>> getStockAverageReport({bool showLoader = true}) async {
    try {
      Result<StockAverageResponseModel>? result;
      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.get(
            GeneralPathEnum.getStockAverageReport.path,
            options: Options(headers: {"Authorization": "Bearer ${AppSettings.instance.apiToken}"}),
          );
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(Failure(message: response.statusMessage ?? 'Sunucu hatası', raw: response.data));
            return;
          }
          final model = StockAverageResponseModel.fromJson(response.data);
          if (model.error == true) {
            result = Result.failure(
              Failure(message: model.message?.toString() ?? 'Periyodik Toplam Raporu Alınamadı.', code: model.code?.toString(), raw: model),
            );
            return;
          }
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          StockAverageResponseModel? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = StockAverageResponseModel.fromJson(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(
              message: errorModel?.message?.toString() ?? failure.message,
              code: errorModel?.code?.toString() ?? failure.code,
              raw: errorModel ?? failure.raw,
            ),
          );
        }
      }, showLoader: showLoader);
      return result ?? Result.failure(await getAppropriateFailure());
    } on DioException catch (e) {
      return Result.failure(failureFromDio(e));
    } catch (e) {
      return Result.failure(Failure(message: 'Beklenmeyen bir hata oluştu. Lütfen Tekrar deneyiniz.'));
    }
  }

  @override
  Future<Result<ClientUserResponse>> getClientUsers({bool showLoader = true}) async {
    try {
      Result<ClientUserResponse>? result;
      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.get(
            GeneralPathEnum.getClientUsers.path,
            options: Options(headers: {"Authorization": "Bearer ${AppSettings.instance.apiToken}"}),
          );
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(Failure(message: response.statusMessage ?? 'Sunucu hatası', raw: response.data));
            return;
          }
          final model = ClientUserResponse.fromJson(response.data);
          if (model.error == true) {
            result = Result.failure(Failure(message: model.message?.toString() ?? 'Kullanıcı Listesi Alınamadı.', code: model.code?.toString(), raw: model));
            return;
          }
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          ClientUserResponse? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = ClientUserResponse.fromJson(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(
              message: errorModel?.message?.toString() ?? failure.message,
              code: errorModel?.code?.toString() ?? failure.code,
              raw: errorModel ?? failure.raw,
            ),
          );
        }
      }, showLoader: showLoader);
      return result ?? Result.failure(await getAppropriateFailure());
    } on DioException catch (e) {
      return Result.failure(failureFromDio(e));
    } catch (e) {
      return Result.failure(Failure(message: 'Beklenmeyen bir hata oluştu. Lütfen Tekrar deneyiniz.'));
    }
  }

  @override
  Future<Result<UpdateClientUserResponse>> updateClientUser({
    required int id,
    required bool userIsActive,
    required String phoneNumber,
    required String fullName,
    required Map<String, bool> permissions,
    bool showLoader = true,
  }) async {
    try {
      Result<UpdateClientUserResponse>? result;
      var data = {"Id": id, "IsActive": userIsActive, "PhoneNumber": phoneNumber, "FullName": fullName, "Allow": permissions};
      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.post(
            GeneralPathEnum.updateClientUser.path,
            data: data,
            options: Options(headers: {"Authorization": "Bearer ${AppSettings.instance.apiToken}"}),
          );
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(Failure(message: response.statusMessage ?? 'Sunucu hatası', raw: response.data));
            return;
          }
          final model = UpdateClientUserResponse.fromJson(response.data);
          if (model.error == true) {
            result = Result.failure(Failure(message: model.message?.toString() ?? 'Kullanıcı Güncellenemedi.', code: model.code?.toString(), raw: model));
            return;
          }
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          UpdateClientUserResponse? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = UpdateClientUserResponse.fromJson(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(
              message: errorModel?.message?.toString() ?? failure.message,
              code: errorModel?.code?.toString() ?? failure.code,
              raw: errorModel ?? failure.raw,
            ),
          );
        }
      }, showLoader: showLoader);
      return result ?? Result.failure(await getAppropriateFailure());
    } on DioException catch (e) {
      return Result.failure(failureFromDio(e));
    } catch (e) {
      return Result.failure(Failure(message: 'Beklenmeyen bir hata oluştu. Lütfen Tekrar deneyiniz.'));
    }
  }

  @override
  Future<Result<BaseResponse>> deleteClientUser({required int id, bool showLoader = true}) async {
    try {
      Result<BaseResponse>? result;
      var data = {"ClientId": id};
      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.post(
            GeneralPathEnum.deleteClientUser.path,
            data: data,
            options: Options(headers: {"Authorization": "Bearer ${AppSettings.instance.apiToken}"}),
          );
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(Failure(message: response.statusMessage ?? 'Sunucu hatası', raw: response.data));
            return;
          }
          final model = BaseResponse.fromJson(response.data);
          if (model.error == true) {
            result = Result.failure(Failure(message: model.message?.toString() ?? 'Kullanıcı Silinemedi.', code: model.code?.toString(), raw: model));
            return;
          }
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          BaseResponse? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = BaseResponse.fromJson(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(
              message: errorModel?.message?.toString() ?? failure.message,
              code: errorModel?.code?.toString() ?? failure.code,
              raw: errorModel ?? failure.raw,
            ),
          );
        }
      }, showLoader: showLoader);
      return result ?? Result.failure(await getAppropriateFailure());
    } on DioException catch (e) {
      return Result.failure(failureFromDio(e));
    } catch (e) {
      return Result.failure(Failure(message: 'Beklenmeyen bir hata oluştu. Lütfen Tekrar deneyiniz.'));
    }
  }

  @override
  Future<Result<CreateClientUserResponse>> createClientUser({
    required String fullName,
    required String phoneNumber,
    required Map<String, bool> permissions,
    bool showLoader = true,
  }) async {
    try {
      Result<CreateClientUserResponse>? result;
      var data = {"PhoneNumber": phoneNumber, "FullName": fullName, "Allow": permissions};
      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.post(
            GeneralPathEnum.createClientUser.path,
            data: data,
            options: Options(headers: {"Authorization": "Bearer ${AppSettings.instance.apiToken}"}),
          );
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(Failure(message: response.statusMessage ?? 'Sunucu hatası', raw: response.data));
            return;
          }
          final model = CreateClientUserResponse.fromJson(response.data);
          if (model.error == true) {
            result = Result.failure(Failure(message: model.message?.toString() ?? 'Kullanıcı Oluşturulamadı.', code: model.code?.toString(), raw: model));
            return;
          }
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          CreateClientUserResponse? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = CreateClientUserResponse.fromJson(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(
              message: errorModel?.message?.toString() ?? failure.message,
              code: errorModel?.code?.toString() ?? failure.code,
              raw: errorModel ?? failure.raw,
            ),
          );
        }
      }, showLoader: showLoader);
      return result ?? Result.failure(await getAppropriateFailure());
    } on DioException catch (e) {
      return Result.failure(failureFromDio(e));
    } catch (e) {
      return Result.failure(Failure(message: 'Beklenmeyen bir hata oluştu. Lütfen Tekrar deneyiniz.'));
    }
  }

  @override
  Future<Result<MonthlyRefillResponseModel>> getMonthlyRefillReport({
    required int tankNo,
    required int productCode,
    required int month,
    required int year,
    bool showLoader = true,
  }) async {
    try {
      Result<MonthlyRefillResponseModel>? result;
      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.post(
            GeneralPathEnum.getMonthlyRefillReport.path,
            options: Options(headers: {"Authorization": "Bearer ${AppSettings.instance.apiToken}"}),
            data: {"TankNo": tankNo, "UrunKodu": productCode, "Ay": month, "Yil": year},
          );
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(Failure(message: response.statusMessage ?? 'Sunucu hatası', raw: response.data));
            return;
          }
          final model = MonthlyRefillResponseModel.fromJson(response.data);
          if (model.error == true) {
            result = Result.failure(Failure(message: model.message?.toString() ?? 'Satış raporu alınamadı.', code: model.code?.toString(), raw: model));
            return;
          }
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          MonthlyRefillResponseModel? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = MonthlyRefillResponseModel.fromJson(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(
              message: errorModel?.message?.toString() ?? failure.message,
              code: errorModel?.code?.toString() ?? failure.code,
              raw: errorModel ?? failure.raw,
            ),
          );
        }
      }, showLoader: showLoader);
      return result ?? Result.failure(await getAppropriateFailure());
    } on DioException catch (e) {
      return Result.failure(failureFromDio(e));
    } catch (e) {
      return Result.failure(Failure(message: 'Beklenmeyen bir hata oluştu. Lütfen Tekrar deneyiniz.'));
    }
  }

  @override
  Future<Result<EndOfTermStockResponseModel>> getEndOfTankStockReport({required int month, required int year, bool showLoader = true}) async {
    try {
      Result<EndOfTermStockResponseModel>? result;
      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.get(
            '${GeneralPathEnum.getEndOfTermStockReport.path}?Year=$year&Month=$month& =1.2',
            options: Options(headers: {"Authorization": "Bearer ${AppSettings.instance.apiToken}"}),
          );
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(Failure(message: response.statusMessage ?? 'Sunucu hatası', raw: response.data));
            return;
          }
          final model = EndOfTermStockResponseModel.fromJson(response.data);
          if (model.error == true) {
            result = Result.failure(Failure(message: model.message?.toString() ?? 'Satış raporu alınamadı.', code: model.code?.toString(), raw: model));
            return;
          }
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          EndOfTermStockResponseModel? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = EndOfTermStockResponseModel.fromJson(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(
              message: errorModel?.message?.toString() ?? failure.message,
              code: errorModel?.code?.toString() ?? failure.code,
              raw: errorModel ?? failure.raw,
            ),
          );
        }
      }, showLoader: showLoader);
      return result ?? Result.failure(await getAppropriateFailure());
    } on DioException catch (e) {
      return Result.failure(failureFromDio(e));
    } catch (e) {
      return Result.failure(Failure(message: 'Beklenmeyen bir hata oluştu. Lütfen Tekrar deneyiniz.'));
    }
  }

  @override
  Future<Result<CurrentStockStatusResponseModel>> getCurrentStockStatusReport({bool showLoader = true}) async {
    try {
      Result<CurrentStockStatusResponseModel>? result;
      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.get(
            GeneralPathEnum.getCurrentStockStatusReport.path,
            options: Options(headers: {"Authorization": "Bearer ${AppSettings.instance.apiToken}"}),
          );
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(Failure(message: response.statusMessage ?? 'Sunucu hatası', raw: response.data));
            return;
          }
          final model = CurrentStockStatusResponseModel.fromJson(response.data);
          if (model.error == true) {
            result = Result.failure(Failure(message: model.message?.toString() ?? 'Satış raporu alınamadı.', code: model.code?.toString(), raw: model));
            return;
          }
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          CurrentStockStatusResponseModel? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = CurrentStockStatusResponseModel.fromJson(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(
              message: errorModel?.message?.toString() ?? failure.message,
              code: errorModel?.code?.toString() ?? failure.code,
              raw: errorModel ?? failure.raw,
            ),
          );
        }
      }, showLoader: showLoader);
      return result ?? Result.failure(await getAppropriateFailure());
    } on DioException catch (e) {
      return Result.failure(failureFromDio(e));
    } catch (e) {
      return Result.failure(Failure(message: 'Beklenmeyen bir hata oluştu. Lütfen Tekrar deneyiniz.'));
    }
  }

  @override
  Future<Result<StationDeleteResponse>> stationDelete({required int clientStationId, required String password, bool showLoader = true}) async {
    try {
      Result<StationDeleteResponse>? result;
      var bytes = utf8.encode(password);
      var cryptoPassword = md5.convert(bytes);

      var data = {"ClientStationId": clientStationId, "Password": cryptoPassword.toString()};
      await AsyncProcessController.init.run(() async {
        try {
          final response = await dio.post(
            GeneralPathEnum.stationDelete.path,
            data: data,
            options: Options(headers: {"Authorization": "Bearer ${AppSettings.instance.apiToken}"}),
          );
          if (response.data is! Map<String, dynamic>) {
            result = Result.failure(Failure(message: response.statusMessage ?? 'Sunucu hatası', raw: response.data));
            return;
          }
          final model = StationDeleteResponse.fromJson(response.data);
          if (model.error == true) {
            result = Result.failure(Failure(message: model.message?.toString() ?? 'İstasyon silinemedi.', code: model.code?.toString(), raw: model));
            return;
          }
          result = Result.success(model);
        } on DioException catch (e) {
          final failure = failureFromDio(e);
          StationDeleteResponse? errorModel;
          if (e.response?.data is Map<String, dynamic>) {
            try {
              errorModel = StationDeleteResponse.fromJson(e.response!.data);
            } catch (_) {}
          }
          result = Result.failure(
            Failure(
              message: errorModel?.message?.toString() ?? failure.message,
              code: errorModel?.code?.toString() ?? failure.code,
              raw: errorModel ?? failure.raw,
            ),
          );
        }
      }, showLoader: showLoader);
      return result ?? Result.failure(await getAppropriateFailure());
    } on DioException catch (e) {
      return Result.failure(failureFromDio(e));
    } catch (e) {
      return Result.failure(Failure(message: 'Beklenmeyen bir hata oluştu. Lütfen Tekrar deneyiniz.'));
    }
  } */

  /* @override
  Future<Result<List<UserModel>>> login() async {
    try {
      final res = await dio.get(GeneralPathEnum.getUser.path);

      if (res.data is List) {
        final users = (res.data as List).map((e) => UserModel.fromJson(e as Map<String, dynamic>)).toList();
        return Result.success(users);
      }
      return Result.failure(Failure(message: 'Liste formatında veri bekleniyordu'));
    } on DioException catch (e) {
      return Result.failure(Failure(message: e.message ?? 'İstek sırasında hata oluştu', code: e.response?.statusCode?.toString(), raw: e.response?.data));
    } catch (e) {
      return Result.failure(Failure(message: 'Bilinmeyen hata: $e'));
    }
  } */
}
