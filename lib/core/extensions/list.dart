extension ListNullExt on List? {
  bool get isNotNullOrEmpty {
    return this != null && this!.isNotEmpty;
  }
}
