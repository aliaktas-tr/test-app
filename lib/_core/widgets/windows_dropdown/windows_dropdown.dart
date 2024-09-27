// ignore_for_file: must_be_immutable

import 'package:new_weedus/export.dart';

class WindowStyleDropdownMenu extends StatefulWidget {
  String? buttonTitle;
  TextStyle? buttonTitleStyle;
  double? dropdownWidth;
  Color? dropdownBackgroundColor;
  List<ListTile>? dropdownItems;
  List<Widget>? children;
  bool? isLeftOffSet;
  Color? titleColor;
  TextStyle? dropdownTextStyle;

  WindowStyleDropdownMenu(
      {Key? key,
      this.buttonTitle,
      this.dropdownItems,
      this.children,
      this.buttonTitleStyle,
      this.dropdownWidth,
      this.dropdownBackgroundColor,
      this.dropdownTextStyle,
      this.isLeftOffSet = true,
      this.titleColor})
      : super(key: key);

  @override
  State<WindowStyleDropdownMenu> createState() =>
      _WindowStyleDropdownMenuState();
}

class _WindowStyleDropdownMenuState extends State<WindowStyleDropdownMenu> {
  OverlayEntry? _overlayEntry;
  FocusNode textFocusNode = FocusNode();
  bool showOverlay = false;
  double _fonSize = 16;
  double _dropDownWidth = 200;
  double _topMargin = 10;
  double _elevation = 2.0;

  @override
  void initState() {
    super.initState();
    textFocusNode.addListener(() {
      if (textFocusNode.hasFocus) {
        _overlayEntry = _createOverlayEntry();
        Overlay.of(context).insert(_overlayEntry!);
      } else {
        removeOverlay();
      }
    });
  }

  void removeOverlay() {
    _overlayEntry!.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: defaultSize),
        child: TextButton(
            focusNode: textFocusNode,
            style: ButtonStyle(
                overlayColor: WidgetStateProperty.all(Colors.transparent)),
            onHover: (val) {
              setState(() {
                if (val) {
                  textFocusNode.requestFocus();
                  showOverlay = true;
                } else {
                  textFocusNode.unfocus();
                }
              });
            },
            onPressed: () {},
            child: Text(widget.buttonTitle!,
                style: widget.dropdownTextStyle ??
                    GoogleFonts.michroma(
                        fontSize: _fonSize,
                        fontWeight: FontWeight.w400,
                        color: widget.titleColor ?? white9))));
  }

  _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
        maintainState: true,
        builder: (context) => Positioned(
            left: widget.isLeftOffSet! ? offset.dx - 85 : null,
            right: !widget.isLeftOffSet! ? offset.dx / 4 : null,
            top: offset.dy + size.height,
            width: widget.dropdownWidth ?? _dropDownWidth,
            child: Material(
                color: Colors.transparent,
                child: InkWell(
                    onTap: () {},
                    onHover: (val) {
                      if (val && showOverlay) {
                        textFocusNode.requestFocus();
                      } else {
                        textFocusNode.unfocus();
                      }
                    },
                    child: Card(
                        margin: EdgeInsets.only(top: 3),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                        color: widget.dropdownBackgroundColor ?? nero,
                        elevation: _elevation,
                        child: ListView(
                            padding: EdgeInsets.all(quarterDefaultSize),
                            shrinkWrap: true,
                            children: widget.dropdownItems != null
                                ? widget.dropdownItems!
                                : widget.children!))))));
  }
}
