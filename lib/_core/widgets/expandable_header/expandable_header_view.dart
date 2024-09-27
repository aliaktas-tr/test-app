import 'package:new_weedus/export.dart';

class ProductFilterExpandableHeader extends StatefulWidget {
  ProductFilterExpandableHeader({
    Key? key,
    required this.headerTitle,
    this.initialExpanded = false,
    this.min,
    this.max,
    this.lowerValue,
    this.upperValue,
    this.isPriceRange = true,
    this.isSliderWidget = false,
    this.value,
    this.text,
    this.onValueChange,
  }) : super(key: key);

  final String headerTitle;
  final bool initialExpanded;
  final int? min;
  final int? max;
  final int? lowerValue;
  final int? upperValue;
  final bool isPriceRange;
  final bool isSliderWidget;
  final List<bool>? value;
  final List<String>? text;
  final ValueChanged<dynamic>? onValueChange;

  @override
  _ProductFilterExpandableHeaderState createState() =>
      _ProductFilterExpandableHeaderState();
}

class _ProductFilterExpandableHeaderState
    extends State<ProductFilterExpandableHeader> {
  double _fontSize = 20.0;
  int _darkenValue = 25;

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        initialExpanded: widget.initialExpanded,
        child: ScrollOnExpand(
            child: ExpandablePanel(
                theme: const ExpandableThemeData(
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToExpand: false,
                    tapBodyToCollapse: false,
                    hasIcon: false),
                header: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppViewWidgets.textMontserrat(widget.headerTitle,
                          color: nero,
                          fontSize: _fontSize,
                          fontWeight: FontWeight.w600),
                      ExpandableIcon(
                          theme: ExpandableThemeData(
                              expandIcon: FontAwesomeIcons.plus,
                              collapseIcon: FontAwesomeIcons.minus,
                              iconColor: effectsBoxColor.darken(_darkenValue),
                              iconSize: defaultSize,
                              hasIcon: false))
                    ]),
                collapsed: const SizedBox.shrink(),
                expanded: Padding(
                    padding: const EdgeInsets.only(top: defaultSize),
                    child: widget.isSliderWidget
                        ? _buildSlider()
                        : _buildCheckboxGrid()))));
  }

  Widget _buildSlider() {
    return CustomRangeSliderView(
        onChange: (RangeSliderValues val) {
          widget.onValueChange!(RangeValues(
              val.lowerValue.toDouble(), val.upperValue.toDouble()));
        },
        isPriceRange: widget.isPriceRange,
        min: widget.min,
        max: widget.max,
        lowerValue: widget.lowerValue,
        upperValue: widget.upperValue,
        barHeight: 6,
        selectedColor: appColor,
        deselectedColor: appColor.withOpacity(0.3));
  }

  Widget _buildCheckboxGrid() {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.text!.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          childAspectRatio: 5.5,
        ),
        itemBuilder: (context, index) => CustomCheckBoxView(
            value: widget.value![index],
            text: widget.text![index],
            onChanged: (val) {
              setState(() {
                widget.value![index] = val!;
                widget.onValueChange!(widget.value);
              });
            }));
  }
}

class PaymentExpandableHeader extends StatefulWidget {
  PaymentExpandableHeader({
    Key? key,
    this.initialExpanded = false,
    required this.child,
  }) : super(key: key);

  final bool initialExpanded;
  final Widget child;

  @override
  _PaymentExpandableHeaderState createState() =>
      _PaymentExpandableHeaderState();
}

class _PaymentExpandableHeaderState extends State<PaymentExpandableHeader> {
  String _paymentTitle = 'Payment';
  String _addPaymentTitle = 'add payment method';
  double _fontSize = 20.0;

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        initialExpanded: widget.initialExpanded,
        child: ScrollOnExpand(
            child: ExpandablePanel(
                theme: const ExpandableThemeData(
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToExpand: false,
                    tapBodyToCollapse: false,
                    hasIcon: false),
                header: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_paymentTitle,
                          style: GoogleFonts.michroma(
                              fontSize: _fontSize, color: appColor)),
                      ExpandableIcon(
                          theme: ExpandableThemeData(
                              expandIcon: FontAwesomeIcons.plus,
                              collapseIcon: FontAwesomeIcons.minus,
                              iconColor: appColor,
                              iconSize: defaultSize,
                              hasIcon: false))
                    ]),
                collapsed: const SizedBox.shrink(),
                expanded: Padding(
                    padding: const EdgeInsets.only(top: defaultSize),
                    child: widget.child))));
  }
}
