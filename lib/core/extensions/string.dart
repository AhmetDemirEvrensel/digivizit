extension StringExt on String {
  String get toIconSvg => 'assets/icons/$this.svg';
  String get toIconJpg => 'assets/icons/$this.jpg';
  String get toIconPng => 'assets/icons/$this.png';
  String get toImagePng => 'assets/images/$this.png';
  String get toImageJpg => 'assets/images/$this.jpg';
  String get toImageSvg => 'assets/images/$this.svg';
  String get toLottie => 'assets/animations/$this.json';

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  /* String trr({
    BuildContext? context,
    List<String>? args,
    Map<String, String>? namedArgs,
    String? gender,
  }) {
    return this
        .tr(context: context, args: args, namedArgs: namedArgs, gender: gender);
  } */
}

extension StringNullExt on String? {
  bool get isNotNullOrNoEmpty {
    return this != null && this != "";
  }
}
