import 'package:digivizit/core/models/appointment/appointment_response.dart';
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
  AppointmentResponse? appointments;

  @action
  Future<void> getAppointments() async {
    final result = await AppSettings.instance.generalService.getAppointments();
    if (result.isSuccess) {
      appointments = result.data;
      NavigationEnums.meetingRequest.navigateToPage(data: result.data);
    } else {
      CustomBottomSheet.errorView(text: result.error!.message);
    }
  }
}
