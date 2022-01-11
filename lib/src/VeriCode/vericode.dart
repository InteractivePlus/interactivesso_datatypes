
import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:json_annotation/json_annotation.dart';

import '../Common/expirableinfo.dart';
import 'communicationmethod.dart';

part 'vericode.g.dart';

@JsonSerializable()
class VerificationCode implements Serializable<Map<String,dynamic>>{
  @JsonKey(required: true, name: "vericode_id")
  String vericodeId;

  @JsonKey(required: true, name: 'is_short_id')
  bool isShortId;

  @JsonKey(required: true, name: 'username')
  String relatedUsername;

  @JsonKey(required: true, name: 'expires')
  ExpirableInfo expires;

  @JsonKey(required: true, name: 'issue_ip')
  String issueTimeRemoteIp;

  @JsonKey(name: 'sent_method', toJson: Serializable.convertToDynamicSerializedWithNullable, fromJson: CommunicationMethod.fromJson)
  CommunicationMethod? sentMethod;

  @JsonKey(name: 'use_scope')
  String? useScope;

  @override
  Map<String,dynamic> serialize([String? locale]) => _$VerificationCodeToJson(this);

  @override
  Map<String,dynamic> toJson() => serialize(null);

  VerificationCode({required this.vericodeId, required this.isShortId, required this.relatedUsername, required this.expires, required this.issueTimeRemoteIp, required this.sentMethod, this.useScope});
  factory VerificationCode.fromMap(Map<String,dynamic> map) => _$VerificationCodeFromJson(map);
  static VerificationCode fromJson(Map<String,dynamic> json) => VerificationCode.fromMap(json);
}