import 'package:digivizit/core/common/result.dart';
import 'package:digivizit/core/models/auth/login_response.dart';
import 'package:digivizit/core/models/personel/get_personel_info_response.dart';

abstract interface class BaseRepository {
  // ----------- Auth & User ----------- //
  Future<Result<LoginResponse>> login({
    required String email,
    required String password,
  });

  Future<Result<GetPersonelInfoResponse>> getPersonelInfo();

  /* // ----------- Station Registration ----------- //
  Future<Result<StationRegistrationResponse>> stationRegistration({
    required String phoneNumber,
    required String phoneId,
    required String qrData,
    required HardwareInfo hardwareInfo,
    bool showLoader = true,
  });

  // ----------- SMS Confirmation ----------- //
  Future<Result<BaseResponse>> smsConfirmation({required String phoneNumber, required String code, required int clientType, bool showLoader = true});

  // ----------- Create Password ----------- //
  Future<Result<BaseResponse>> createPassword({required String phoneNumber, required String password, required String confirmPassword, bool showLoader = true});

  // ----------- Change Password ----------- //
  Future<Result<BaseResponse>> changePassword({required String phoneNumber, required String oldPassword, required String newPassword, bool showLoader = true});

  // ----------- Forgot Password ----------- //
  Future<Result<BaseResponse>> forgotPassword({required String phoneNumber, bool showLoader = true});

  // ----------- Station ----------- //
  Future<Result<SelectStationResponse>> selectStation({required int stationId, bool showLoader = true});
  Future<Result<StationDeleteResponse>> stationDelete({required int clientStationId, required String password, bool showLoader = true});

  // ----------- Get Current Shift ----------- //
  Future<Result<GetCurrentShiftResponse>> getCurrentShift({bool showLoader = true});

  // ----------- Services ----------- //
  Future<Result<ServiceResponseModel>> getServices({bool showLoader = true});
  Future<Result<CreateServiceResponseModel>> createService({required String password, required String comment});

  // ----------- Unit Prices ----------- //
  Future<Result<UnitPricesResponse>> getUnitPrices({bool showLoader = true});
  Future<Result<SetUnitPriceResponse>> setUnitPrice({
    required List<Map<String, dynamic>> productInfoList,
    required String password,
    required int timeStatusNumber,
    required DateTime dateTime,
    required bool shiftIsClose,
    bool showLoader = true,
  });

  // ----------- Shift ----------- //
  Future<Result<BaseResponse>> closeShift({required String password, bool showLoader = true});
  Future<Result<PastShiftListResponse>> getPastShifts({bool showLoader = true});
  Future<Result<PastShiftDetailResponse>> getPastShiftDetail({DateTime? shiftDate, int? shiftNo, bool showLoader = true});
  Future<Result<ShiftReportsResponse>> getShiftReport({DateTime? shiftDate, int? shiftNo, bool showLoader = true});

  // ----------- Tank Stocks ----------- //
  Future<Result<TankStockResponseModel>> getTankStocks({bool showLoader = true});
  Future<Result<Last30TankStockResponseModel>> getLast30TankStocks({required int tankNo, bool showLoader = true});

  // ----------- Reports ----------- //
  Future<Result<SaleReportResponseModel>> getSaleReport({required DateTime startDate, required DateTime endDate, required int period, bool showLoader = true});
  Future<Result<OldShiftResponseModel>> getOldShiftReport({bool showLoader = true});
  Future<Result<AnnualSalesResponseModel>> getAnnualSales({required DateTime startDate, required DateTime endDate, bool showLoader = true});
  Future<Result<HistoryShiftResponseModel>> getHistoryShiftReport({bool showLoader = true});
  Future<Result<OldShiftResponseModel>> getHistoryShiftDetailsReport({required DateTime date, required int shiftNo, bool showLoader = true});
  Future<Result<PeriodicSumsResponseModel>> getPeriodicSumsReport({bool showLoader = true});
  Future<Result<StockAverageResponseModel>> getStockAverageReport({bool showLoader = true});

  // ----------- Users ----------- //
  Future<Result<ClientUserResponse>> getClientUsers({bool showLoader = true});
  Future<Result<UpdateClientUserResponse>> updateClientUser({
    required int id,
    required bool userIsActive,
    required String phoneNumber,
    required String fullName,
    required Map<String, bool> permissions,
    bool showLoader = true,
  });

  Future<Result<BaseResponse>> deleteClientUser({required int id, bool showLoader = true});

  Future<Result<CreateClientUserResponse>> createClientUser({
    required String fullName,
    required String phoneNumber,
    required Map<String, bool> permissions,
    bool showLoader = true,
  });
  Future<Result<PlateSaleResponseModel>> getPlateSaleReport({required String plate, bool showLoader = true});
  Future<Result<MonthlyRefillResponseModel>> getMonthlyRefillReport({
    required int tankNo,
    required int productCode,
    required int month,
    required int year,
    bool showLoader = true,
  });
  Future<Result<EndOfTermStockResponseModel>> getEndOfTankStockReport({required int month, required int year, bool showLoader = true});
  Future<Result<CurrentStockStatusResponseModel>> getCurrentStockStatusReport({bool showLoader = true});

  // ----------- Payment ----------- //
  Future<Result<SessionTokenResponse>> getPaymentSessionToken({bool showLoader = true}); */
}
