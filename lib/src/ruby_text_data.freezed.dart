// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ruby_text_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RubyTextData {
  String get text => throw _privateConstructorUsedError;
  String? get ruby => throw _privateConstructorUsedError;
  TextStyle? get style => throw _privateConstructorUsedError;
  TextStyle? get rubyStyle => throw _privateConstructorUsedError;
  TextDirection? get textDirection => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RubyTextDataCopyWith<RubyTextData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RubyTextDataCopyWith<$Res> {
  factory $RubyTextDataCopyWith(
          RubyTextData value, $Res Function(RubyTextData) then) =
      _$RubyTextDataCopyWithImpl<$Res, RubyTextData>;
  @useResult
  $Res call(
      {String text,
      String? ruby,
      TextStyle? style,
      TextStyle? rubyStyle,
      TextDirection? textDirection});
}

/// @nodoc
class _$RubyTextDataCopyWithImpl<$Res, $Val extends RubyTextData>
    implements $RubyTextDataCopyWith<$Res> {
  _$RubyTextDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? ruby = freezed,
    Object? style = freezed,
    Object? rubyStyle = freezed,
    Object? textDirection = freezed,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      ruby: freezed == ruby
          ? _value.ruby
          : ruby // ignore: cast_nullable_to_non_nullable
              as String?,
      style: freezed == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as TextStyle?,
      rubyStyle: freezed == rubyStyle
          ? _value.rubyStyle
          : rubyStyle // ignore: cast_nullable_to_non_nullable
              as TextStyle?,
      textDirection: freezed == textDirection
          ? _value.textDirection
          : textDirection // ignore: cast_nullable_to_non_nullable
              as TextDirection?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RubyTextDataImplCopyWith<$Res>
    implements $RubyTextDataCopyWith<$Res> {
  factory _$$RubyTextDataImplCopyWith(
          _$RubyTextDataImpl value, $Res Function(_$RubyTextDataImpl) then) =
      __$$RubyTextDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String text,
      String? ruby,
      TextStyle? style,
      TextStyle? rubyStyle,
      TextDirection? textDirection});
}

/// @nodoc
class __$$RubyTextDataImplCopyWithImpl<$Res>
    extends _$RubyTextDataCopyWithImpl<$Res, _$RubyTextDataImpl>
    implements _$$RubyTextDataImplCopyWith<$Res> {
  __$$RubyTextDataImplCopyWithImpl(
      _$RubyTextDataImpl _value, $Res Function(_$RubyTextDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? ruby = freezed,
    Object? style = freezed,
    Object? rubyStyle = freezed,
    Object? textDirection = freezed,
  }) {
    return _then(_$RubyTextDataImpl(
      null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      ruby: freezed == ruby
          ? _value.ruby
          : ruby // ignore: cast_nullable_to_non_nullable
              as String?,
      style: freezed == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as TextStyle?,
      rubyStyle: freezed == rubyStyle
          ? _value.rubyStyle
          : rubyStyle // ignore: cast_nullable_to_non_nullable
              as TextStyle?,
      textDirection: freezed == textDirection
          ? _value.textDirection
          : textDirection // ignore: cast_nullable_to_non_nullable
              as TextDirection?,
    ));
  }
}

/// @nodoc

class _$RubyTextDataImpl implements _RubyTextData {
  const _$RubyTextDataImpl(this.text,
      {this.ruby, this.style, this.rubyStyle, this.textDirection});

  @override
  final String text;
  @override
  final String? ruby;
  @override
  final TextStyle? style;
  @override
  final TextStyle? rubyStyle;
  @override
  final TextDirection? textDirection;

  @override
  String toString() {
    return 'RubyTextData(text: $text, ruby: $ruby, style: $style, rubyStyle: $rubyStyle, textDirection: $textDirection)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RubyTextDataImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.ruby, ruby) || other.ruby == ruby) &&
            (identical(other.style, style) || other.style == style) &&
            (identical(other.rubyStyle, rubyStyle) ||
                other.rubyStyle == rubyStyle) &&
            (identical(other.textDirection, textDirection) ||
                other.textDirection == textDirection));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, text, ruby, style, rubyStyle, textDirection);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RubyTextDataImplCopyWith<_$RubyTextDataImpl> get copyWith =>
      __$$RubyTextDataImplCopyWithImpl<_$RubyTextDataImpl>(this, _$identity);
}

abstract class _RubyTextData implements RubyTextData {
  const factory _RubyTextData(final String text,
      {final String? ruby,
      final TextStyle? style,
      final TextStyle? rubyStyle,
      final TextDirection? textDirection}) = _$RubyTextDataImpl;

  @override
  String get text;
  @override
  String? get ruby;
  @override
  TextStyle? get style;
  @override
  TextStyle? get rubyStyle;
  @override
  TextDirection? get textDirection;
  @override
  @JsonKey(ignore: true)
  _$$RubyTextDataImplCopyWith<_$RubyTextDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
