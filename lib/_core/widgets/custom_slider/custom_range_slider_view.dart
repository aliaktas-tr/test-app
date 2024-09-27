import 'package:new_weedus/export.dart';

class CustomRangeSliderView extends StatefulWidget {
  final Function(RangeSliderValues) onChange;
  final int? min;
  final int? max;
  final int? lowerValue;
  final int? upperValue;
  final int barHeight;
  final Color selectedColor;
  final Color deselectedColor;
  final Widget? leftThumbSlider;
  final Widget? rightThumbSlider;
  final Widget? leftLabel;
  final Widget? rightLabel;
  final bool? isPriceRange;
  final bool? isValueRange;

  const CustomRangeSliderView(
      {Key? key,
      required this.onChange,
      this.max,
      this.min,
      this.lowerValue,
      this.upperValue,
      this.barHeight = 2,
      this.selectedColor = effectsBoxColor,
      this.deselectedColor = nero,
      this.leftThumbSlider,
      this.rightThumbSlider,
      this.leftLabel,
      this.rightLabel,
      this.isPriceRange = true,
      this.isValueRange = false})
      : super(key: key);

  @override
  _CustomRangeSliderViewState createState() => _CustomRangeSliderViewState();
}

class _CustomRangeSliderViewState extends State<CustomRangeSliderView> {
  late int lowerValue = 0;
  late int upperValue = 0;
  late Widget leftThumbSlider;
  late Widget rightThumbSlider;
  late Widget leftLabel;
  late Widget rightLabel;
  int? dragStartVal;

  @override
  void initState() {
    if (widget.leftThumbSlider != null) {
      leftThumbSlider = widget.leftThumbSlider!;
    } else {
      leftThumbSlider =
          SliderBuildWidget.getDefaultThumbSlider(key: Key("leftThumbSlider"));
    }
    if (widget.rightThumbSlider != null) {
      rightThumbSlider = widget.rightThumbSlider!;
    } else {
      rightThumbSlider =
          SliderBuildWidget.getDefaultThumbSlider(key: Key("rightThumbSlider"));
    }
    if (widget.leftLabel != null) {
      leftLabel = widget.leftLabel!;
    } else {
      leftLabel = SliderBuildWidget.getDefaultLabel(
          widget.isPriceRange!, lowerValue, upperValue);
    }
    if (widget.rightLabel != null) {
      rightLabel = widget.rightLabel!;
    } else {
      rightLabel = SliderBuildWidget.getDefaultLabel(
          widget.isPriceRange!, lowerValue, upperValue,
          isLeft: false);
    }
    lowerValue = widget.lowerValue!;
    upperValue = widget.upperValue!;
    super.initState();
  }

  void onChange() {
    widget.onChange(
        RangeSliderValues(lowerValue: lowerValue, upperValue: upperValue));
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(flex: lowerValue - widget.min!, child: SizedBox()),
              SliderBuildWidget.getDefaultLabel(
                  widget.isPriceRange!, lowerValue, upperValue),
              Expanded(flex: upperValue - lowerValue, child: SizedBox()),
              SliderBuildWidget.getDefaultLabel(
                  widget.isPriceRange!, lowerValue, upperValue,
                  isLeft: false),
              Expanded(flex: widget.max! - upperValue, child: SizedBox())
            ],
          ),
          SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Row(
              children: [
                Expanded(
                    flex: lowerValue - widget.min!,
                    child: Container(
                        height: widget.barHeight * 1,
                        color: widget.deselectedColor)),
                Column(
                  children: [
                    GestureDetector(
                        onHorizontalDragStart: (DragStartDetails details) {
                          dragStartVal = lowerValue;
                        },
                        onHorizontalDragEnd: (DragEndDetails details) {
                          dragStartVal = null;
                        },
                        onHorizontalDragUpdate: (DragUpdateDetails details) {
                          double totalDistanceTraveled =
                              details.localPosition.dx;
                          double distanceBetweenValues = constraints.maxWidth /
                              (widget.max! - widget.min!);
                          int numSteps =
                              (totalDistanceTraveled / distanceBetweenValues)
                                  .round();
                          int beforeChange = lowerValue;
                          if (dragStartVal != null) {
                            setState(() {
                              lowerValue = dragStartVal! + numSteps;
                              if (lowerValue < widget.min!)
                                lowerValue = widget.min!;
                              if (lowerValue >= upperValue) {
                                lowerValue = upperValue - 1;
                              }
                            });
                            if (beforeChange != lowerValue) onChange();
                          }
                        },
                        child: leftThumbSlider)
                  ],
                ),
                Expanded(
                    flex: upperValue - lowerValue,
                    child: Container(
                        height: widget.barHeight * 1,
                        color: widget.selectedColor)),
                Column(
                  children: [
                    GestureDetector(
                      onHorizontalDragStart: (DragStartDetails details) {
                        dragStartVal = upperValue;
                      },
                      onHorizontalDragEnd: (DragEndDetails details) {
                        dragStartVal = null;
                      },
                      onHorizontalDragUpdate: (DragUpdateDetails details) {
                        double totalDistanceTraveled = details.localPosition.dx;
                        double distanceBetweenValues =
                            constraints.maxWidth / (widget.max! - widget.min!);
                        int numSteps =
                            (totalDistanceTraveled / distanceBetweenValues)
                                .round();
                        int beforeChange = upperValue;
                        if (dragStartVal != null) {
                          setState(() {
                            upperValue = dragStartVal! + numSteps;
                            if (upperValue > widget.max!)
                              upperValue = widget.max!;
                            if (upperValue <= lowerValue) {
                              upperValue = lowerValue + 1;
                            }
                          });
                          if (beforeChange != upperValue) onChange();
                        }
                      },
                      child: rightThumbSlider,
                    ),
                  ],
                ),
                Expanded(
                  flex: widget.max! - upperValue,
                  child: Container(
                    height: widget.barHeight * 1,
                    color: widget.deselectedColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

class RangeSliderValues {
  int lowerValue;
  int upperValue;

  RangeSliderValues({required this.lowerValue, required this.upperValue});
}

