import 'package:new_weedus/export.dart';

class TrackingOrderViewBuildWidgets {
  static final TrackingOrderViewModel _viewModel = TrackingOrderViewModel();

  static Widget buildWidget(CartState _cart) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _userColumn(_cart),
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: doubleDefaultSize),
                child: _divider()),
            _orderTrackingWidget(orderDate: _viewModel.formattedDate),
         /*   Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: doubleDefaultSize),
                child: _divider()),
            _text('${_viewModel.summeryTitle} (${_cart.itemCount2})',
                fontSize: _viewModel.summerFontSize,
                fontWeight: FontWeight.w600),
            SizedBox(height: halfDefaultSize),
            _cart.itemCount2 < 1
                ? SizedBox.shrink()
                : Container(
                    padding: EdgeInsets.symmetric(vertical: defaultSize),
                    child: _buildOrders(cart: _cart)),
            _cart.itemCount2 < 1
                ? SizedBox.shrink()
                : SizedBox(height: halfDefaultSize),*/
          ],
        ),
      );

  static Widget _userColumn(CartState cart) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            padding: EdgeInsets.all(2),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: effectsBoxColor),
            child: Icon(Icons.person, color: effectsTextColor)),
        _halfSizedBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _text(_viewModel.userTitle, fontSize: _viewModel.titleFontSize),
            _quarterSizedBox,
            _rowOrderInformationText(
                _viewModel.orderIDTitle, _viewModel.orderNumber),
            _quarterSizedBox,
            _rowOrderInformationText(
                _viewModel.orderDateTitle, '${_viewModel.formattedDate}'),
            SizedBox(height: defaultSize),
            _rowOrderInformationText(
                _viewModel.phoneTitle, _viewModel.phoneNumber),
            _quarterSizedBox,
            _rowOrderInformationText(
                _viewModel.deliveryTitle, _viewModel.address),
            SizedBox(height: defaultSize),
            _rowOrderInformationText(_viewModel.totalTitle,
                '${formatPrice(cart.getTotalAmountAfterTaxes/*cart.getTotalAmountAfterTaxes2*/)}'),
          ],
        )
      ],
    );
  }

  static SizedBox get _halfSizedBox => SizedBox(width: halfDefaultSize);

  static SizedBox get _quarterSizedBox => SizedBox(height: defaultSize / 4);

  static Widget _rowOrderInformationText(String? title, String? value) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
          width: _viewModel.titleWidth,
          child: _text(title, fontWeight: FontWeight.w400)),
      _text(': ', fontWeight: FontWeight.w400),
      SizedBox(width: _viewModel.valueWidth, child: _text('$value')),
    ]);
  }

  static Widget _divider(
      {double? height, double? horizontalPadding = halfDefaultSize}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding!),
      child: AppViewWidgets.appDivider(height: height ?? 0),
    );
  }

  static Widget _orderTrackingWidget({String? orderDate}) {
    return TrackingStepsView(
        status: Status.order,
        activeColor: appColor,
        inActiveColor: effectsBoxColor.darken(2),
        orderTitleAndDateList: _viewModel.orderList);
  }

  static Widget _buildOrders({CartState? cart}) {
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount:cart!.cartItems!.length /*cart!.cartItems2.length*/,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: halfDefaultSize),
        itemBuilder: (context, index) {
          final product =cart.cartItems!.values.toList()[index] /*cart.cartItems2.values.toList()[index]*/;
          return TrackingViewOrderCardView(product: product);
        },
        separatorBuilder: (_, index) => _divider(height: defaultSize));
  }

  static Widget _text(String? title,
      {FontWeight? fontWeight,
      double? fontSize,
      Color? color,
      TextAlign? textAlign,
      double? height,
      TextDecoration? decoration,
      double? decorationThickness}) {
    return AppViewWidgets.textMontserrat(title!,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? nero,
        fontSize: fontSize ?? _viewModel.fontSize,
        textAlign: textAlign,
        height: height,
        decoration: decoration,
        decorationThickness: decorationThickness);
  }
}
