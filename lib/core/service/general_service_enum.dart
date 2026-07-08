// features/general/data/general_path_enum.dart

enum GeneralPathEnum {
  login,
  logout,
  me,
  forgotPassword,
  resetPassword,
  profile,
  profilePhoto,
  myQr,
  myCard,
  appointmentRequests,
  businessCards,
  businessCardScan,
  businessCardMedia,
}

extension GeneralPathEnumExt on GeneralPathEnum {
  String get rawValue {
    switch (this) {
      case GeneralPathEnum.login:
        return 'login';
      case GeneralPathEnum.logout:
        return 'logout';
      case GeneralPathEnum.me:
        return 'me';
      case GeneralPathEnum.forgotPassword:
        return 'forgot-password';
      case GeneralPathEnum.resetPassword:
        return 'reset-password';
      case GeneralPathEnum.profile:
        return 'me/profile';
      case GeneralPathEnum.profilePhoto:
        return 'me/profile/photo';
      case GeneralPathEnum.myQr:
        return 'me/qr';
      case GeneralPathEnum.myCard:
        return 'me/card';
      case GeneralPathEnum.appointmentRequests:
        return 'appointment-requests';
      case GeneralPathEnum.businessCards:
        return 'business-cards';
      case GeneralPathEnum.businessCardScan:
        return 'business-cards/scan';
      case GeneralPathEnum.businessCardMedia:
        return 'business-cards/media';
    }
  }

  String get path {
    return rawValue;
  }
}
