// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sms_verify.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SmsVerify _$SmsVerifyFromJson(Map<String, dynamic> json) {
  return _SmsVerify.fromJson(json);
}

/// @nodoc
mixin _$SmsVerify {
  String get inputtedNum => throw _privateConstructorUsedError;

  bool get isVerify => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SmsVerifyCopyWith<SmsVerify> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmsVerifyCopyWith<$Res> {
  factory $SmsVerifyCopyWith(SmsVerify value, $Res Function(SmsVerify) then) =
      _$SmsVerifyCopyWithImpl<$Res, SmsVerify>;

  @useResult
  $Res call({String inputtedNum, bool isVerify});
}

/// @nodoc
class _$SmsVerifyCopyWithImpl<$Res, $Val extends SmsVerify>
    implements $SmsVerifyCopyWith<$Res> {
  _$SmsVerifyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inputtedNum = null,
    Object? isVerify = null,
  }) {
    return _then(_value.copyWith(
      inputtedNum: null == inputtedNum
          ? _value.inputtedNum
          : inputtedNum // ignore: cast_nullable_to_non_nullable
              as String,
      isVerify: null == isVerify
          ? _value.isVerify
          : isVerify // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SmsVerifyImplCopyWith<$Res>
    implements $SmsVerifyCopyWith<$Res> {
  factory _$$SmsVerifyImplCopyWith(
          _$SmsVerifyImpl value, $Res Function(_$SmsVerifyImpl) then) =
      __$$SmsVerifyImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({String inputtedNum, bool isVerify});
}

/// @nodoc
class __$$SmsVerifyImplCopyWithImpl<$Res>
    extends _$SmsVerifyCopyWithImpl<$Res, _$SmsVerifyImpl>
    implements _$$SmsVerifyImplCopyWith<$Res> {
  __$$SmsVerifyImplCopyWithImpl(
      _$SmsVerifyImpl _value, $Res Function(_$SmsVerifyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inputtedNum = null,
    Object? isVerify = null,
  }) {
    return _then(_$SmsVerifyImpl(
      inputtedNum: null == inputtedNum
          ? _value.inputtedNum
          : inputtedNum // ignore: cast_nullable_to_non_nullable
              as String,
      isVerify: null == isVerify
          ? _value.isVerify
          : isVerify // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SmsVerifyImpl with DiagnosticableTreeMixin implements _SmsVerify {
  const _$SmsVerifyImpl({required this.inputtedNum, required this.isVerify});

  factory _$SmsVerifyImpl.fromJson(Map<String, dynamic> json) =>
      _$$SmsVerifyImplFromJson(json);

  @override
  final String inputtedNum;
  @override
  final bool isVerify;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SmsVerify(inputtedNum: $inputtedNum, isVerify: $isVerify)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SmsVerify'))
      ..add(DiagnosticsProperty('inputtedNum', inputtedNum))
      ..add(DiagnosticsProperty('isVerify', isVerify));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SmsVerifyImpl &&
            (identical(other.inputtedNum, inputtedNum) ||
                other.inputtedNum == inputtedNum) &&
            (identical(other.isVerify, isVerify) ||
                other.isVerify == isVerify));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, inputtedNum, isVerify);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SmsVerifyImplCopyWith<_$SmsVerifyImpl> get copyWith =>
      __$$SmsVerifyImplCopyWithImpl<_$SmsVerifyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SmsVerifyImplToJson(
      this,
    );
  }
}

abstract class _SmsVerify implements SmsVerify {
  const factory _SmsVerify(
      {required final String inputtedNum,
      required final bool isVerify}) = _$SmsVerifyImpl;

  factory _SmsVerify.fromJson(Map<String, dynamic> json) =
      _$SmsVerifyImpl.fromJson;

  @override
  String get inputtedNum;

  @override
  bool get isVerify;

  @override
  @JsonKey(ignore: true)
  _$$SmsVerifyImplCopyWith<_$SmsVerifyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
