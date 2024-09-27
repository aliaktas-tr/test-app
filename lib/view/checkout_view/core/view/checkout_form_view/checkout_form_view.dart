import 'package:new_weedus/export.dart';

class CheckoutFormView extends StatelessWidget {
  CheckoutFormView({
    super.key,
    this.loginOnTap,
    this.hasSignIn,
    this.formKey,
  });

  final VoidCallback? loginOnTap;
  final bool? hasSignIn;
  final GlobalKey<FormState>? formKey;

  @override
  Widget build(BuildContext context) {
    return CheckoutFormBuildWidgets.buildWidget(
        hasSignIn: hasSignIn, loginOnTap: loginOnTap, formKey: formKey);
  }
}
