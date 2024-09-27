import 'package:new_weedus/export.dart';

class _ConfirmConstants {
  _ConfirmConstants._();

  static double buttonHeight = 40.0;
  static double titleFontSize = 16;
  static double descriptionFontSize = 14;
  static double countdownBoxSize = 60.0;
  static final Duration animationDuration = Duration(milliseconds: 350);

  static EdgeInsetsGeometry padding(BuildContext context) =>
      EdgeInsets.only(top: context.height * 0.095);

  static double imageHeight(BuildContext context) => context.height * 0.28;

  static double descriptionWidth(BuildContext context) => context.width * 0.8;

  static double buttonWidth(BuildContext context) => context.width * 0.75;
  static final BoxDecoration countdownBoxDecoration =
      BoxDecoration(shape: BoxShape.circle, color: nero.withOpacity(0.3));
  static final String buttonTitle = 'Resend verification Email';

  static EdgeInsetsGeometry uiTitlePaddingFromTop(BuildContext context) =>
      EdgeInsets.only(top: defaultSize);
  static double uiTitleFontSize = 16;

  static MaterialStateProperty<Color> get _elevatedButtonBackgroundColor =>
      MaterialStateProperty.all<Color>(effectsBoxColor.withOpacity(0.3));

  static MaterialStateProperty<RoundedRectangleBorder>
      get _elevatedButtonShape => MaterialStateProperty
          .all<RoundedRectangleBorder>(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(halfDefaultSize)));

  static ButtonStyle get elevatedButtonStyle => ButtonStyle(
      backgroundColor: _elevatedButtonBackgroundColor,
      shape: _elevatedButtonShape);
}

class ConfirmEmailBuildWidgets {
  static Widget buildUI(BuildContext context,
          {bool? enableResend, int? secondsRemaining, onTap}) =>
      SingleChildScrollView(
          child: SizedBox(
              height: context.height,
              width: context.width,
              child: _pageColumn(context,
                  enableResend: enableResend,
                  secondsRemaining: secondsRemaining,
                  onTap: onTap)));

  static Widget _pageColumn(BuildContext context,
          {bool? enableResend, int? secondsRemaining, onTap}) =>
      Column(children: [
        Padding(
            padding: _ConfirmConstants.padding(context),
            child: _buildBody(context,
                enableResend: enableResend,
                secondsRemaining: secondsRemaining,
                onTap: onTap))
      ]);

  static Widget _buildBody(BuildContext context,
      {bool? enableResend, int? secondsRemaining, onTap}) {
    return Consumer<AuthState>(builder: (context, state, child) {
      if (state.userModel == null) {
        return Center(child: CircularProgressIndicator(color: appColor));
      }
      return Padding(
          padding: _ConfirmConstants.uiTitlePaddingFromTop(context),
          child: _uiColumn(context, state,
              enableResend: enableResend,
              secondsRemaining: secondsRemaining,
              onTap: onTap));
    });
  }

  static Column _uiColumn(BuildContext context, AuthState state,
          {bool? enableResend, int? secondsRemaining, onTap}) =>
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: state.userModel!.profileImage == ''
              ? <Widget>[UploadProfileImageView()]
              : state.userModel!.isVerified!
                  ? <Widget>[SizedBox.shrink()]
                  : <Widget>[
                      AppViewWidgets.customImage(state.userModel!.profileImage,
                          height: _ConfirmConstants.imageHeight(context)),
                      SizedBox(height: halfDefaultSize),
                      _widgetColumn(context, state,
                          enableResend: enableResend,
                          secondsRemaining: secondsRemaining,
                          onTap: onTap)
                    ]);

  static Column _widgetColumn(BuildContext context, AuthState state,
          {bool? enableResend, int? secondsRemaining, onTap}) =>
      Column(children: [
        _title(state),
        SizedBox(height: defaultSize),
        _description(context),
        SizedBox(height: defaultSize),
        _animatedSwitcher(context,
            enableResend: enableResend,
            secondsRemaining: secondsRemaining,
            onTap: onTap)
      ]);

  static Widget _title(AuthState state) => AppViewWidgets.textMontserrat(
      '${'emailVerificationHi'} \n${state.userModel!.displayName}',
      color: effectsBoxColor,
      fontSize: _ConfirmConstants.titleFontSize,
      textAlign: TextAlign.center);

  static SizedBox _description(BuildContext context) => SizedBox(
      width: _ConfirmConstants.descriptionWidth(context),
      child: AppViewWidgets.textMontserrat('emailVerificationTitle',
          color: effectsBoxColor,
          fontSize: _ConfirmConstants.descriptionFontSize,
          fontWeight: FontWeight.normal,
          textAlign: TextAlign.center));

  static AnimatedSwitcher _animatedSwitcher(BuildContext context,
          {bool? enableResend, int? secondsRemaining, onTap}) =>
      AnimatedSwitcher(
          duration: _ConfirmConstants.animationDuration,
          reverseDuration: _ConfirmConstants.animationDuration,
          child: enableResend!
              ? _elevatedButton(context, onTap)
              : _countDown(secondsRemaining));

  static Container _elevatedButton(
          BuildContext context, VoidCallback? onPressed) =>
      Container(
          width: _ConfirmConstants.buttonWidth(context),
          height: _ConfirmConstants.buttonHeight,
          margin: EdgeInsets.only(top: defaultSize),
          child: ElevatedButton(
              style: _ConfirmConstants.elevatedButtonStyle,
              onPressed: onPressed,
              child: AppViewWidgets.textMontserrat(
                  _ConfirmConstants.buttonTitle,
                  color: effectsBoxColor)));

  static Container _countDown(int? secondsRemaining) => Container(
      width: _ConfirmConstants.countdownBoxSize,
      height: _ConfirmConstants.countdownBoxSize,
      decoration: _ConfirmConstants.countdownBoxDecoration,
      child: Center(
          child: Text(secondsRemaining.toString(),
              style: GoogleFonts.montserrat(
                  fontSize: _ConfirmConstants.uiTitleFontSize,
                  color: effectsBoxColor,
                  fontFeatures: [FontFeature.tabularFigures()]))));
}
