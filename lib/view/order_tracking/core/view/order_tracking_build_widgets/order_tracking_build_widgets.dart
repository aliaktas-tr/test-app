import 'package:new_weedus/export.dart';

class OrderTrackingBuildWidgets {
  static final double _containerWidth = 450;
  static final double _mapSize = 500;
  static final EdgeInsetsGeometry? _padding =
      EdgeInsets.symmetric(horizontal: halfDefaultSize);
  static BoxDecoration _boxDecoration = BoxDecoration(
      border: Border(right: BorderSide(color: effectsBoxColor.darken(25))));

  static Row buildDesktopView(BuildContext context) => Row(children: [
        Container(
            width: _containerWidth,
            height: context.height,
            padding: _padding,
            decoration: _boxDecoration,
            child: _getTrackingOrderView(hasScroll: true)),
        Expanded(child: _map(hasSizedBox: false))
      ]);

  static ListView buildMobileView(BuildContext context) =>
      ListView(shrinkWrap: true, children: [
        _trackingOrderView(context),
        SizedBox(height: halfDefaultSize),
        _map()
      ]);

  static Widget _trackingOrderView(BuildContext context) => Container(
      width: double.infinity,
      padding: _padding,
      decoration: Responsive.isMobile(context) ? null : _boxDecoration,
      child: _getTrackingOrderView(hasScroll: false));

  static Padding _getTrackingOrderView({bool hasScroll = true}) => Padding(
      padding: const EdgeInsets.only(top: doubleDefaultSize),
      child: hasScroll
          ? SingleChildScrollView(child: TrackingOrderView())
          : TrackingOrderView());

  static Widget _map({bool hasSizedBox = true}) => hasSizedBox
      ? SizedBox(
          width: double.infinity, height: _mapSize, child: TrackingMapView())
      : TrackingMapView();
}
