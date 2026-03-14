import 'package:flutter/material.dart';

class QrView extends StatelessWidget {
  const QrView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: const Center(
        child: Text(
          'Kartvizit Okutup Backend e gonder OCR ile bilgileri al',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
