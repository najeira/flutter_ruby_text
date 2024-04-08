import 'package:flutter/widgets.dart';

class RubyTextSpan extends WidgetSpan {
  RubyTextSpan({
    String? text,
    String? ruby,
    TextStyle? rubyStyle,
    TextDirection? textDirection,
    super.alignment,
    super.baseline,
    super.style,
  }) : super(
          child: _RubySpan(
            text: text,
            ruby: ruby,
            style: style,
            rubyStyle: rubyStyle,
            textDirection: textDirection,
          ),
        );
}

class _RubySpan extends StatefulWidget {
  const _RubySpan({
    this.text,
    this.ruby,
    this.style,
    this.rubyStyle,
    this.textDirection,
  });

  final String? text;

  final String? ruby;

  final TextStyle? style;

  final TextStyle? rubyStyle;

  final TextDirection? textDirection;

  @override
  State<_RubySpan> createState() => _RubyState();
}

class _RubyState extends State<_RubySpan> {
  TextStyle? _textStyle;
  TextStyle? _rubyTextStyle;

  @override
  void didUpdateWidget(_RubySpan oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.text != oldWidget.text ||
        widget.ruby != oldWidget.ruby ||
        widget.style != oldWidget.style ||
        widget.rubyStyle != oldWidget.rubyStyle ||
        widget.textDirection != oldWidget.textDirection) {
      _calculate();
    }
  }

  @override
  Widget build(BuildContext context) {
    _calculateIfNeeded();
    return Column(
      children: [
        if (widget.ruby?.isNotEmpty == true)
          Text(
            widget.ruby ?? "",
            style: _rubyTextStyle,
            textHeightBehavior: const TextHeightBehavior(
              applyHeightToLastDescent: false,
            ),
          ),
        Text(
          widget.text ?? "",
          style: _textStyle,
        ),
      ],
    );
  }

  void _calculateIfNeeded() {
    if (_textStyle == null || _rubyTextStyle == null) {
      _calculate();
    }
    assert(_textStyle != null);
    assert(_rubyTextStyle != null);
  }

  // based on https://github.com/YeungKC/RubyText
  //
  // MIT License
  //
  // Copyright (c) 2020 YeungKC
  //
  // Permission is hereby granted, free of charge, to any person obtaining a copy
  // of this software and associated documentation files (the "Software"), to deal
  // in the Software without restriction, including without limitation the rights
  // to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  // copies of the Software, and to permit persons to whom the Software is
  // furnished to do so, subject to the following conditions:
  //
  // The above copyright notice and this permission notice shall be included in all
  // copies or substantial portions of the Software.
  //
  // THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  // IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  // FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  // AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  // LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  // OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  // SOFTWARE.
  void _calculate() {
    final textDirection = Directionality.maybeOf(context);
    final defaultTextStyle = DefaultTextStyle.of(context).style;
    final boldTextOverride = MediaQuery.boldTextOf(context);

    // text style
    var effectiveTextStyle = widget.style;
    if (effectiveTextStyle == null || effectiveTextStyle.inherit) {
      effectiveTextStyle = defaultTextStyle.merge(effectiveTextStyle);
    }
    if (boldTextOverride) {
      effectiveTextStyle = effectiveTextStyle.copyWith(
        fontWeight: FontWeight.bold,
      );
    }
    assert(effectiveTextStyle.fontSize != null, 'must be has a font size.');
    final defaultRubyTextStyle = effectiveTextStyle.copyWith(
      fontSize: effectiveTextStyle.fontSize! / 1.5,
    );

    // ruby text style
    var effectiveRubyTextStyle = widget.rubyStyle;
    if (effectiveRubyTextStyle == null || effectiveRubyTextStyle.inherit) {
      effectiveRubyTextStyle =
          defaultRubyTextStyle.merge(effectiveRubyTextStyle);
    }
    if (boldTextOverride) {
      effectiveRubyTextStyle = effectiveRubyTextStyle.copyWith(
        fontWeight: FontWeight.bold,
      );
    }

    // spacing
    final ruby = widget.ruby ?? "";
    final text = widget.text ?? "";
    if (widget.style?.letterSpacing == null &&
        widget.rubyStyle?.letterSpacing == null &&
        ruby.length >= 2 &&
        text.length >= 2) {
      final rubyWidth = _measurementWidth(
        ruby,
        effectiveRubyTextStyle,
        widget.textDirection ?? textDirection ?? TextDirection.ltr,
      );
      final textWidth = _measurementWidth(
        text,
        effectiveTextStyle,
        widget.textDirection ?? textDirection ?? TextDirection.ltr,
      );

      if (textWidth > rubyWidth) {
        final newLetterSpacing = (textWidth - rubyWidth) / ruby.length;
        effectiveRubyTextStyle = effectiveRubyTextStyle.copyWith(
          letterSpacing: newLetterSpacing,
        );
      } else {
        final newLetterSpacing = (rubyWidth - textWidth) / text.length;
        effectiveTextStyle = effectiveTextStyle.copyWith(
          letterSpacing: newLetterSpacing,
        );
      }
    }

    _textStyle = effectiveTextStyle.copyWith(
      height: 1.2,
    );
    _rubyTextStyle = effectiveRubyTextStyle;
  }
}

double _measurementWidth(
  String text,
  TextStyle style,
  TextDirection textDirection,
) {
  final textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    textDirection: textDirection,
    textAlign: TextAlign.center,
  )..layout();
  return textPainter.width;
}
