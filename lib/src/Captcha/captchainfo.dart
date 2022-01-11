import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:json_annotation/json_annotation.dart';


typedef CaptchaSubmitInfo<X> = Serializable<X>;

abstract class CaptchaSubmitInfoSerializer<X, CaptchaSubInfo extends CaptchaSubmitInfo<X>> implements JsonConverter<CaptchaSubInfo,X>{
  CaptchaSubInfo fromSerialized(X serialized);
  X serialize(CaptchaSubInfo object);
  CaptchaSubInfo fromDynamicSerialized(dynamic serialized);

  @override
  CaptchaSubInfo fromJson(X json) => fromSerialized(json);

  @override
  X toJson(CaptchaSubInfo object) => serialize(object);
}