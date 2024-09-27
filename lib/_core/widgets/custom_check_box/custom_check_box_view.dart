import 'package:new_weedus/export.dart';

class CustomCheckBoxView extends StatefulWidget {
  final bool? value;
  final String? text;
  final ValueChanged<bool?>? onChanged;
  final Color? activeColor;
  final bool? isWithTextTruncate;
  final FontWeight? fontWeight;

  CustomCheckBoxView(
      {this.value,
      this.text,
      this.onChanged,
      this.activeColor = nero,
      this.isWithTextTruncate = true,
      this.fontWeight});

  @override
  _CustomCheckBoxViewState createState() => _CustomCheckBoxViewState();
}

class _CustomCheckBoxViewState extends State<CustomCheckBoxView> {
  bool _isSelected = false;
  final BorderRadiusGeometry _borderRadius =
      BorderRadius.circular(quarterDefaultSize);
  Offset _offset = Offset(-5, 0);
  double _scale = 0.9;
  BorderSide _side = BorderSide(width: 0.5, color: nero);
  double _fontSize = 13;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          setState(() {
            _isSelected = !_isSelected;
            if (widget.onChanged != null) {
              widget.onChanged!(_isSelected);
            }
          });
        },
        child: Row(mainAxisSize: MainAxisSize.max, children: [
          Transform.translate(
              offset: _offset,
              child: Transform.scale(
                  scale: _scale,
                  child: Checkbox(
                    value: widget.value,
                    onChanged: widget.onChanged,
                    splashRadius: 0,
                    activeColor: widget.activeColor,
                    side: _side,
                    shape: RoundedRectangleBorder(borderRadius: _borderRadius),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ))),
          if (widget.text != null) ...[
            AppViewWidgets.textMontserrat(
                widget.isWithTextTruncate!
                    ? widget.text!.truncateTo(14)
                    : widget.text!,
                fontSize: _fontSize,
                fontWeight: widget.fontWeight ?? FontWeight.normal)
          ]
        ]));
  }
}
