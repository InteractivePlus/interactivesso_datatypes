// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountCreateInfo _$AccountCreateInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['createTime'],
  );
  return AccountCreateInfo(
    json['createTime'] as int,
    json['createIP'] as String?,
  );
}

Map<String, dynamic> _$AccountCreateInfoToJson(AccountCreateInfo instance) =>
    <String, dynamic>{
      'createIP': instance.createIPAddr,
      'createTime': instance.createTimeGMT,
    };

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'user_group',
      'username',
      'email_verified',
      'phone_verified',
      'account_status',
      'account_create_info',
      'permission'
    ],
  );
  return UserInfo(
    belongedGroupId: json['user_group'] as String,
    username: json['username'] as String,
    email: json['email'] as String?,
    phoneNumber:
        const NullablePhoneNumberConverter().fromJson(json['phone'] as String?),
    accountCreateInfo: AccountCreateInfo.fromJson(
        json['account_create_info'] as Map<String, dynamic>),
    permissionOverride:
        UserPermissionInfo.fromJson(json['permission'] as Map<String, dynamic>),
    passwordHash: json['password_hash'] as String?,
    accountStatus: json['account_status'] == null
        ? AccountStatus.NORMAL
        : AccountStatus.fromJson(json['account_status'] as int),
    emailVerified: json['email_verified'] as bool? ?? false,
    phoneVerified: json['phone_verified'] as bool? ?? false,
    nickname: json['nickname'] as String?,
    signature: json['signature'] as String?,
    areaAlpha2Code: json['area'] as String?,
    localeCode: json['local'] as String?,
  );
}

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'user_group': instance.belongedGroupId,
      'username': instance.username,
      'email': instance.email,
      'email_verified': instance.emailVerified,
      'phone':
          const NullablePhoneNumberConverter().toJson(instance.phoneNumber),
      'phone_verified': instance.phoneVerified,
      'account_status':
          Serializable.convertToDynamicSerialized(instance.accountStatus),
      'nickname': instance.nickname,
      'signature': instance.signature,
      'password_hash': instance.passwordHash,
      'area': instance.areaAlpha2Code,
      'local': instance.localeCode,
      'account_create_info':
          Serializable.convertToDynamicSerialized(instance.accountCreateInfo),
      'permission': instance.permissionOverride,
    };
