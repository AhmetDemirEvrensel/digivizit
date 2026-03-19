import 'package:mobx/mobx.dart';

part 'home_view_model.g.dart';

class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase with Store {
  @observable
  int selectedIndex = 0;

  @action
  void changeTab(int index) {
    selectedIndex = index;
  }
}
