import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/widgets.dart';

part 'ruby_text_data.freezed.dart';

@freezed
class RubyTextData with _$RubyTextData {
  const factory RubyTextData(
    String text, {
    String? ruby,
    TextStyle? style,
    TextStyle? rubyStyle,
    TextDirection? textDirection,
  }) = _RubyTextData;
}
