import 'package:digivizit/core/models/business_cards/contacts_response.dart';
import 'package:digivizit/core/models/personel/get_personel_info_response.dart';
import 'package:digivizit/core/providers/app_settings.dart';
import 'package:digivizit/features/home/view/contacts_view.dart';
import 'package:digivizit/features/home/view/home_view.dart';
import 'package:digivizit/features/home/view/qr_view.dart';
import 'package:digivizit/features/home/viewmodel/home_view_model.dart';
import 'package:digivizit/shared/components/navigation/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class MainNavigationView extends StatefulWidget {
  final GetPersonelInfoResponse personelInfo;
  final ContactsResponse contactsResponse;
  const MainNavigationView({
    super.key,
    required this.personelInfo,
    required this.contactsResponse,
  });

  @override
  State<MainNavigationView> createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
  int _currentIndex = 1; // Başlangıçta Kartvizit sayfası
  late ContactsResponse _contactsResponse;
  final HomeViewModel _homeViewModel = HomeViewModel();
  bool _isRefreshingContacts = false;

  @override
  void initState() {
    super.initState();
    _contactsResponse =
        AppSettings.instance.contactsInfo ?? widget.contactsResponse;
    _homeViewModel.getContactsResponse = _contactsResponse;
  }

  List<Widget> get _pages => [
    HomeView(personelInfo: widget.personelInfo),
    QrView(onContactsChanged: _refreshContacts),
    ContactsView(contactsResponse: _contactsResponse),
    /*
    // Ayarlar Sayfası
    const SettingsView(), */
  ];

  Future<void> _refreshContacts({bool showLoader = false}) async {
    if (_isRefreshingContacts) return;

    _isRefreshingContacts = true;
    final refreshedContacts = await _homeViewModel.refreshContactsInfo(
      showLoader: showLoader,
    );
    _isRefreshingContacts = false;

    if (!mounted || refreshedContacts == null) return;

    setState(() {
      _contactsResponse = refreshedContacts;
    });
  }

  void _handleNavigationTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (index == 2) {
      _refreshContacts(showLoader: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _handleNavigationTap,
      ),
    );
  }
}
