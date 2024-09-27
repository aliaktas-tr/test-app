import 'package:new_weedus/export.dart';


class FormErrorVisibility extends StatelessWidget {
  FormErrorVisibility({super.key, required this.error, this.color});

  final Color? color;
  final String? error;
  final EdgeInsetsGeometry _padding = EdgeInsets.only(left: defaultSize / 4);
  final Color _color = Color(0xffc23b22);
  final double _fontSize = 12.0;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topRight,
        child: Visibility(
            visible: error != null,
            child: Padding(
                padding: _padding,
                child: AppViewWidgets.textMontserrat('$error',
                    color: color ?? _color, fontSize: _fontSize))));
  }
}
