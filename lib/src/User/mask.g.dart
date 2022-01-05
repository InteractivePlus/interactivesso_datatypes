// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mask.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMaskInfo _$UserMaskInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['mask_id', 'username', 'display_name'],
  );
  return UserMaskInfo(
    maskId: json['mask_id'] as String,
    username: json['username'] as String,
    appClientId: json['client_id'] as String?,
    displayName: json['display_name'] as String,
    signature: json['signature'] as String?,
    description: json['description'] as String?,
  );
}

Map<String, dynamic> _$UserMaskInfoToJson(UserMaskInfo instance) =>
    <String, dynamic>{
      'mask_id': instance.maskId,
      'username': instance.username,
      'client_id': instance.appClientId,
      'display_name': instance.displayName,
      'signature': instance.signature,
      'description': instance.description,
    };
