import 'package:new_weedus/export.dart';
// ignore_for_file: unnecessary_type_check

class TextBorder extends StatelessWidget {
  TextBorder({
    required this.child,
    this.strokeCap = StrokeCap.round,
    this.strokeJoin = StrokeJoin.round,
    this.strokeWidth = 6.0,
    this.strokeColor = nero,
  }) : assert(child is Text);

  final StrokeCap strokeCap;
  final StrokeJoin strokeJoin;
  final double strokeWidth;
  final Color strokeColor;
  final Text child;

  @override
  Widget build(BuildContext context) {
    TextStyle style;
    if (child.style != null) {
      style = child.style!.copyWith(
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeCap = strokeCap
          ..strokeJoin = strokeJoin
          ..strokeWidth = strokeWidth
          ..color = strokeColor,
        color: null,
      );
    } else {
      style = TextStyle(
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeCap = strokeCap
          ..strokeJoin = strokeJoin
          ..strokeWidth = strokeWidth
          ..color = strokeColor,
      );
    }
    return Stack(
      alignment: Alignment.center,
      textDirection: child.textDirection,
      children: <Widget>[
        Text(child.data!,
            style: style,
            maxLines: child.maxLines,
            overflow: child.overflow,
            semanticsLabel: child.semanticsLabel,
            softWrap: child.softWrap,
            strutStyle: child.strutStyle,
            textAlign: child.textAlign,
            textDirection: child.textDirection,
            textScaler: child.textScaler),
        child,
      ],
    );
  }
}
