import 'package:new_weedus/export.dart';


class ResetPasswordView extends StatefulWidget {
  final VoidCallback? loginCallback;

  const ResetPasswordView({Key? key, this.loginCallback}) : super(key: key);

  @override
  _ResetPasswordViewState createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView>
    with ResetPassMixin {
  @override
  Widget build(BuildContext context) {
    final ResetPasswordViewModel _viewModel =
        Provider.of<ResetPasswordViewModel>(context);
    return AuthViewWidgets.landingBackgroundWidget(
        child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.transparent,
            body: SafeArea(
                child: SingleChildScrollView(
                    child: Center(
                        child: ResetPassBuildWidgets.buildColumn(
                            context, _viewModel, scaffoldKey,
                            emailController: emailController))))));
  }
}
