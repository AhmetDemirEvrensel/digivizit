import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFFF8F9FB);
  static const Color darkModeColor = Color(0xFF181E2C);

  // Açık tema tasarım tokenları (Blinq-esinli yeniden tasarım)
  static const Color ink = Color(0xFF0F172A); // birincil metin
  static const Color inkSoft = Color(0xFF64748B); // ikincil metin
  static const Color inkFaint = Color(0xFF94A3B8); // ipucu/pasif metin
  static const Color hairline = Color(0xFFE2E8F0); // ince sınırlar
  static const Color surface = Color(0xFFF8F9FB); // sayfa zemini (üst)
  static const Color surfaceAlt = Color(0xFFF1F5F9); // dolgu/ikincil zemin

  static const Color baseWhite = Color(0xFFFFFFFF);
  static const Color baseBlack = Color(0xFF030712);
  static const Color neutral50 = Color(0xFFF7F8F8);
  static const Color neutral100 = Color(0xFFE6E7E9);
  static const Color neutral200 = Color(0xFFD4D6D9);
  static const Color neutral300 = Color(0xFFBFC3C7);
  static const Color neutral400 = Color(0xFFADB3B7);
  static const Color neutral500 = Color(0xFF8C939A);
  static const Color neutral600 = Color(0xFF667079);
  static const Color neutral700 = Color(0xFF404C57);
  static const Color neutral800 = Color(0xFF33404C);
  static const Color neutral900 = Color(0xFF1A2835);
  static const Color neutral950 = Color(0xFF00101F);

  // Primary Color: #3B82F6
  static const Color primary50 = Color(0xFFEFF6FF);
  static const Color primary100 = Color(0xFFDBEAFE);
  static const Color primary200 = Color(0xFFBFDBFE);
  static const Color primary300 = Color(0xFF93C5FD);
  static const Color primary400 = Color(0xFF60A5FA);
  static const Color primary500 = Color(0xFF3B82F6);
  static const Color primary600 = Color(0xFF2563EB);
  static const Color primary700 = Color(0xFF1D4ED8);
  static const Color primary800 = Color(0xFF1E40AF);
  static const Color primary900 = Color(0xFF1E3A8A);
  static const Color primary950 = Color(0xFF172554);

  // Secondary Color: #0F172A
  static const Color secondary50 = Color(0xFFF8FAFC);
  static const Color secondary100 = Color(0xFFF1F5F9);
  static const Color secondary200 = Color(0xFFE2E8F0);
  static const Color secondary300 = Color(0xFFCBD5E1);
  static const Color secondary400 = Color(0xFF94A3B8);
  static const Color secondary500 = Color(0xFF64748B);
  static const Color secondary600 = Color(0xFF475569);
  static const Color secondary700 = Color(0xFF334155);
  static const Color secondary800 = Color(0xFF1E293B);
  static const Color secondary900 = Color(0xFF0F172A);
  static const Color secondary950 = Color(0xFF020617);

  // Tertiary Color: #146DA0
  static const Color tertiary50 = Color(0xFFE8F4FA);
  static const Color tertiary100 = Color(0xFFCEE8F4);
  static const Color tertiary200 = Color(0xFF9DD1E9);
  static const Color tertiary300 = Color(0xFF6CBADF);
  static const Color tertiary400 = Color(0xFF3BA3D4);
  static const Color tertiary500 = Color(0xFF146DA0);
  static const Color tertiary600 = Color(0xFF115D88);
  static const Color tertiary700 = Color(0xFF0E4D70);
  static const Color tertiary800 = Color(0xFF0B3D58);
  static const Color tertiary900 = Color(0xFF082D40);
  static const Color tertiary950 = Color(0xFF041620);

  // Grey Text Color: #979595
  static const Color greyText = Color(0xFF979595);
  static Color borderColor = Color(0xFFFFFFFF).withValues(alpha: 0.30);
  static Color buttonBgColor = Color(0xFFFFFFFF).withValues(alpha: 0.15);

  static const Color positive50 = Color(0xFFE6FAEE);
  static const Color positive100 = Color(0xFFD0F5E1);
  static const Color positive200 = Color(0xFFA2ECC2);
  static const Color positive300 = Color(0xFFA2ECC2);
  static const Color positive400 = Color(0xFF45D985);
  static const Color positive500 = Color(0xFF27BE69);
  static const Color positive600 = Color(0xFF1F9854);
  static const Color positive700 = Color(0xFF17723F);
  static const Color positive800 = Color(0xFF104C2A);
  static const Color positive900 = Color(0xFF104C2A);
  static const Color positive950 = Color(0xFF104C2A);

  static const Color negative50 = Color(0xFFFEECEE);
  static const Color negative100 = Color(0xFFFCD9DE);
  static const Color negative200 = Color(0xFFFAB3BD);
  static const Color negative300 = Color(0xFFF78C9C);
  static const Color negative400 = Color(0xFFF5667A);
  static const Color negative500 = Color(0xFFF2415A);
  static const Color negative600 = Color(0xFFE5102E);
  static const Color negative700 = Color(0xFFAC0C22);
  static const Color negative800 = Color(0xFFAC0C22);
  static const Color negative900 = Color(0xFFAC0C22);
  static const Color negative950 = Color(0xFFAC0C22);

  static const Color warning50 = Color(0xFFFFF8E5);
  static const Color warning100 = Color(0xFFFFF3D1);
  static const Color warning200 = Color(0xFFFFE59E);
  static const Color warning300 = Color(0xFFFFD970);
  static const Color warning400 = Color(0xFFFFCB3D);
  static const Color warning500 = Color(0xFFFFBF0F);
  static const Color warning600 = Color(0xFFD69D00);
  static const Color warning700 = Color(0xFFA37800);
  static const Color warning800 = Color(0xFF6B4F00);
  static const Color warning900 = Color(0xFF382900);
  static const Color warning950 = Color(0xFF382900);

  static const Color info50 = Color(0xFFEBEFFF);
  static const Color info100 = Color(0xFFD6E0FF);
  static const Color info200 = Color(0xFFA8BDFF);
  static const Color info300 = Color(0xFF809DFF);
  static const Color info400 = Color(0xFF527AFF);
  static const Color info500 = Color(0xFF295BFF);
  static const Color info600 = Color(0xFF0037EB);
  static const Color info700 = Color(0xFF002AB3);
  static const Color info800 = Color(0xFF002AB3);
  static const Color info900 = Color(0xFF000E3D);
  static const Color info950 = Color(0xFF000E3D);
}
