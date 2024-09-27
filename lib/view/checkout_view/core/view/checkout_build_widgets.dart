import 'package:new_weedus/export.dart';

class CheckoutBuildWidgets {
  static final double _responsiveSize = 1200;
  static final double _cardFieldSize = 550;
  static final int _dotAnimationDuration = 250;
  static final double _lottieAssetSuccessSize = 500;
  static final double _lottieAssetProcessingSize = 400;
  static final double _lottieTextMargin = 400;
  static final double _titleFontSize = 20;
  static final String _lottieAssetSuccess = 'assets/animated/p_s2.json';
  static final String _lottieAssetProcessing =
      'assets/animated/payment_waiting.json';
  static final String _paymentSuccessTitle =
      'Your payment was successful.\nThank you for your payment.';
  static final String _paymentProcessingTitle =
      'Please wait while we are processing your payment.';

  static Widget buildWidget(
      BuildContext context,
      CartState _cart,
      bool isSuccess,
      bool isPaying,
      GlobalKey<FormState> formKey,
      bool hasSignIn,
      {VoidCallback? loginOnTap,
      VoidCallback? makePaymentOnTap}) {
    if (isSuccess) {
      return _paymentSuccess;
    } else {
      return _animatedContainer(context, _cart, isPaying, formKey, hasSignIn,
          loginOnTap: loginOnTap, makePaymentOnTap: makePaymentOnTap);
    }
  }

  static Widget _animatedContainer(BuildContext context, CartState _cart,
          bool isPaying, GlobalKey<FormState> formKey, bool hasSignIn,
          {VoidCallback? loginOnTap, VoidCallback? makePaymentOnTap}) =>
      AnimatedContainer(
          duration: Duration(milliseconds: _dotAnimationDuration),
          child: isPaying
              ? _paymentProcessing
              : _responseList(context, _cart, formKey, hasSignIn, isPaying,
                  loginOnTap: loginOnTap, makePaymentOnTap: makePaymentOnTap));

  static Widget get _paymentProcessing => Center(
          child: Stack(alignment: Alignment.center, children: [
        _lottieAsset(_lottieAssetProcessing, _lottieAssetProcessingSize),
        _lottieText(_paymentProcessingTitle)
      ]));

  static Center get _paymentSuccess => Center(
          child: Stack(alignment: Alignment.center, children: [
        _lottieAsset(_lottieAssetSuccess, _lottieAssetSuccessSize),
        _lottieText(_paymentSuccessTitle)
      ]));

  static Widget _lottieAsset(String assetName, double size) =>
      Lottie.asset(assetName, repeat: false, width: size, height: size);

  static Widget _lottieText(String title) => Container(
      margin: EdgeInsets.only(top: _lottieTextMargin),
      child: AppViewWidgets.textMontserrat(title,
          fontWeight: FontWeight.w600, fontSize: _titleFontSize));

  static Widget _responseList(BuildContext context, CartState _cart,
          GlobalKey<FormState> formKey, bool hasSignIn, bool isPaying,
          {VoidCallback? loginOnTap, VoidCallback? makePaymentOnTap}) =>
      ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(
            horizontal: context.width >= _responsiveSize
                ? context.width * 0.01
                : context.width * 0.05,
            vertical: kToolbarHeight),
        children: [
          context.width >= _responsiveSize
              ? _responseRow(_cart, formKey, hasSignIn, isPaying,
                  loginOnTap: loginOnTap, makePaymentOnTap: makePaymentOnTap)
              : _responseColumn(_cart, formKey, hasSignIn, isPaying,
                  loginOnTap: loginOnTap, makePaymentOnTap: makePaymentOnTap)
        ],
      );

  static Container _sizedContainer({Widget? child}) =>
      Container(width: _cardFieldSize, child: child);

  static Widget _responseRow(CartState _cart, GlobalKey<FormState> formKey,
          bool hasSignIn, bool isPaying,
          {VoidCallback? loginOnTap, VoidCallback? makePaymentOnTap}) =>
      Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            _sizedContainer(
                child: Column(children: [
              _checkoutFormView(formKey, hasSignIn, loginOnTap: loginOnTap),
              _doubleHeightSizedBox(),
              _checkoutOrders(_cart)
            ])),
            SizedBox(width: doubleDefaultSize),
            _creditCard(_cart, isPaying, makePaymentOnTap: makePaymentOnTap)
          ]);

  static Widget _responseColumn(CartState _cart, GlobalKey<FormState> formKey,
          bool hasSignIn, bool isPaying,
          {VoidCallback? loginOnTap, VoidCallback? makePaymentOnTap}) =>
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            _sizedContainer(
                child: Column(children: [
              _checkoutOrders(_cart),
              _doubleHeightSizedBox(),
              _checkoutFormView(formKey, hasSignIn, loginOnTap: loginOnTap),
              _doubleHeightSizedBox()
            ])),
            _creditCard(_cart, isPaying, makePaymentOnTap: makePaymentOnTap)
          ]);

  static CheckOutOrderView _checkoutOrders(CartState _cart) =>
      CheckOutOrderView(cartState: _cart);

  static SizedBox _doubleHeightSizedBox() =>
      SizedBox(height: doubleDefaultSize);

  static Widget _creditCard(CartState _cart, bool? isPaying,
          {VoidCallback? makePaymentOnTap}) =>
      CreditCardView(onTap: makePaymentOnTap, makingPayment: isPaying);

  static Widget _checkoutFormView(GlobalKey<FormState> formKey, bool hasSignIn,
      {VoidCallback? loginOnTap}) {
    return CheckoutFormView(
        formKey: formKey, hasSignIn: hasSignIn, loginOnTap: loginOnTap);
  }
}
