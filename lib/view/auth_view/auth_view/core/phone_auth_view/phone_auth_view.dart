import 'package:new_weedus/export.dart';

class PhoneAuthView extends StatefulWidget {
  PhoneAuthView(
      {super.key, required this.loginCallBack, required this.scaffoldKey});

  final VoidCallback loginCallBack;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<PhoneAuthView> createState() => _PhoneAuthViewState();
}

class _PhoneAuthViewState extends State<PhoneAuthView> {
  @override
  Widget build(BuildContext context) {
    PhoneAuthViewModel phoneAuthViewModel =
        Provider.of<PhoneAuthViewModel>(context);
    AuthState authState = Provider.of<AuthState>(context, listen: false);
    return Form(
        key: phoneAuthViewModel.formKey,
        child: _phoneAuth(context, authState, phoneAuthViewModel));
  }

  Widget _phoneAuth(BuildContext context, AuthState authState,
          PhoneAuthViewModel phoneAuthViewModel) =>
      PhoneAuthWidgets.build(context,
          mobileVerificationState: phoneAuthViewModel.mobileVerificationState,
          optController: phoneAuthViewModel.otpController,
          optSending: phoneAuthViewModel.showLoading,
          signButtonOnTap:(){} /*() => phoneAuthViewModel.phoneSignInOnTap(
              context, authState, widget.scaffoldKey)*/,
          onChanged: (number) => phoneAuthViewModel..onChanged(number),
          onCountryChanged: (country) =>
              phoneAuthViewModel.onCountryChanged(country),
          onCompleted: (v){} /*=> phoneAuthViewModel.verifyOpt(
              context, widget.scaffoldKey,
              loginCallBack: widget.loginCallBack)*/,
          resendCodeButtonOnTap: () {});
}
