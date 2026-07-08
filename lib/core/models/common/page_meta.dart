// To parse this JSON data, do
//
//     final pageMeta = pageMeta.fromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_meta.freezed.dart';
part 'page_meta.g.dart';

@freezed
abstract class PageMeta with _$PageMeta {
  const factory PageMeta({
    @JsonKey(name: "current_page") int? currentPage,
    @JsonKey(name: "last_page") int? lastPage,
    @JsonKey(name: "per_page") int? perPage,
    @JsonKey(name: "total") int? total,
  }) = _PageMeta;

  factory PageMeta.fromJson(Map<String, dynamic> json) =>
      _$PageMetaFromJson(json);
}

extension PageMetaExt on PageMeta {
  bool get hasMore {
    final current = currentPage;
    final last = lastPage;
    if (current == null || last == null) {
      return false;
    }
    return current < last;
  }
}
