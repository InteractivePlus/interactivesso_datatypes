import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

class PhoneNumberConverter implements JsonConverter<PhoneNumber,String>{
  const PhoneNumberConverter();

  @override
  PhoneNumber fromJson(String json) {
    try{
      return PhoneNumber.fromRaw(json);
    }catch(e){
      throw InteractivePlusSystemException.SERIALIZATION_EXCEPTION;
    }
  }

  @override
  String toJson(PhoneNumber? object) {
    if(object == null){
      return "null";
    }
    return object.international;
  }
}

class NullablePhoneNumberConverter implements JsonConverter<PhoneNumber?,String?>{
  const NullablePhoneNumberConverter();

  @override
  PhoneNumber? fromJson(String? json) {
    if(json == null){
      return null;
    }
    try{
      return PhoneNumber.fromRaw(json);
    }catch(e){
      throw InteractivePlusSystemException.SERIALIZATION_EXCEPTION;
    }
  }

  @override
  String? toJson(PhoneNumber? object) {
    if(object == null){
      return null;
    }
    return object.international;
  }
}