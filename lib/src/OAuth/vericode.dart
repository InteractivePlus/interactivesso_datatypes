
import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:json_annotation/json_annotation.dart';

import '../Common/expirableinfo.dart';
import '../VeriCode/communicationmethod.dart';

part 'vericode.g.dart';

@JsonSerializable()
class OAuthVeriCode implements Serializable<Map<String,dynamic>>{
  @JsonKey(required: true, name: 'vericode_id')
  String vericodeId;

  @JsonKey(required: true, name: 'is_short_id')
  bool isShortId;
  
  @JsonKey(required: true, name: 'user_unique_id')
  String userUniqueId;

  @JsonKey(required: true, name: 'client_id')
  String appClientId;

  @JsonKey(required: true, name: 'expires')
  ExpirableInfo expires;

  @JsonKey(name: 'sent_method', toJson: Serializable.convertToDynamicSerializedWithNullable, fromJson: CommunicationMethod.fromJson)
  CommunicationMethod? sentMethod;

  @JsonKey(name: 'use_scope')
  String? useScope;

  @override
  Map<String,dynamic> serialize([String? locale]) => _$OAuthVeriCodeToJson(this);

  @override
  Map<String,dynamic> toJson() => serialize(null);

  OAuthVeriCode({required this.vericodeId, required this.isShortId, required this.userUniqueId, required this.appClientId, required this.expires, this.sentMethod, this.useScope});
  factory OAuthVeriCode.fromMap(Map<String,dynamic> map) => _$OAuthVeriCodeFromJson(map);
  static OAuthVeriCode fromJson(Map<String,dynamic> json) => OAuthVeriCode.fromMap(json);
}