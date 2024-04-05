import 'package:flutter/widgets.dart';

import 'ruby_text_data.dart';

class RubyText extends StatelessWidget {
  const RubyText(
    this.data, {
    Key? key,
    this.spacing = 0.0,
    this.style,
    this.rubyStyle,
    this.textAlign,
    this.textDirection,
    this.softWrap,
    this.overflow,
    this.maxLines,
  }) : super(key: key);

  final List<RubyTextData> data;
  final double spacing;
  final TextStyle? style;
  final TextStyle? rubyStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final bool? softWrap;
  final TextOverflow? overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) => Text.rich(
        TextSpan(
          children: [
            for (final cell in data)
              RubyTextSpan(
                cell.copyWith(
                  style: style,
                  rubyStyle: rubyStyle,
                  textDirection: textDirection,
                ),
              ),
          ],
        ),
        textAlign: textAlign,
        textDirection: textDirection,
        softWrap: softWrap,
        overflow: overflow,
        maxLines: maxLines,
      );
}

class RubyTextSpan extends WidgetSpan {
  RubyTextSpan(
    RubyTextData data, {
    super.alignment,
    super.baseline,
    super.style,
  }) : super(child: _RubySpan(data));
}

class _RubySpan extends StatefulWidget {
  const _RubySpan(this.data);

  final RubyTextData data;

  @override
  State<_RubySpan> createState() => _RubyState();
}

class _RubyState extends State<_RubySpan> {
  TextStyle? _textStyle;
  TextStyle? _rubyTextStyle;

  @override
  void didUpdateWidget(_RubySpan oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.data != oldWidget.data) {
      _calculate();
    }
  }

  @override
  Widget build(BuildContext context) {
    _calculateIfNeeded();
    return Column(
      children: [
        if (widget.data.ruby != null)
          Text(
            widget.data.ruby!,
            textAlign: TextAlign.center,
            style: _rubyTextStyle,
          ),
        Text(
          widget.data.text,
          textAlign: TextAlign.center,
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

  void _calculate() {
    final textDirection = Directionality.maybeOf(context);
    final defaultTextStyle = DefaultTextStyle.of(context).style;
    final boldTextOverride = MediaQuery.boldTextOf(context);

    // text style
    var effectiveTextStyle = widget.data.style;
    if (effectiveTextStyle == null || effectiveTextStyle.inherit) {
      effectiveTextStyle = defaultTextStyle.merge(effectiveTextStyle);
    }
    if (boldTextOverride) {
      effectiveTextStyle = effectiveTextStyle
          .merge(const TextStyle(fontWeight: FontWeight.bold));
    }
    assert(effectiveTextStyle.fontSize != null, 'must be has a font size.');
    final defaultRubyTextStyle = effectiveTextStyle.merge(
      TextStyle(fontSize: effectiveTextStyle.fontSize! / 1.5),
    );

    // ruby text style
    var effectiveRubyTextStyle = widget.data.rubyStyle;
    if (effectiveRubyTextStyle == null || effectiveRubyTextStyle.inherit) {
      effectiveRubyTextStyle =
          defaultRubyTextStyle.merge(effectiveRubyTextStyle);
    }
    if (boldTextOverride) {
      effectiveRubyTextStyle = effectiveRubyTextStyle
          .merge(const TextStyle(fontWeight: FontWeight.bold));
    }

    // spacing
    final ruby = widget.data.ruby;
    final text = widget.data.text;
    if (ruby != null &&
        effectiveTextStyle.letterSpacing == null &&
        effectiveRubyTextStyle.letterSpacing == null &&
        ruby.length >= 2 &&
        text.length >= 2) {
      final rubyWidth = _measurementWidth(
        ruby,
        effectiveRubyTextStyle,
        textDirection:
            widget.data.textDirection ?? textDirection ?? TextDirection.ltr,
      );
      final textWidth = _measurementWidth(
        text,
        effectiveTextStyle,
        textDirection:
            widget.data.textDirection ?? textDirection ?? TextDirection.ltr,
      );

      if (textWidth > rubyWidth) {
        final newLetterSpacing = (textWidth - rubyWidth) / ruby.length;
        effectiveRubyTextStyle = effectiveRubyTextStyle
            .merge(TextStyle(letterSpacing: newLetterSpacing));
      } else {
        final newLetterSpacing = (rubyWidth - textWidth) / text.length;
        effectiveTextStyle = effectiveTextStyle
            .merge(TextStyle(letterSpacing: newLetterSpacing));
      }
    }

    _textStyle = effectiveTextStyle;
    _rubyTextStyle = effectiveRubyTextStyle;
  }
}

double _measurementWidth(
  String text,
  TextStyle style, {
  TextDirection textDirection = TextDirection.ltr,
}) {
  final textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    textDirection: textDirection,
    textAlign: TextAlign.center,
  )..layout();
  return textPainter.width;
}
