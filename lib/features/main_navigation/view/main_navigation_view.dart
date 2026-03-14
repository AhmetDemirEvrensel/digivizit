import 'package:digivizit/features/home/view/contacts_view.dart';
import 'package:digivizit/features/home/view/home_view.dart';
import 'package:digivizit/features/home/view/qr_view.dart';
import 'package:digivizit/shared/components/navigation/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({super.key});

  @override
  State<MainNavigationView> createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
  int _currentIndex = 1; // Başlangıçta Kartvizit sayfası

  final List<Widget> _pages = [
    // Kişiler Sayfası
    // Kartvizit Sayfası (Ana Sayfa)
    const HomeView(),
    const QrView(),
    const ContactsView(),
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
