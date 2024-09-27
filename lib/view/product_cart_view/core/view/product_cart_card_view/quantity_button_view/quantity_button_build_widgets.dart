import 'package:new_weedus/export.dart';

class _QuantityButtonConstants {
  _QuantityButtonConstants._();

  static final double _size = 28.5;
  static final double _buttonHeight = 30;
  static final double _buttonWidth = 30;
  static final double _textWidth = 25;
  static final double _iconSize = 18;
  static final int _darkenValue = 20;
  static final double _quantityFontSize = 15;
  static final double _borderWidth = 2.0;
  static final String _flower = 'flower';
  static final String _preRoll = 'preRoll';
  static final String _concentrate = 'concentrate';

  static BoxDecoration get _boxDecoration =>
      BoxDecoration(border: Border(bottom: _borderSide, top: _borderSide));

  static BorderSide get _borderSide =>
      BorderSide(width: _borderWidth, color: effectsBoxColor);

  static Radius get _getRadius => Radius.circular(quarterDefaultSize);

  static Radius get _getDefaultRadius => Radius.circular(defaultSize);
}

class QuantityButtonBuildWidgets {
  static Padding buildWidgets(Product product, CartState cart) =>
      Padding(
          padding: const EdgeInsets.only(
              top: quarterDefaultSize, right: quarterDefaultSize),
          child: Row(children: [
            _removeButton(product, cart),
            _quantityText(product),
            _addButton(product, cart)
          ]));

  static Widget _removeButton(Product product, CartState cart) =>
      _customButton(
          icon: product.quantity! <= 1 ? Icons.delete_forever : Icons.remove,
          onTap: () =>cart.reduceItem(product: product), //cart.reduceItemF(product: product),
          overlayColor: Colors.red.darken(
              _QuantityButtonConstants._darkenValue),
          hoveredColor: white9,
          borderRadius: BorderRadius.only(
            topLeft: _QuantityButtonConstants._getDefaultRadius,
            bottomLeft: _QuantityButtonConstants._getDefaultRadius,
          ));

  static Widget _quantityText(Product product) =>
      Container(
          width: _QuantityButtonConstants._textWidth,
          height: _QuantityButtonConstants._buttonHeight,
          decoration: _QuantityButtonConstants._boxDecoration,
          child: Center(
              child: AppViewWidgets.textMontserrat(product.quantity.toString(),
                  textAlign: TextAlign.center,
                  fontSize: _QuantityButtonConstants._quantityFontSize,
                  fontWeight: FontWeight.w500)));

  static Widget _addButton(Product product, CartState cart,
      {VoidCallback? onTap}) =>
      _customButton(
          icon: Icons.add,
          onTap: product.product == _QuantityButtonConstants._flower ||
              product.product == _QuantityButtonConstants._preRoll ||
              product.product == _QuantityButtonConstants._concentrate
              ? product.size! + cart.totalSize >= _QuantityButtonConstants._size
              ? onTap
              : () async => cart.addItem(product: product)
              : () async => cart.addItem(product: product),
          overlayColor: effectsTextColor,
          hoveredColor: effectsBoxColor,
          borderRadius: BorderRadius.only(
              topRight: _QuantityButtonConstants._getDefaultRadius,
              bottomRight: _QuantityButtonConstants._getDefaultRadius));

  static Widget _customButton({Color? overlayColor,
    Color? hoveredColor,
    BorderRadiusGeometry? borderRadius,
    IconData? icon,
    VoidCallback? onTap}) =>
      CustomTextButton(
          buttonHeight: _QuantityButtonConstants._buttonHeight,
          buttonWidth: _QuantityButtonConstants._buttonWidth,
          child: Icon(icon, size: _QuantityButtonConstants._iconSize),
          onTap: onTap,
          overlayColor: WidgetStateProperty.all(overlayColor),
          hoveredColor: hoveredColor!,
          borderRadius: borderRadius);
}
