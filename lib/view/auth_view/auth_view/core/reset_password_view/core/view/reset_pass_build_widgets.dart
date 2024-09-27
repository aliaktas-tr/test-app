import 'package:new_weedus/export.dart';

class _ResetButtonConstants {
  _ResetButtonConstants._();

  static String _atSign = '@';
  static final double _buttonHeight = 36;

  static double _uiWidth(BuildContext context) => context.width * 0.8;
  static final EdgeInsetsGeometry _buttonPadding =
      EdgeInsets.symmetric(horizontal: defaultSize, vertical: halfDefaultSize);
  static final Duration _duration = Duration(milliseconds: 400);

  static BoxDecoration _buttonDecoration(
          TextEditingController emailController) =>
      BoxDecoration(
          borderRadius: BorderRadius.circular(defaultSize / 4),
          border: Border.all(
              color: emailController.text.contains(_atSign)
                  ? effectsBoxColor
                  : Colors.grey.withOpacity(0.5)));

  static double _logoSize(BuildContext context) =>
      context.height * _logoSizeValue;
  static final double _logoSizeValue = 0.25;

  static SizedBox _emptySpace(BuildContext context) =>
      SizedBox(height: context.height * .08);

  static SizedBox get _heightSizedBox => SizedBox(height: defaultSize);

  static EdgeInsetsGeometry _logoPadding(BuildContext context) =>
      EdgeInsets.only(top: context.height * 0.0, left: defaultSize / 1.0);
}

class ResetPassBuildWidgets {
  static Widget buildColumn(BuildContext context,
      ResetPasswordViewModel viewModel, GlobalKey<ScaffoldState> scaffoldKey,
      {TextEditingController? emailController}) {
    return Column(children: [
      _appLogoWidget(context),
      SizedBox(
          width: _ResetButtonConstants._uiWidth(context),
          child: Column(children: [
            _infoTextColumn(context),
            _emailForm(viewModel, emailController!),
            SizedBox(height: defaultSize),
            _submitButton(context, emailController, viewModel, scaffoldKey),
            SizedBox(height: defaultSize),
          ]))
    ]);
  }

  static Widget _appLogoWidget(BuildContext context) => Column(children: [
        _closeButton(context),
        _ResetButtonConstants._heightSizedBox,
        _ResetButtonConstants._emptySpace(context)
      ]);

  static Widget _closeButton(BuildContext context) => Align(
      alignment: Alignment.topRight,
      child: Padding(
          padding: EdgeInsets.only(top: defaultSize, right: defaultSize),
          child: AppViewWidgets.customInkWell(
              child: Icon(Icons.close, color: effectsBoxColor),
              onTap: () => context.pop(context))));

  static Column _infoTextColumn(BuildContext context) => Column(children: [
        AppViewWidgets.textMontserrat('havingTrouble'.tr(),
            color: effectsBoxColor, textAlign: TextAlign.center),
        SizedBox(height: halfDefaultSize),
        AppViewWidgets.textMontserrat('havingTroubleInfo'.tr(),
            color: effectsBoxColor, textAlign: TextAlign.center),
        _ResetButtonConstants._emptySpace(context)
      ]);

  static Form _emailForm(ResetPasswordViewModel viewModel,
          TextEditingController _emailController) =>
      Form(
          key: viewModel.formKey,
          child: ResetPassTextFormBuilder(
              enabled: !viewModel.loading,
              prefix: Icons.mail_outline_outlined,
              controller: _emailController,
              hintText: 'helperEmail'.tr(),
              textInputAction: TextInputAction.done,
              validateFunction: Validations.validateEmail,
              onSaved: (String val) => viewModel.setEmail(val)));

  static Widget _submitButton(
      BuildContext context,
      TextEditingController emailController,
      ResetPasswordViewModel viewModel,
      GlobalKey<ScaffoldState> scaffoldKey) {
    return AnimatedSwitcher(
        duration: _ResetButtonConstants._duration,
        child: viewModel.loading
            ? AppViewWidgets.spinKitFadingCircle(context)
            : _button(context, emailController, viewModel, scaffoldKey));
  }

  static Widget _button(
          BuildContext context,
          TextEditingController emailController,
          ResetPasswordViewModel viewModel,
          GlobalKey<ScaffoldState> scaffoldKey) =>
      AppViewWidgets.customInkWell(
          child: Container(
              height: _ResetButtonConstants._buttonHeight,
              alignment: Alignment.center,
              padding: _ResetButtonConstants._buttonPadding,
              decoration:
                  _ResetButtonConstants._buttonDecoration(emailController),
              child: AppViewWidgets.textMontserrat('reset'.tr(),
                  color: emailController.text
                          .contains(_ResetButtonConstants._atSign)
                      ? effectsBoxColor
                      : Colors.grey.withOpacity(0.5))),
          onTap: () => viewModel.submit(context, scaffoldKey, emailController));
}
