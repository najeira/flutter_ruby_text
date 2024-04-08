# ruby_text

A ruby text for Flutter.

![](./screenshot.png)

## Install

```yaml
dependencies:
  ruby_text:
    git:
      url: https://github.com/najeira/flutter_ruby_text
```

## Example

```dart
Text.rich(
  TextSpan(
    children: [
      RubyTextSpan(
        text: '夏',
        ruby: 'なつ',
        style: TextStyle(
          color: Colors.red,
        ),
      ),
      TextSpan(
        text: 'でも',
      ),
      RubyTextSpan(
        text: '底',
        ruby: 'そこ',
      ),
      TextSpan(
        text: 'に',
      ),
      RubyTextSpan(
        text: '冷',
        ruby: 'つめ',
        style: TextStyle(
          color: Colors.blue,
        ),
      ),
      TextSpan(
        text: 'たさをもつ',
      ),
      RubyTextSpan(
        text: '青',
        ruby: 'あお',
      ),
      TextSpan(
        text: 'いそら',
      ),
    ],
  ),
);
```
