import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:json_annotation/json_annotation.dart';

part 'expirableinfo.g.dart';

@JsonSerializable()
class ExpirableInfo implements Serializable<Map<String,dynamic>>{
  @JsonKey(required: true, name: 'create_time')
  final int createTimeGMT;

  @JsonKey(required: true, name: 'expire_time')
  int expireTimeGMT;

  @override
  Map<String,dynamic> serialize([String? locale]) => _$ExpirableInfoToJson(this);

  @override
  Map<String,dynamic> toJson() => serialize(null);

  ExpirableInfo({required this.createTimeGMT, required this.expireTimeGMT});
  factory ExpirableInfo.fromMap(Map<String,dynamic> map) => _$ExpirableInfoFromJson(map);
  static ExpirableInfo fromJson(Map<String,dynamic> json) => ExpirableInfo.fromMap(json);
}