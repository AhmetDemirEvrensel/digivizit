import 'package:digivizit/core/common/result.dart';
import 'package:digivizit/core/models/appointment/appointment_response.dart';
import 'package:digivizit/core/models/common/page_meta.dart';
import 'package:digivizit/core/navigation/navigation_enums.dart';
import 'package:digivizit/core/navigation/navigation_extension.dart';
import 'package:digivizit/core/providers/app_settings.dart';
import 'package:digivizit/shared/components/bottom_sheet/custom_bottom_sheet_view.dart';
import 'package:mobx/mobx.dart';

part 'meeting_request_view_model.g.dart';

class MeetingRequestViewModel = MeetingRequestViewModelBase
    with _$MeetingRequestViewModel;

abstract class MeetingRequestViewModelBase with Store {
  @observable
  AppointmentListResponse? appointments;

  int _currentPage = 1;
  bool isLoadingMoreAppointments = false;

  bool get hasMoreAppointments =>
      appointments?.data?.meta?.hasMore ?? false;

  @action
  Future<void> getAppointmentRequests() async {
    _currentPage = 1;
    final result = await AppSettings.instance.generalService
        .getAppointmentRequests(page: _currentPage);
    if (result.isSuccess) {
      appointments = result.data;
      NavigationEnums.meetingRequest.navigateToPage(data: result.data);
    } else {
      CustomBottomSheet.errorView(text: result.error!.message);
    }
  }

  @action
  Future<void> loadMoreAppointments() async {
    if (isLoadingMoreAppointments || !hasMoreAppointments) {
      return;
    }

    isLoadingMoreAppointments = true;
    final nextPage = _currentPage + 1;
    final result = await AppSettings.instance.generalService
        .getAppointmentRequests(page: nextPage, showLoader: false);

    if (result.isSuccess && result.data?.data != null) {
      final existingItems = appointments?.data?.items ?? const [];
      final newItems = result.data!.data!.items ?? const [];
      appointments = result.data!.copyWith(
        data: result.data!.data!.copyWith(
          items: [...existingItems, ...newItems],
        ),
      );
      _currentPage = nextPage;
    }

    isLoadingMoreAppointments = false;
  }

  Future<Result<AppointmentDetailResponse>> approveAppointment(int id) async {
    final result = await AppSettings.instance.generalService
        .approveAppointmentRequest(id: id);
    if (result.isSuccess) {
      _replaceItem(result.data?.data);
    }
    return result;
  }

  Future<Result<AppointmentDetailResponse>> rejectAppointment(int id) async {
    final result = await AppSettings.instance.generalService
        .rejectAppointmentRequest(id: id);
    if (result.isSuccess) {
      _replaceItem(result.data?.data);
    }
    return result;
  }

  void _replaceItem(AppointmentListItem? updated) {
    if (updated == null || appointments?.data?.items == null) return;

    final items = appointments!.data!.items!
        .map((item) => item.id == updated.id ? updated : item)
        .toList();
    appointments = appointments!.copyWith(
      data: appointments!.data!.copyWith(items: items),
    );
  }
}
