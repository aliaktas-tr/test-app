import 'package:new_weedus/export.dart';


class ConfirmEmailView extends StatefulWidget {
  const ConfirmEmailView({super.key});

  @override
  State<ConfirmEmailView> createState() => _ConfirmEmailViewState();
}

class _ConfirmEmailViewState extends State<ConfirmEmailView>
    with ConfirmEmailMixin {
  @override
  Widget build(BuildContext context) {
    return AuthViewWidgets.landingBackgroundWidget(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            key: scaffoldKey,
            body: ConfirmEmailBuildWidgets.buildUI(context,
                enableResend: enableResend,
                secondsRemaining: secondsRemaining,
                onTap: () => resendConfirmEmail())));
  }
}
