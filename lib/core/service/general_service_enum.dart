// features/general/data/general_path_enum.dart

enum GeneralPathEnum {
  login,
  getPersonelInfo,
  getContactsInfo,
  /*   
  stationRegistration,
  stationDelete,
  smsConfirm,
  createPassword,
  changePassword,
  forgotPassword,
  selectStation,
  getCurrentShift,
  getServices,
  createService,
  closeShift,
  getPastShifts,
  getPastShiftDetail,
  getShiftReport,
  getTankStock,
  getLast30TankStock,
  getSaleReport,
  getPlateSaleReport,
  getAnnualSales,
  getUnitPrice,
  setUnitPrice,
  getPaymentSessionToken,
  getOldShiftReport,
  getHistoryShiftReport,
  getHistoryShiftDetailsReport,
  getPeriodicSumsReport,
  getStockAverageReport,
  getClientUsers,
  updateClientUser,
  deleteClientUser,
  createClientUser,
  getMonthlyRefillReport,
  getEndOfTermStockReport,
  getCurrentStockStatusReport, */
}

extension GeneralPathEnumExt on GeneralPathEnum {
  String get rawValue {
    switch (this) {
      case GeneralPathEnum.login:
        return 'login';
      case GeneralPathEnum.getPersonelInfo:
        return 'v1/employees';
      case GeneralPathEnum.getContactsInfo:
        return 'v1/business-cards';
      /* 
      case GeneralPathEnum.stationRegistration:
        return '38e1ba807fbb7bff18a49699a4147521';
      case GeneralPathEnum.smsConfirm:
        return 'de52560ded811a14cc6299777e4098c3';
      case GeneralPathEnum.createPassword:
        return '34f1284482574e5902bc469fcba4e7ab';
      case GeneralPathEnum.forgotPassword:
        return 'efe91fe562e94ed0f8445cf50dffb237';
      case GeneralPathEnum.changePassword:
        return 'ee39f2e480d9b6211fe3259539e7589b';
      case GeneralPathEnum.selectStation:
        return '795eb008525850e3cce0e2a94dcd37f6';
      case GeneralPathEnum.getCurrentShift:
        return '1c8038b6af452be7a3cdd04de842a59b';
      case GeneralPathEnum.getServices:
        return 'e9d82a6277dd30d0baec925f7610435c';
      case GeneralPathEnum.createService:
        return 'e64da0e8a0d83d08f15a52eb4d69c2c8';
      case GeneralPathEnum.getUnitPrice:
        return 'ef488e332a6c9337b886fe3fd44a8d00';
      case GeneralPathEnum.closeShift:
        return 'b4ef506035ff083bad4d80e5affa6c07';
      case GeneralPathEnum.getPastShifts:
        return '64fcce8182fb4535f30f83f5451a0297';
      case GeneralPathEnum.getPastShiftDetail:
        return '55b915e7e5af978e29bd8413dbcdd9fb';
      case GeneralPathEnum.getShiftReport:
        return 'af398a2929047b813255ca32524d521b';
      case GeneralPathEnum.getTankStock:
        return '0dd0ce017f3c1e12b9e6cfc81aab49cc';
      case GeneralPathEnum.getLast30TankStock:
        return '0d234f78d03df72ee5546c938e8f868b';
      case GeneralPathEnum.getSaleReport:
        return 'f73027cd72abd125720076c3d3503e47';
      case GeneralPathEnum.getPlateSaleReport:
        return '390834a5536369e4a001199c75c777e7';
      case GeneralPathEnum.getAnnualSales:
        return '4e3cde5564b133f4e0f440f174a309f8';
      case GeneralPathEnum.setUnitPrice:
        return 'ac54d9766cf31f5c7b56968e49ced965';
      case GeneralPathEnum.getPaymentSessionToken:
        return '5ea721885eaf861ff894ef0010f1037e';
      case GeneralPathEnum.getOldShiftReport:
        return '1c8038b6af452be7a3cdd04de842a59b';
      case GeneralPathEnum.getHistoryShiftReport:
        return '64fcce8182fb4535f30f83f5451a0297';
      case GeneralPathEnum.getHistoryShiftDetailsReport:
        return '55b915e7e5af978e29bd8413dbcdd9fb';
      case GeneralPathEnum.getPeriodicSumsReport:
        return '5a310c44e511ae8e40b44ac4f099d80d';
      case GeneralPathEnum.getStockAverageReport:
        return '0542ee12ae8bc63bee1944a9650e3056';
      case GeneralPathEnum.getClientUsers:
        return 'b30dedd5743d02d8f2759cc6d71f0cd7';
      case GeneralPathEnum.updateClientUser:
        return 'daacad63aa457d7367129ed040fe1a4e';
      case GeneralPathEnum.deleteClientUser:
        return 'd65cf11abc50659328101ef7e39939ba';
      case GeneralPathEnum.createClientUser:
        return '30dc86ca39f943b802ee47ac31695137';
      case GeneralPathEnum.getEndOfTermStockReport:
        return '89c6c44aa6fe40b6c8679dfa8d6bd15e';
      case GeneralPathEnum.getMonthlyRefillReport:
        return 'a491d42dbbaa9c9d7917659a11cb95ab';
      case GeneralPathEnum.getCurrentStockStatusReport:
        return 'b2ece789c8b4a7fa8ed336b0302f915d';
      case GeneralPathEnum.stationDelete:
        return 'a2b762e3fcadad8faacec88954786289'; */
    }
  }

  String get path {
    return rawValue;
  }
}
