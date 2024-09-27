import 'package:new_weedus/export.dart';

class TrackingStepsView extends StatefulWidget {
  final Status? status;
  final List<TextAndDateTimeModel>? orderTitleAndDateList;
  final List<TextAndDateTimeModel>? shippedTitleAndDateList;
  final List<TextAndDateTimeModel>? outOfDeliveryTitleAndDateList;
  final List<TextAndDateTimeModel>? deliveredTitleAndDateList;
  final String? orderDateTime;
  final String? shippedDateTime;
  final String? deliveredDateTime;
  final Color? activeColor;
  final Color? inActiveColor;
  final Color? statusColor;
  final Color? titleColor;
  final Color? timeColor;
  final bool? hasTitle;

  const TrackingStepsView(
      {Key? key,
      required this.status,
      this.orderTitleAndDateList,
      this.shippedTitleAndDateList,
      this.outOfDeliveryTitleAndDateList,
      this.deliveredTitleAndDateList,
      this.orderDateTime,
      this.shippedDateTime,
      this.deliveredDateTime,
      this.activeColor,
      this.inActiveColor,
      this.statusColor,
      this.titleColor,
      this.timeColor,
      this.hasTitle = true})
      : super(key: key);

  @override
  State<TrackingStepsView> createState() => _TrackingStepsViewState();
}

class _TrackingStepsViewState extends State<TrackingStepsView>
    with TickerProviderStateMixin {
  AnimationController? controller;
  AnimationController? controller2;
  AnimationController? controller3;

  bool isFirst = false;
  bool isSecond = false;
  bool isThird = false;

  @override
  void initState() {
    if (widget.status?.name == Status.order.name) {
      controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      )..addListener(() {
          if (controller?.value != null && controller!.value > 0.99) {
            if (mounted) controller?.stop();
          }
          setState(() {});
        });
    } else if (widget.status?.name == Status.shipped.name) {
      controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      )..addListener(() {
          if (controller?.value != null && controller!.value > 0.99) {
            if (mounted) controller?.stop();
            controller2?.stop();
            isFirst = true;
            controller2?.forward(from: 0.0);
          }
          setState(() {});
        });

      controller2 = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      )..addListener(() {
          if (controller2?.value != null && controller2!.value > 0.99) {
            if (mounted) controller2?.stop();
            controller3?.stop();
            isSecond = true;
            controller3?.forward(from: 0.0);
          }
          setState(() {});
        });
    } else if (widget.status?.name == Status.outOfDelivery.name ||
        widget.status?.name == Status.delivered.name) {
      controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      )..addListener(() {
          if (controller?.value != null && controller!.value > 0.99) {
            if (mounted) controller?.stop();
            controller2?.stop();
            controller3?.stop();
            isFirst = true;
            controller2?.forward(from: 0.0);
          }
          setState(() {});
        });

      controller2 = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      )..addListener(() {
          if (controller2?.value != null && controller2!.value > 0.99) {
            if (mounted) controller2?.stop();
            controller3?.stop();
            isSecond = true;
            controller3?.forward(from: 0.0);
          }
          setState(() {});
        });

      controller3 = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      )..addListener(() {
          if (controller3?.value != null && controller3!.value > 0.99) {
            if (mounted) controller3?.stop();
            isThird = true;
          }
          setState(() {});
        });
    }

    controller?.repeat(reverse: false);
    controller2?.repeat(reverse: false);
    controller3?.repeat(reverse: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.hasTitle!
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppViewWidgets.textMontserrat('Order Status',
                      fontSize: 20, color: nero, fontWeight: FontWeight.w600),
                  SizedBox(height: defaultSize),
                ],
              )
            : SizedBox.shrink(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _statusTitleRow(
                decoration: BoxDecoration(
                  color: widget.activeColor ?? Colors.green,
                  //borderRadius: _borderRadius
                ),
                statusTitle: 'Order Placed',
                statusDateTime: widget.orderDateTime),
            Row(
              children: [
                _verticalProgress(
                    textAndDateTimeList: widget.orderTitleAndDateList,
                    animationController: controller),
                _widthWhiteSpace(),
                Expanded(
                    child: _listSeparated(
                        padding: EdgeInsets.zero,
                        textAndDateTimeList: widget.orderTitleAndDateList))
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _statusTitleRow(
                decoration: BoxDecoration(
                  color: (widget.status?.name == Status.shipped.name ||
                              widget.status?.name ==
                                  Status.outOfDelivery.name ||
                              widget.status?.name == Status.delivered.name) &&
                          isFirst == true
                      ? widget.activeColor ?? Colors.green
                      : widget.inActiveColor ?? Colors.grey[300],
                  //borderRadius: _borderRadius
                ),
                statusTitle: 'Shipped',
                statusDateTime: widget.shippedDateTime),
            Row(
              children: [
                _verticalProgress(
                    textAndDateTimeList: widget.shippedTitleAndDateList,
                    animationController: controller2,
                    color: isFirst == true
                        ? widget.activeColor ?? Colors.green
                        : widget.inActiveColor ?? Colors.grey[300]),
                _widthWhiteSpace(),
                Expanded(
                    child: _listSeparated(
                        padding: EdgeInsets.zero,
                        textAndDateTimeList: widget.shippedTitleAndDateList))
              ],
            ),
          ],
        ),
        Column(
          children: [
            _statusTitleRow(
                decoration: BoxDecoration(
                  color: widget.status?.name == Status.delivered.name &&
                          isThird == true
                      ? widget.activeColor ?? Colors.green
                      : widget.inActiveColor ?? Colors.grey[300],
                  //borderRadius: _borderRadius
                ),
                statusTitle: 'Delivered',
                statusDateTime: widget.deliveredDateTime),
            _listSeparated(
                padding: const EdgeInsets.only(left: 40, top: 6),
                textAndDateTimeList: widget.deliveredTitleAndDateList)
          ],
        ),
      ],
    );
  }

  Widget _widthWhiteSpace() {
    return const SizedBox(width: 30);
  }

  Widget _statusTitleRow(
      {Decoration? decoration, String? statusTitle, String? statusDateTime}) {
    return Row(children: [
      Container(height: 15, width: 15, decoration: decoration ?? null),
      const SizedBox(width: 20),
      Text.rich(TextSpan(children: [
        TextSpan(
            text: statusTitle ?? '',
            style: _textStyle(fontSize: 16, color: widget.statusColor)),
        WidgetSpan(child: SizedBox(width: halfDefaultSize)),
        TextSpan(
            text: statusDateTime ?? '',
            style: _textStyle(fontSize: 14, color: effectsBoxColor.darken(15)))
      ]))
    ]);
  }

  Widget _verticalProgress(
      {List<TextAndDateTimeModel>? textAndDateTimeList,
      AnimationController? animationController,
      Color? color}) {
    return Padding(
        padding: const EdgeInsets.only(left: 6),
        child: SizedBox(
            width: 2,
            height:
                textAndDateTimeList != null && textAndDateTimeList.isNotEmpty
                    ? textAndDateTimeList.length * 46
                    : 60,
            child: RotatedBox(
                quarterTurns: 1,
                child: LinearProgressIndicator(
                    value: animationController?.value ?? 0.0,
                    backgroundColor: widget.inActiveColor ?? Colors.grey[300],
                    color: color ?? widget.activeColor ?? Colors.green))));
  }

  Widget _listSeparated(
      {EdgeInsetsGeometry? padding,
      List<TextAndDateTimeModel>? textAndDateTimeList}) {
    return ListView.separated(
        shrinkWrap: true,
        padding: padding ?? null,
        itemBuilder: (context, index) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppViewWidgets.textMontserrat(
                    textAndDateTimeList![index].title ?? '',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: widget.titleColor ?? nero),
                SizedBox(height: defaultSize / 4),
                AppViewWidgets.textMontserrat(
                    textAndDateTimeList[index].date ?? '',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: widget.timeColor ?? effectsTextColor)
              ]);
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: defaultSize / 4);
        },
        itemCount: textAndDateTimeList != null && textAndDateTimeList.isNotEmpty
            ? textAndDateTimeList.length
            : 0);
  }

  TextStyle _textStyle(
      {double? fontSize, FontWeight? fontWeight, Color? color}) {
    return GoogleFonts.montserrat(
      fontSize: fontSize ?? null,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? nero,
    );
  }
}

/*class TextAndDateTimeModel {
  String? title;
  String? date;

  TextAndDateTimeModel(this.title, this.date);
}

enum Status { order, shipped, outOfDelivery, delivered }*/

/// OUT OF DELIVERY
/* Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                      color:
                      (widget.status?.name == Status.outOfDelivery.name ||
                          widget.status?.name ==
                              Status.delivered.name) &&
                          isSecond == true
                          ? widget.activeColor ?? Colors.green
                          : widget.inActiveColor ?? Colors.grey[300],
                      borderRadius: BorderRadius.circular(50)),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: "Out of delivery ",
                          style: widget.headingTitleStyle ??
                              const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                      TextSpan(
                        text: "Fri, 29th Mar '22",
                        style: widget.headingDateTextStyle ??
                            const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: SizedBox(
                    width: 2,
                    height: widget.outOfDeliveryTitleAndDateList != null &&
                        widget.outOfDeliveryTitleAndDateList!.isNotEmpty
                        ? widget.outOfDeliveryTitleAndDateList!.length * 56
                        : 60,
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: LinearProgressIndicator(
                        value: controller3?.value ?? 0.0,
                        backgroundColor:
                        widget.inActiveColor ?? Colors.grey[300],
                        color: isSecond == true
                            ? widget.activeColor ?? Colors.green
                            : widget.inActiveColor ?? Colors.grey[300],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.outOfDeliveryTitleAndDateList?[index]
                                  .title ??
                                  "",
                              style: widget.subTitleTextStyle ??
                                  const TextStyle(fontSize: 14),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              widget.outOfDeliveryTitleAndDateList?[index]
                                  .date ??
                                  "",
                              style: widget.subDateTextStyle ??
                                  TextStyle(
                                      fontSize: 14, color: Colors.grey[300]),
                            )
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 4,
                        );
                      },
                      itemCount: widget.outOfDeliveryTitleAndDateList != null &&
                          widget.outOfDeliveryTitleAndDateList!.isNotEmpty
                          ? widget.outOfDeliveryTitleAndDateList!.length
                          : 0),
                )
              ],
            ),
          ],
        ),*/
