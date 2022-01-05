// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authcode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorizationCode _$AuthorizationCodeFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'auth_code',
      'challenge_type',
      'client_id',
      'time_info',
      'mask_id',
      'username'
    ],
  );
  return AuthorizationCode(
    authCodeId: json['auth_code'] as String,
    challengeType:
        AuthCodeChallengeTypes.fromJson(json['challenge_type'] as String),
    challenge: json['challenge'] as String?,
    appClientId: json['client_id'] as String,
    expirableInfo:
        ExpirableInfo.fromJson(json['time_info'] as Map<String, dynamic>),
    maskId: json['mask_id'] as String,
    relatedUsername: json['username'] as String,
  );
}

Map<String, dynamic> _$AuthorizationCodeToJson(AuthorizationCode instance) =>
    <String, dynamic>{
      'auth_code': instance.authCodeId,
      'challenge_type':
          Serializable.convertToDynamicSerialized(instance.challengeType),
      'challenge': instance.challenge,
      'client_id': instance.appClientId,
      'time_info': instance.expirableInfo,
      'mask_id': instance.maskId,
      'username': instance.relatedUsername,
    };
