import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'sms_verify.freezed.dart';

part 'sms_verify.g.dart';

@freezed
class SmsVerify with _$SmsVerify {
  const factory SmsVerify({
    required String inputtedNum,
    required bool isVerify,
  }) = _SmsVerify;

  factory SmsVerify.fromJson(Map<String, Object?> json) => $SmsVerify(json);
}

///上でエラーが出ていたので下を作ったらエラーが消えた
$SmsVerify(Map<String, Object?> json) {}
