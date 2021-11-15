
import 'package:grisoft_url_shortening/core/constants/hive_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'shortly_link.g.dart';

@HiveType(typeId : HiveConstants.shortlyLinkId)
class ShortlyLink {
  @HiveField(0)
  String? code;
  @HiveField(1)
  String? shortLink;
  @HiveField(2)
  String? fullShortLink;
  @HiveField(3)
  String? shortLink2;
  @HiveField(4)
  String? fullShortLink2;
  @HiveField(5)
  String? shareLink;
  @HiveField(6)
  String? fullShareLink;
  @HiveField(7)
  String? originalLink;

  ShortlyLink(
      {this.code,
      this.shortLink,
      this.fullShortLink,
      this.shortLink2,
      this.fullShortLink2,
      this.shareLink,
      this.fullShareLink,
      this.originalLink});

  ShortlyLink.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    shortLink = json['short_link'];
    fullShortLink = json['full_short_link'];
    shortLink2 = json['short_link2'];
    fullShortLink2 = json['full_short_link2'];
    shareLink = json['share_link'];
    fullShareLink = json['full_share_link'];
    originalLink = json['original_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['short_link'] = shortLink;
    data['full_short_link'] = fullShortLink;
    data['short_link2'] = shortLink2;
    data['full_short_link2'] = fullShortLink2;
    data['share_link'] = shareLink;
    data['full_share_link'] = fullShareLink;
    data['original_link'] = originalLink;
    return data;
  }
}