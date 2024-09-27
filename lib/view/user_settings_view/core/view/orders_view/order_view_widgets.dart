import 'package:new_weedus/export.dart';

class OrderViewWidgets {
  static const String _path = 'assets/app/empty_order.svg';
  static const double _svgSize = 150;
  static final String _desc = 'You have no past orders!';
  static final String _title = 'Orders';
  static final double _titleFontSize = 30;

  static Widget buildWidget() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppViewWidgets.textMontserrat(_title,
              fontSize: _titleFontSize, fontWeight: FontWeight.w600),
          SizedBox(height: 40),
          Center(child: _buildWidget())
        ],
      );

  static Padding _buildWidget() => Padding(
      padding: const EdgeInsets.only(right: 80.0, top: 90.0),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _svg(),
            SizedBox(height: doubleDefaultSize),
            _description()
          ]));

  static Widget _svg() => SvgPicture.asset(_path, height: _svgSize);

  static Widget _description() =>
      AppViewWidgets.textMontserrat(_desc, fontSize: 24, color: nero);
}
