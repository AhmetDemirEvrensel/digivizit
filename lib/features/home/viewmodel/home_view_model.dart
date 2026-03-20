import 'package:digivizit/core/models/personel/get_personel_info_response.dart';
import 'package:digivizit/core/navigation/navigation_enums.dart';
import 'package:digivizit/core/navigation/navigation_extension.dart';
import 'package:digivizit/core/providers/app_settings.dart';
import 'package:digivizit/shared/components/bottom_sheet/custom_bottom_sheet_view.dart';
import 'package:mobx/mobx.dart';

part 'home_view_model.g.dart';

class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase with Store {
  @observable
  GetPersonelInfoResponse? getPersonelInfoResponse;

  @action
  Future<void> getPersonelInfo() async {
    final result = await AppSettings.instance.generalService.getPersonelInfo();
    if (result.isSuccess) {
      getPersonelInfoResponse = result.data;
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
}
