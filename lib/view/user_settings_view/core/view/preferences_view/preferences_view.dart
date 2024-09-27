import 'package:new_weedus/export.dart';

class PreferencesView extends StatefulWidget {
  const PreferencesView({super.key, required this.onValueChange});

  final ValueChanged<List<bool>> onValueChange;

  @override
  State<PreferencesView> createState() => _PreferencesViewState();

  void onFilterChange(_PreferencesViewState state) {
    onValueChange(state._isChecked);
  }
}

class _PreferencesViewState extends State<PreferencesView> {
  List<bool> _isChecked = List<bool>.filled(text.length, false);
  String _title = 'Preferences';
  String _subTitle = 'Notification Settings';
  double _titleFontSize = 30;
  double _subTitleFontSize = 18;
  double _whiteSpaceBetweenTitleAndSubTitle = 43;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      AppViewWidgets.textMontserrat(_title,
          fontSize: _titleFontSize, fontWeight: FontWeight.w600),
      SizedBox(height: _whiteSpaceBetweenTitleAndSubTitle),
      AppViewWidgets.textMontserrat(_subTitle,
          fontSize: _subTitleFontSize, fontWeight: FontWeight.w600),
      SizedBox(height: defaultSize),
      _BuildCheckBox(
          value: _isChecked,
          text: text,
          onValueChange: (newValue) => setState(() {
                _isChecked = newValue as List<bool>;
                widget.onFilterChange(this);
              }))
    ]);
  }

  static List<String> text = [
    'Receive order status updates via text message',
    'Receive important email updates about weedus',
    'Receive email updates about discounts and offers',
    'Receive email updates about new products'
  ];
}

class _BuildCheckBox extends StatefulWidget {
  const _BuildCheckBox({this.value, this.text, this.onValueChange});

  final List<bool>? value;
  final List<String>? text;
  final ValueChanged<dynamic>? onValueChange;

  @override
  State<_BuildCheckBox> createState() => _BuildCheckBoxState();
}

class _BuildCheckBoxState extends State<_BuildCheckBox> {
  @override
  Widget build(BuildContext context) {
    return buildWidget(context);
  }

  Widget buildWidget(BuildContext context, {Function(bool?)? onChanged}) =>
      ResponsiveGridList(
          shrinkWrap: true,
          desiredItemWidth: context.width,
          children: [
            ...List.generate(
                widget.text!.length,
                (index) => CustomCheckBoxView(
                    value: widget.value![index],
                    text: widget.text![index],
                    isWithTextTruncate: false,
                    onChanged: (val) {
                      setState(() {
                        widget.value![index] = val!;
                        widget.onValueChange!(widget.value);
                      });
                    }))
          ]);
}
