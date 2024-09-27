import 'package:new_weedus/export.dart';

class _CheckoutOrderViewConstants {
  _CheckoutOrderViewConstants._();

  static final double _titleFontSize = 20;
  static final double _subTitleFontSize = 16;
  static final double _fontSize = 14;
  static final double _subFontSize = 12;
  static final double _borderWidth = 0.5;
  static final int _maxDarkenValue = 25;
  static final int _midDarkenValue = 20;
  static final int _minDarkenValue = 10;
  static final int _animatedContainerDuration = 250;
  static final double _dividerHeight = 6.0;
  static final double _taxContainerHeight = 100;
  static final double _leftPaddingValue = 4.0;
  static final int _darkenValue = 25;

  static BoxDecoration get _boxDecoration => BoxDecoration(
      border: Border.all(
          color: effectsBoxColor.darken(_darkenValue), width: _borderWidth));
}

class CheckoutOrderViewBuildWidgets {
  static Column buildWidget(BuildContext context,
          {CartState? cartState,
          bool? expand,
          bool? displayAllTaxes,
          VoidCallback? cartOnTap,
          VoidCallback? taxIconTap}) =>
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _header(cartState!),
            _halfHeightSizedBox,
            _buildOrdersStack(cartState, expand!, cartOnTap!),
            _emptySpace(cartState),
            _amountContainer(context, cartState,
                displayAllTaxes: displayAllTaxes, taxIconTap: taxIconTap)
          ]);

  static Widget _header(CartState cartState) =>
      _summaryTitleAndOrderCounter(cartState);

  static Widget get _halfHeightSizedBox => SizedBox(height: halfDefaultSize);

  static Widget _buildOrdersStack(
          CartState cartState, bool expand, VoidCallback cartOnTap) =>
      Stack(children: [
        _buildOrder(cartState, expand, cartOnTap),
        _emptySpace(cartState)
      ]);

  static Widget _buildOrder(
          CartState cartState, bool expand, VoidCallback cartOnTap) =>
      cartState.itemCount < 1
          ? SizedBox.shrink()
          : Container(
              padding: EdgeInsets.symmetric(vertical: halfDefaultSize),
              decoration: _CheckoutOrderViewConstants._boxDecoration,
              child: _buildOrders(
                  cart: cartState, expand: expand, cartOnTap: cartOnTap));

  static Widget _emptySpace(CartState cartState) => cartState.itemCount < 1
      ? SizedBox.shrink()
      : SizedBox(height: defaultSize);

  static Widget _summaryTitleAndOrderCounter(CartState cartProvider) => Padding(
      padding:
          EdgeInsets.only(left: _CheckoutOrderViewConstants._leftPaddingValue),
      child: _text('${AppStrings.orderSummary} (${cartProvider.itemCount})',
          fontSize: _CheckoutOrderViewConstants._titleFontSize,
          color: nero,
          fontWeight: FontWeight.w600));

  static Widget _summaryPriceAndTaxes(
          {String? title,
          dynamic value,
          bool? addTaxWidget = false,
          double? fontSize,
          Color? fontColor,
          FontWeight? fontWeight,
          VoidCallback? taxIconTap}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultSize),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              _text('$title: ',
                  fontSize:
                      fontSize ?? _CheckoutOrderViewConstants._subTitleFontSize,
                  fontWeight: fontWeight ?? FontWeight.w600,
                  color: fontColor ?? nero),
              SizedBox(width: halfDefaultSize),
              addTaxWidget!
                  ? AppViewWidgets.customInkWell(
                      onTap: taxIconTap,
                      child: Icon(Icons.info_outline,
                          color: effectsBoxColor.darken(
                              _CheckoutOrderViewConstants._minDarkenValue)))
                  : SizedBox.shrink()
            ]),
            _text(formatPrice(value),
                fontSize:
                    fontSize ?? _CheckoutOrderViewConstants._subTitleFontSize,
                fontWeight: fontWeight ?? FontWeight.w600,
                color: fontColor ?? nero)
          ],
        ),
      );

  static Widget _amountContainer(BuildContext context, CartState cart,
      {bool? displayAllTaxes, VoidCallback? taxIconTap}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: halfDefaultSize),
      decoration: BoxDecoration(
        border: Border.all(
            color: effectsBoxColor
                .darken(_CheckoutOrderViewConstants._midDarkenValue),
            width: _CheckoutOrderViewConstants
                ._borderWidth), /*borderRadius: BorderRadius.circular(quarterDefaultSize)*/
      ),
      child: Column(
        children: [
          _summaryPriceAndTaxes(
              title: AppStrings.subTotal, value: cart.subTotal),
          SizedBox(height: quarterDefaultSize),
          _summaryPriceAndTaxes(
              title: AppStrings.taxes,
              value: cart.taxesAmount,
              addTaxWidget: true,
              taxIconTap: taxIconTap),
          SizedBox(height: defaultSize + 2),
          AnimatedContainer(
              height: displayAllTaxes!
                  ? _CheckoutOrderViewConstants._taxContainerHeight
                  : 0,
              duration: Duration(
                  milliseconds:
                      _CheckoutOrderViewConstants._animatedContainerDuration),
              child: _getAnimatedContainerList(context, cart)),
          _summaryDivider(height: _CheckoutOrderViewConstants._dividerHeight),
          SizedBox(height: halfDefaultSize),
          _summaryPriceAndTaxes(
              title: AppStrings.total, value: cart.getTotalAmountAfterTaxes),
        ],
      ),
    );
  }

  static Widget _getAnimatedContainerList(
          BuildContext context, CartState cart) =>
      ListView(shrinkWrap: true, children: [
        _taxWidget(
            title: AppStrings.cannabisTaxTitle, value: cart.totalCannabisTax),
        _taxWidget(title: AppStrings.salesTaxTitle, value: cart.totalSalesTax),
        SizedBox(height: halfDefaultSize),
        _summaryDivider(),
        Padding(
            padding: EdgeInsets.all(context.width * 0.01),
            child: _text(AppStrings.taxInfo,
                fontWeight: FontWeight.normal,
                fontSize: _CheckoutOrderViewConstants._subFontSize,
                textAlign: TextAlign.center,
                color: effectsBoxColor
                    .darken(_CheckoutOrderViewConstants._maxDarkenValue)))
      ]);

  static Widget _buildOrders(
      {CartState? cart, bool? expand, VoidCallback? cartOnTap}) {
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: cart!.cartItems!.length,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: halfDefaultSize),
        itemBuilder: (context, index) {
          final item = cart.cartItems!.values.toList()[index];
          return CheckoutOrderCardView(
              product: item, expand: expand, onTap: cartOnTap, cart: cart);
        },
        separatorBuilder: (_, index) => _summaryDivider(height: defaultSize));
  }

  static Widget _taxWidget(
          {String? title, dynamic value}) =>
      _summaryPriceAndTaxes(
          fontColor: effectsBoxColor
              .darken(_CheckoutOrderViewConstants._maxDarkenValue),
          fontWeight: FontWeight.w500,
          fontSize: _CheckoutOrderViewConstants._fontSize,
          title: title,
          value: value);

  static Widget _summaryDivider(
          {double? height, double? horizontalPadding = halfDefaultSize}) =>
      Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding!),
          child: AppViewWidgets.appDivider(height: height ?? 0));

  static Widget _text(String? title,
          {FontWeight? fontWeight,
          double? fontSize,
          Color? color,
          TextAlign? textAlign,
          double? height,
          TextDecoration? decoration,
          double? decorationThickness}) =>
      AppViewWidgets.textMontserrat(title!,
          fontWeight: fontWeight ?? FontWeight.w500,
          color: color ?? effectsTextColor,
          fontSize: fontSize,
          textAlign: textAlign,
          height: height,
          decoration: decoration,
          decorationThickness: decorationThickness);
}
