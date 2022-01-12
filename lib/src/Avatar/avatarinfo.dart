import 'dart:convert';

import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

part 'avatarinfo.g.dart';

abstract class AvatarInfo implements Serializable<Map<String,dynamic>>{
  @JsonKey(required: true, name: 'avatar_hash')
  final String avatarHash;

  Future<List<int>> getPngEncoded();

  @JsonKey(required: true, name: 'image_size')
  final int sizePx;

  @JsonKey(required: true, name: 'type_name')
  final String typeName;

  AvatarInfo({
    required this.avatarHash,
    required this.sizePx,
    required this.typeName
  });
  
  Map<String,dynamic> _serialize();

  @override
  Map<String, dynamic> serialize([String? locale]) {
    var serialized = _serialize();
    serialized['type'] = typeName;
    return serialized;
  }
  @override
  Map<String, dynamic> toJson() => serialize(null);

  static AvatarInfo fromMap(Map<String,dynamic> map){
    if(map['type'] == null || map['type'] is! String){
      throw InteractivePlusSystemException.SERIALIZATION_EXCEPTION;
    }
    switch(map['type']){
      case 'AvatarInfoWithRawData':
        return AvatarInfoWithRawData.fromMap(map);
      case 'AvatarInfoWithURL':
        return AvatarInfoWithURL.fromMap(map);
      default:
        throw InteractivePlusSystemException.SERIALIZATION_EXCEPTION;
    }
  }
  static AvatarInfo fromJson(Map<String,dynamic> json) => fromMap(json);
  static AvatarInfo? fromJsonNullable(Map<String,dynamic>? json) => json == null ? null : fromJson(json);
}

@JsonSerializable()
class AvatarInfoWithRawData extends AvatarInfo{
  @JsonKey(required: true, name: 'png_encoded', toJson: base64Encode, fromJson: base64Decode)
  final List<int> pngEncoded;

  @override
  Future<List<int>> getPngEncoded() {
    return Future(() => pngEncoded);
  }

  @override
  Map<String, dynamic> _serialize() => _$AvatarInfoWithRawDataToJson(this);

  AvatarInfoWithRawData({
    required String avatarHash,
    required this.pngEncoded,
    required int sizePx
  }) : super(avatarHash: avatarHash, sizePx: sizePx, typeName: 'AvatarInfoWithRawData');
  factory AvatarInfoWithRawData.fromMap(Map<String,dynamic> map) => _$AvatarInfoWithRawDataFromJson(map);
  static AvatarInfoWithRawData fromJson(Map<String,dynamic> json) => AvatarInfoWithRawData.fromMap(json);
  static AvatarInfoWithRawData? froJsonNullable(Map<String,dynamic>? json) => json == null ? null : fromJson(json);
}

@JsonSerializable()
class AvatarInfoWithURL extends AvatarInfo{
  @JsonKey(required: true, name: 'uri')
  final String uri;

  @JsonKey(ignore: true)
  List<int>? pngEncodedDownloaded;

  AvatarInfoWithURL({
    required String avatarHash,
    required this.uri,
    required int sizePx
  }) : super(avatarHash: avatarHash, sizePx: sizePx, typeName: 'AvatarInfoWithURL');

  @override
  Map<String, dynamic> _serialize() => _$AvatarInfoWithURLToJson(this);

  @override
  Future<List<int>> getPngEncoded() async {
    if(pngEncodedDownloaded != null){
      return pngEncodedDownloaded!;
    }
    var url = Uri.parse(uri);
    var response = await http.get(url);
    if(response.statusCode != 200){
      throw ItemNotFoundException(([locale]) => 'Requested URL could not return valid response',SingleItemRelatedParams(item: 'png_encoded'));
    }
    pngEncodedDownloaded = response.bodyBytes;
    return pngEncodedDownloaded!;
  }
  factory AvatarInfoWithURL.fromMap(Map<String,dynamic> map) => _$AvatarInfoWithURLFromJson(map);
  static AvatarInfoWithURL fromJson(Map<String,dynamic> json) => AvatarInfoWithURL.fromMap(json);
  static AvatarInfoWithURL? froJsonNullable(Map<String,dynamic>? json) => json == null ? null : fromJson(json);
}