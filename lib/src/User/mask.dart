import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mask.g.dart';

@JsonSerializable()
class UserMaskInfo implements Serializable<Map<String,dynamic>>{
  @JsonKey(required: true, name: 'mask_id')
  String maskId;

  @JsonKey(required: true, name: 'username')
  String username;

  @JsonKey(name: 'client_id')
  String? appClientId;

  @JsonKey(required: true, name: 'display_name')
  String displayName;

  @JsonKey(name:'signature')
  String? signature;

  @JsonKey(name:'description')
  String? description;

  @override
  Map<String,dynamic> serialize([String? locale]) => _$UserMaskInfoToJson(this);
  
  @override
  Map<String,dynamic> toJson() => serialize(null);
  
  UserMaskInfo({required this.maskId, required this.username, this.appClientId, required this.displayName, this.signature, this.description});
  factory UserMaskInfo.fromMap(Map<String,dynamic> map) => _$UserMaskInfoFromJson(map);
  static UserMaskInfo fromJson(Map<String,dynamic> json) => UserMaskInfo.fromMap(json);
}