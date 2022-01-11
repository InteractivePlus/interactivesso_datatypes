import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

import 'permission.dart';
import '../Util/phone_number_serialization.dart';

part 'user.g.dart';

class AccountStatus implements Serializable<int>{
  final bool canLogin;
  final bool canModifyAccount;
  final bool canViewManagingAPPs;
  final bool canModifyManagingAPPs;
  
  @override
  int serialize([String? locale]){
    if(identical(this,NORMAL)){
      return 0;
    }else if(identical(this,NOT_VERIFIED)){
      return 1;
    }else if(identical(this, POTENTIAL_ATTACK)){
      return 2;
    }else{
      return 3;
    }
  }

  @override
  int toJson() {
    return serialize(null);
  }

  const AccountStatus._(this.canLogin, this.canModifyAccount, this.canViewManagingAPPs, this.canModifyManagingAPPs);
  factory AccountStatus.fromInt(int number){
    switch(number){
      case 0:
        return NORMAL;
      case 1:
        return NOT_VERIFIED;
      case 2:
        return POTENTIAL_ATTACK;
      case 3:
        return FROZEN;
      default:
        throw InteractivePlusSystemException.SERIALIZATION_EXCEPTION;
    }
  }

  static AccountStatus fromJson(int json){
    return AccountStatus.fromInt(json);
  }
  
  static const AccountStatus NORMAL = AccountStatus._(true, true, true, true);
  static const AccountStatus NOT_VERIFIED = AccountStatus._(false, true, true, true);
  static const AccountStatus POTENTIAL_ATTACK = AccountStatus._(true, false, false, false);
  static const AccountStatus FROZEN = AccountStatus._(false, false, false, false);
}

@JsonSerializable()
class AccountCreateInfo implements Serializable<Map<String,dynamic>>{
  @JsonKey(name: 'createIP')
  final String? createIPAddr;

  @JsonKey(required: true, name: 'createTime')
  final int createTimeGMT;

  @override
  Map<String, dynamic> serialize([String? locale]) => _$AccountCreateInfoToJson(this);

  const AccountCreateInfo(this.createTimeGMT, [this.createIPAddr]);
  
  factory AccountCreateInfo.fromMap(Map<String, dynamic> map) => _$AccountCreateInfoFromJson(map);

  static AccountCreateInfo fromJson(Map<String,dynamic> json) => AccountCreateInfo.fromMap(json);

  @override
  Map<String, dynamic> toJson() => serialize(null);
}

@JsonSerializable()
class UserInfo implements Serializable<Map<String,dynamic>>{
  @JsonKey(required: true, name: 'user_group')
  String belongedGroupId;

  @JsonKey(required: true, name: 'username')
  String username;

  @JsonKey(required: true, name: 'user_unique_id')
  final String userUniqueId;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(required: true, name: 'email_verified')
  bool emailVerified;
  
  @JsonKey(name: 'phone')
  @NullablePhoneNumberConverter()
  PhoneNumber? phoneNumber;

  @JsonKey(required: true, name: 'phone_verified')
  bool phoneVerified;

  @JsonKey(required: true, name: 'account_status', fromJson: AccountStatus.fromJson, toJson: Serializable.convertToDynamicSerialized)
  AccountStatus accountStatus;

  @JsonKey(name: 'nickname')
  String? nickname;

  @JsonKey(name: 'signature')
  String? signature;

  @JsonKey(name: 'password_hash')
  String? passwordHash;

  @JsonKey(name: 'area')
  String? areaAlpha2Code;

  @JsonKey(name:'local')
  String? localeCode;

  @JsonKey(required: true, name:'account_create_info', fromJson: AccountCreateInfo.fromJson, toJson: Serializable.convertToDynamicSerialized)
  AccountCreateInfo accountCreateInfo;

  @JsonKey(required: true, name:'permission')
  UserPermissionInfo permissionOverride;

  @JsonKey(ignore: true)
  String get displayName => nickname ?? username;

  @override
  Map<String, dynamic> serialize([String? locale]) => _$UserInfoToJson(this);

  UserInfo({
    required this.belongedGroupId,
    required this.username, 
    required this.userUniqueId,
    this.email, 
    this.phoneNumber, 
    required this.accountCreateInfo,
    required this.permissionOverride,
    this.passwordHash,
    this.accountStatus = AccountStatus.NORMAL, 
    this.emailVerified = false,
    this.phoneVerified = false,
    this.nickname,
    this.signature,
    this.areaAlpha2Code,
    this.localeCode
  });

  factory UserInfo.fromMap(Map<String,dynamic> map) => _$UserInfoFromJson(map);

  static UserInfo fromJson(Map<String,dynamic> json) => UserInfo.fromMap(json);

  @override
  Map<String, dynamic> toJson() {
    return serialize(null);
  }
}