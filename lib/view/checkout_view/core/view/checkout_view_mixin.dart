import 'package:new_weedus/export.dart';

mixin CheckoutViewMixin on State<CheckoutView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _hasSignIn = false;
  bool _isPaying = false;
  bool _hasPaymentDone = false;
  bool _isSuccess = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _id = 'OD123MN45ADX';
  final double _responsiveSize = 1200;
  final double _cardFieldSize = 550;
  final String _waitTitle = 'Wait a second';
  final int _dotAnimationDuration = 250;
  final int _minSecondValue = 3;
  final int _maxSecondValue = 5;
  final double _lottieAssetSuccessSize = 500;
  final double _lottieAssetProcessingSize = 400;
  final double _lottieTextMargin = 400;
  final double _titleFontSize = 20;

  int _count = 3;
  final String _lottieAssetSuccess = 'assets/animated/p_s2.json';
  final String _lottieAssetProcessing = 'assets/animated/payment_waiting.json';
  final String _paymentSuccessTitle =
      'Your payment was successful.\nThank you for your payment.';
  final String _paymentProcessingTitle =
      'Please wait while we are processing your payment.';

  @override
  void initState() {
    final _cart = Provider.of<CartState>(context, listen: false);
    super.initState();
    checkEmptyPage(_cart);
    openEmptyPageDialog(_cart);
  }

  void makePayment(CartState _cart, AuthState authState) {
    _cart.copyCart();

    setState(() {
      _isPaying = true;
    });
    Future.delayed(Duration(seconds: _maxSecondValue)).whenComplete(() {
      if (mounted)
        setState(() {
          _isPaying = false;
          _hasPaymentDone = true;
          _cart.clearItems();
        });
    }).then((value) {
      if (mounted)
        setState(() {
          _hasPaymentDone = false;
          _isSuccess = true;
        });
    }).whenComplete(() {
      Future.delayed(Duration(seconds: _minSecondValue)).then((value) {
        Router.neglect(context, () => context.go('/whereismyorder/$id'));
        _cart.updatePayment(true);
      });
    });
  }

  startTime() async {
    var duration = new Duration(seconds: _count);
    return new Timer(duration, route);
  }

  route() {
    if (mounted) Router.neglect(context, () => context.go('/product'));
  }

  void checkEmptyPage(CartState cart) {
    if (cart.cartItems.isEmpty) {
      startTime();
    }
    return;
  }

  openEmptyPageDialog(CartState cart) {
    if (cart.cartItems.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => PaymentEmptyPageDialog(),
        );
      });
    }
    return;
  }

/*  void login() {
    showDialog(
      context: context,
      builder: (context) => AuthDialog(
        onTap: () {
          setState(() {
            _hasSignIn = true;
            Navigator.of(context).pop();
          });
        },
      ),
    );
  }*/

  @override
  void dispose() {
    _hasPaymentDone = false;
    super.dispose();
  }

  GlobalKey<FormState> get formKey => _formKey;

  bool get hasSignIn => _hasSignIn;

  bool get isPaying => _isPaying;

  bool get hasPaymentDone => _hasPaymentDone;

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  String get id => _id;

  double get responsiveSize => _responsiveSize;

  double get cardFieldSize => _cardFieldSize;

  String get waitTitle => _waitTitle;

  bool get isSuccess => _isSuccess;

  String get paymentSuccessTitle => _paymentSuccessTitle;

  String get paymentProcessingTitle => _paymentProcessingTitle;

  String get lottieAssetSuccess => _lottieAssetSuccess;

  String get lottieAssetProcessing => _lottieAssetProcessing;

  int get dotAnimationDuration => _dotAnimationDuration;

  double get lottieTextMargin => _lottieTextMargin;

  double get lottieAssetSuccessSize => _lottieAssetSuccessSize;

  double get lottieAssetProcessingSize => _lottieAssetProcessingSize;

  double get titleFontSize => _titleFontSize;
}

class PaymentEmptyPageDialog extends StatefulWidget {
  PaymentEmptyPageDialog({super.key});

  @override
  _PaymentEmptyPageDialogState createState() => _PaymentEmptyPageDialogState();
}

class _PaymentEmptyPageDialogState extends State<PaymentEmptyPageDialog> {
  int _count = 3;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          _count--;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(quarterDefaultSize)),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultSize),
        child: Container(
          width: 400,
          padding: EdgeInsets.all(defaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _emptyCartText(),
              SizedBox(height: doubleDefaultSize),
              _textButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _emptyCartText() => Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppViewWidgets.textMontserrat('Your cart is empty',
                fontSize: 18, fontWeight: FontWeight.w500, color: nero),
            SizedBox(height: defaultSize),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                AppViewWidgets.textMontserrat('Wait a $_count second',
                    fontSize: 18, fontWeight: FontWeight.w500, color: nero),
                SizedBox(width: quarterDefaultSize),
                AnimatedDotView(
                    animationDuration: Duration(milliseconds: 250), delay: 250)
              ],
            ),
          ],
        ),
      );

  Widget _textButton() => Column(
        children: [
          AppViewWidgets.textMontserrat('or',
              fontSize: 18, fontWeight: FontWeight.w500, color: nero),
          SizedBox(height: halfDefaultSize),
          CustomTextButton(
              buttonWidth: context.width,
              buttonTitle: 'Go to product page',
              overlayColor: WidgetStateProperty.all(appColor),
              hoveredColor: white,
              onTap: () =>
                  Router.neglect(context, () => context.go('/product'))),
        ],
      );

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }
}

/*
class AuthDialog extends StatefulWidget {
  final VoidCallback? onTap;

  AuthDialog({super.key, this.onTap});

  @override
  _AuthDialogState createState() => _AuthDialogState();
}

class _AuthDialogState extends State<AuthDialog> {
  late TextEditingController textControllerEmail;
  late FocusNode textFocusNodeEmail;
  late TextEditingController textControllerPassword;
  late FocusNode textFocusNodePassword;

  String? loginStatus;
  Color loginStringColor = Colors.green;

  @override
  void initState() {
    textControllerEmail = TextEditingController();
    textControllerPassword = TextEditingController();
    textControllerEmail.text = 'example@user.com';
    textControllerPassword.text = '123456';
    textFocusNodeEmail = FocusNode();
    textFocusNodePassword = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(quarterDefaultSize)),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultSize),
        child: Container(
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _appNameHeader(),
              SizedBox(height: defaultSize),
              _form(),
              AppViewWidgets.appDivider(),
              Padding(
                  padding: const EdgeInsets.all(halfDefaultSize),
                  child: AppViewWidgets.textMontserrat(
                      'By proceeding, you agree to our Terms of Use and confirm you have read our Privacy Policy.',
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.normal)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appNameHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.only(bottom: 6.0),
            child: Image.asset('assets/app/background-leaf2.png', height: 40)),
        SizedBox(width: halfDefaultSize),
        Text('weedus',
            style: TextStyle(
                fontFamily: 'Neuropolitical', fontSize: 40, color: nero)),
      ],
    );
  }

  Widget _form() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: doubleDefaultSize, vertical: defaultSize),
      child: Column(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            AppViewWidgets.textMontserrat('Email address',
                textAlign: TextAlign.left,
                fontSize: 20,
                color: nero,
                fontWeight: FontWeight.w600),
            SizedBox(height: halfDefaultSize),
            CustomFormField(
                labelText: 'Email',
                textEditingController: textControllerEmail,
                validator: validateEmail),
          ]),
          SizedBox(height: defaultSize),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppViewWidgets.textMontserrat('Password',
                  textAlign: TextAlign.left,
                  fontSize: 20,
                  color: nero,
                  fontWeight: FontWeight.w600),
              SizedBox(height: halfDefaultSize),
              CustomFormField(
                  labelText: 'Password',
                  textEditingController: textControllerPassword,
                  validator: validatePass),
              SizedBox(height: doubleDefaultSize),
              _signInButton()
            ],
          ),
        ],
      ),
    );
  }

  Widget _signInButton() {
    return AppViewWidgets.customInkWell(
      onTap: widget.onTap,
      child: Container(
          height: 48,
          decoration: BoxDecoration(
              color: appColor,
              borderRadius: BorderRadius.circular(quarterDefaultSize),
              boxShadow: [
                BoxShadow(
                    color: effectsBoxColor.darken(25),
                    spreadRadius: 0.0,
                    blurRadius: 8,
                    offset: Offset(0.5, 3))
              ]),
          child: Center(
            child: AppViewWidgets.textMontserrat('Sign In',
                fontSize: 16, fontWeight: FontWeight.w600, color: nero),
          )),
    );
  }
}*/
