import 'package:digivizit/core/models/business_cards/contacts_response.dart';
import 'package:digivizit/core/models/personel/get_personel_info_response.dart';
import 'package:digivizit/features/home/view/contacts_view.dart';
import 'package:digivizit/features/home/view/home_view.dart';
import 'package:digivizit/features/home/view/qr_view.dart';
import 'package:digivizit/shared/components/navigation/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class MainNavigationView extends StatefulWidget {
  final GetPersonelInfoResponse personelInfo;
  final ContactsResponse contactsResponse;
  const MainNavigationView({super.key, required this.personelInfo, required this.contactsResponse});

  @override
  State<MainNavigationView> createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
  int _currentIndex = 1; // Başlangıçta Kartvizit sayfası

  List<Widget> get _pages => [
    // Kişiler Sayfası
    // Kartvizit Sayfası (Ana Sayfa)
    HomeView(personelInfo: widget.personelInfo),
    const QrView(),
    ContactsView(contactsResponse: widget.contactsResponse,),
    /*
    // Ayarlar Sayfası
    const SettingsView(), */
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
