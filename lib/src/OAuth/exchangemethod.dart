
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:interactivesso_datatypes/src/APP/permission.dart';
import 'package:interactivesso_datatypes/src/OAuth/scope.dart';

class AuthCodeChallengeTypes implements Serializable<String>{
  final bool Function(String? challenge, String? verifier) verifyCodeVerifier;
  final bool Function(String? challenge) isValidChallengeString;
  final String? Function(String? verifier) encodeVerifierIntoChallenge;

  @override
  String serialize([String? locale]) {
    if(identical(this, NONE)){
      return "none";
    }else if(identical(this, PLAIN)){
      return 'plain';
    }else{
      return 's256';
    }
  }

  @override
  String toJson() => serialize(null);

  const AuthCodeChallengeTypes._({required this.verifyCodeVerifier, required this.isValidChallengeString, required this.encodeVerifierIntoChallenge});
  factory AuthCodeChallengeTypes.fromString(String str){
    if(str == 'none'){
      return NONE;
    }else if(str == 'plain'){
      return PLAIN;
    }else if(str == 's256'){
      return S256;
    }else{
      throw InteractivePlusSystemException.SERIALIZATION_EXCEPTION;
    }
  }
  static AuthCodeChallengeTypes fromJson(String json) => AuthCodeChallengeTypes.fromString(json);

  static const NONE = AuthCodeChallengeTypes._(verifyCodeVerifier: _NoneChallengeVerifyVerifier, isValidChallengeString: _isValidNoneChallenge, encodeVerifierIntoChallenge: _NoneEncodeVerifier);
  static const PLAIN = AuthCodeChallengeTypes._(verifyCodeVerifier: _PlainChallengeVerifyVerifier, isValidChallengeString: _isValidPlainChallenge, encodeVerifierIntoChallenge: _PlainEncodeVerifier);
  static const S256 = AuthCodeChallengeTypes._(verifyCodeVerifier: _S256ChallengeVerifyVerifier, isValidChallengeString: _isValidS256Challenge, encodeVerifierIntoChallenge: _S256EncodeVerifier);

  static bool _isValidPlainChallenge(String? challenge){
    return challenge != null;
  }
  static bool _isValidS256Challenge(String? challenge){
    return challenge != null && challenge.length == 64 && challenge.isValidHexString();
  }
  static bool _isValidNoneChallenge(String? challenge){
    return challenge == null;
  }
  static String? _PlainEncodeVerifier(String? verifier){
    return verifier;
  }
  static String? _S256EncodeVerifier(String? verifier){
    return verifier != null ? sha256.convert(utf8.encode(verifier)).toString() : null;
  }
  static String? _NoneEncodeVerifier(String? verifier){
    return null;
  }
  static bool _PlainChallengeVerifyVerifier(String? challenge, String? verifier){
    return challenge != null && challenge == verifier;
  }
  static bool _S256ChallengeVerifyVerifier(String? challenge, String? verifier){
    return verifier != null && challenge != null && _S256EncodeVerifier(verifier) == challenge;
  }
  static bool _NoneChallengeVerifyVerifier(String? challenge, String? verifier){
    return challenge == null && verifier == null;
  }
}

class ExchangeMethod implements Serializable<String>{
  final APPPermissionInfo appPermFilter;
  final List<AuthCodeChallengeTypes> acceptableChallengeTypes;

  ///Determines if system need to check appsecret before issuing oauth access token
  final bool checkAPPSecret;
  
  ExchangeMethod._(this.checkAPPSecret, this.appPermFilter, this.acceptableChallengeTypes);
  factory ExchangeMethod.fromString(String str){
    if(str == 'pkce'){
      return PKCE;
    }else if(str == 'backend'){
      return BACKEND;
    }else{
      throw InteractivePlusSystemException.SERIALIZATION_EXCEPTION;
    }
  }
  static ExchangeMethod fromJson(String json) => ExchangeMethod.fromString(json);

  @override
  String serialize([String? locale]){
    if(identical(this, PKCE)){
      return 'pkce';
    }else{
      return 'backend';
    }
  }

  @override
  String toJson() => serialize(null);

  static final PKCE = ExchangeMethod._(
    false, 
    APPPermissionInfo(oAuthPermission: OAuthPermissionInfo(
        basicInfoPerm: OAuthBasicInfoScopePermission.EMPTY_MASK, 
        notificationPerm: OAuthNotificationScopePermission(enabled: false), 
        listManagedAppsPerm: OAuthListManagedAppsScopePermission(enabled: null, manageAPP: false, readAPPSecret: false, readAPPDisplayNameAndDescription: null),
      ),
      canVerifyOtherAppSecret: false
    ), 
    [AuthCodeChallengeTypes.S256]
  );
  static final BACKEND = ExchangeMethod._(
    true, 
    APPPermissionInfo.EMPTY_MASK, 
    [AuthCodeChallengeTypes.NONE]
  );
}