// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountCreateInfo _$AccountCreateInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['createIP', 'createTime'],
  );
  return AccountCreateInfo(
    json['createIP'] as String,
    json['createTime'] as int,
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
      'belongedGroup',
      'username',
      'emailVerified',
      'phoneVerified',
      'accountStatus',
      'accountCreateInfo',
      'permission'
    ],
  );
  return UserInfo(
    belongedGroupId: json['belongedGroup'] as String,
    username: json['username'] as String,
    email: json['email'] as String?,
    phoneNumber:
        const NullablePhoneNumberConverter().fromJson(json['phone'] as String?),
    accountCreateInfo: AccountCreateInfo.fromJson(
        json['accountCreateInfo'] as Map<String, dynamic>),
    permissionOverride:
        UserPermissionInfo.fromJson(json['permission'] as Map<String, dynamic>),
    passwordHash: json['passwordHash'] as String?,
    accountStatus: json['accountStatus'] == null
        ? AccountStatus.NORMAL
        : AccountStatus.fromJson(json['accountStatus'] as int),
    emailVerified: json['emailVerified'] as bool? ?? false,
    phoneVerified: json['phoneVerified'] as bool? ?? false,
    nickname: json['nickname'] as String?,
    signature: json['signature'] as String?,
    areaAlpha2Code: json['area'] as String?,
    localeCode: json['local'] as String?,
  );
}

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'belongedGroup': instance.belongedGroupId,
      'username': instance.username,
      'email': instance.email,
      'emailVerified': instance.emailVerified,
      'phone':
          const NullablePhoneNumberConverter().toJson(instance.phoneNumber),
      'phoneVerified': instance.phoneVerified,
      'accountStatus':
          Serializable.convertToDynamicSerialized(instance.accountStatus),
      'nickname': instance.nickname,
      'signature': instance.signature,
      'passwordHash': instance.passwordHash,
      'area': instance.areaAlpha2Code,
      'local': instance.localeCode,
      'accountCreateInfo':
          Serializable.convertToDynamicSerialized(instance.accountCreateInfo),
      'permission': instance.permissionOverride,
    };
