
import 'dart:convert';

import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:json_annotation/json_annotation.dart';

part 'avatarinfo.g.dart';

@JsonSerializable()
class AvatarInfo implements Serializable<Map<String,dynamic>>{
  @JsonKey(required: true, name: 'avatar_hash')
  String avatarHash;

  @JsonKey(required: true, name: 'avatar_jpeg_encoded', toJson: base64Encode, fromJson: base64Decode)
  List<int> pngEncoded;

  @JsonKey(required: true, name: 'image_width')
  int widthPx;

  @JsonKey(required: true, name: 'image_height')
  int heightPx; 

  AvatarInfo({
    required this.avatarHash,
    required this.pngEncoded,
    required this.widthPx,
    required this.heightPx
  });
  factory AvatarInfo.fromMap(Map<String,dynamic> map) => _$AvatarInfoFromJson(map);
  static AvatarInfo fromJson(Map<String,dynamic> json) => AvatarInfo.fromMap(json);
  static AvatarInfo? fromJsonNullable(Map<String,dynamic>? json) => json == null ? null : fromJson(json);

  @override
  Map<String, dynamic> serialize([String? locale]) => _$AvatarInfoToJson(this);

  @override
  Map<String, dynamic> toJson() => serialize(null);
}