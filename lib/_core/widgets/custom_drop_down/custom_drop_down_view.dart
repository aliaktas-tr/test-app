import 'package:new_weedus/export.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown(
      {super.key,
        required this.customHeights,
        required this.value,
        required this.onChanged,
        this.items});

  final List<double> customHeights;
  final String value;
  final void Function(String?) onChanged;
  final List<DropdownMenuItem<String>>? items;

  final double _dropDownTitleFontSize = 18;
  final double _dropDownFontSize = 16;
  final double _dropdownWidth = 200;
  final double _dropdownHeight = 40;
  final double _borderWidth = 0.3;
  final double _iconSize = 20;

  @override
  Widget build(BuildContext context) {
    return _dropdownWidget();
  }

  Widget _dropdownWidget() {
    return DropdownButtonHideUnderline(
        child: Container(
            width: _dropdownWidth,
            height: _dropdownHeight,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(quarterDefaultSize),
                border: Border.all(
                    color: nero, width: _borderWidth)),
            child: _dropdownButton()));
  }

  DropdownButton2<String> _dropdownButton() {
    return DropdownButton2<String>(
        isExpanded: true,
        items: items,
        value: value,
        onChanged: onChanged,
        buttonStyleData: _buttonData,
        dropdownStyleData: _dropdownData,
        iconStyleData: _iconData);
  }

  ButtonStyleData get _buttonData => ButtonStyleData(
      overlayColor: MaterialStateProperty.all(Colors.transparent));

  DropdownStyleData get _dropdownData =>
      DropdownStyleData(decoration: BoxDecoration(color: white));

  IconStyleData get _iconData => IconStyleData(
      icon: Padding(
          padding: EdgeInsets.only(right: halfDefaultSize),
          child: Icon(Icons.keyboard_arrow_down_sharp,
              size: _iconSize, color: nero)));

  DropdownMenuItem<String> _menuItemText(String item) {
    return DropdownMenuItem<String>(
        value: item, child: _text(item, fontSize: _dropDownFontSize));
  }

  DropdownMenuItem<String> _menuItemDivider() {
    return DropdownMenuItem<String>(
        enabled: false,
        child: AppViewWidgets.appDivider(height: halfDefaultSize));
  }

  Widget _text(String title, {FontWeight? fontWeight, double? fontSize}) {
    return AppViewWidgets.textMontserrat(title,
        color: nero,
        fontWeight: fontWeight ?? null,
        fontSize: fontSize ?? null);
  }
}