
import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum PhoneOrEmail{
  @JsonValue(0)
  phone,
  @JsonValue(1)
  email
}

class CommunicationMethod implements Serializable<String>{
  final PhoneOrEmail? verifyTarget;
  final bool needShortCodeForVerification;

  @override
  String serialize([String? locale]) {
    if(identical(this, SMS)){
      return 'sms';
    }else if(identical(this, PHONE_CALL)){
      return 'phone_call';
    }else{
      return 'email';
    }
  }
  @override
  String toJson() => serialize(null);

  const CommunicationMethod({required this.verifyTarget, required this.needShortCodeForVerification});
  factory CommunicationMethod.fromString(String str){
    if(str == 'sms'){
      return SMS;
    }else if(str == 'phone_call'){
      return PHONE_CALL;
    }else if(str == 'email'){
      return EMAIL;
    }
    throw InteractivePlusSystemException.SERIALIZATION_EXCEPTION;
  }
  static CommunicationMethod fromJson(String json) => CommunicationMethod.fromString(json);
  static CommunicationMethod? fromJsonNullable(String? json){
    if(json == null){
      return null;
    }else{
      return fromJson(json);
    }
  }

  static const CommunicationMethod SMS = CommunicationMethod(verifyTarget: PhoneOrEmail.phone, needShortCodeForVerification: true);
  static const CommunicationMethod PHONE_CALL = CommunicationMethod(verifyTarget: PhoneOrEmail.phone, needShortCodeForVerification: true);
  static const CommunicationMethod EMAIL = CommunicationMethod(verifyTarget: PhoneOrEmail.email, needShortCodeForVerification: false);
}