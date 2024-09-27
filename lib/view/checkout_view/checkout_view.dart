import 'package:lottie/lottie.dart';
import 'package:new_weedus/export.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> with CheckoutViewMixin {
  String _productRoute = '/product';

  @override
  Widget build(BuildContext context) {
    final _cart = context.watch<CartState>();
    final authState = context.watch<AuthState>();
    final userViewModel = context.watch<UserViewModel>();
    return WillPopScope(
      onWillPop: () async => isPaying ? false : true,
      child: Scaffold(
          key: scaffoldKey,
          backgroundColor: scaffoldBackgroundColor,
          appBar: CustomAppBar(
              cartState: _cart,
              scaffoldKey: scaffoldKey,
              isCartIconWidgetsAvailable: false,
              onAppNameRouteTap: () => context.go(_productRoute)),
          body: CheckoutBuildWidgets.buildWidget(context, _cart, isSuccess,
              isPaying, formKey, authState.user == null ? false : true,
              loginOnTap: () => AuthDialog.showDialog(
                  authState: authState, scaffoldKey: scaffoldKey),
              makePaymentOnTap: authState.user == null
                  ? () => _loginDialog(authState)
                  : authState.userModel!.address == null &&
                          authState.userModel!.phoneNumber == null
                      ? () {
                          _dialog(authState);
                          userViewModel.setProfileEdit = true;
                        }
                      : () => makePayment(_cart, authState))),
    );
  }

  void _dialog(AuthState authState) {
    return BuildDialog.showDialog(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      Row(mainAxisSize: MainAxisSize.min, children: [
        Container(
            padding: EdgeInsets.all(doubleDefaultSize),
            child: Column(children: [
              AppViewWidgets.textMontserrat(
                  'Please set your address and phone number first.',
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              SizedBox(height: defaultSize),
              CustomTextButton(
                  overlayColor: WidgetStateProperty.all(appColor),
                  padding: WidgetStateProperty.all(
                      EdgeInsets.symmetric(horizontal: defaultSize)),
                  hoveredColor: white,
                  buttonTitle: 'Login',
                  onTap: () {
                    SmartDialog.dismiss(force: true);
                    UserSettingsRouteDialog.showDialog(context,
                        /*authState: authState*/);
                  })
            ]))
      ])
    ]));
  }

  void _loginDialog(AuthState authState) {
    return BuildDialog.showDialog(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      Row(mainAxisSize: MainAxisSize.min, children: [
        Container(
            padding: EdgeInsets.all(doubleDefaultSize),
            child: Column(children: [
              AppViewWidgets.textMontserrat(
                  'Please log in or register to complete your purchase.',
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              SizedBox(height: defaultSize),
              CustomTextButton(
                  overlayColor: WidgetStateProperty.all(appColor),
                  padding: WidgetStateProperty.all(
                      EdgeInsets.symmetric(horizontal: defaultSize)),
                  hoveredColor: white,
                  buttonTitle: 'Login',
                  onTap: () {
                    SmartDialog.dismiss(force: true);
                    AuthDialog.showDialog(
                        authState: authState, scaffoldKey: scaffoldKey);
                  })
            ]))
      ])
    ]));
  }
}
