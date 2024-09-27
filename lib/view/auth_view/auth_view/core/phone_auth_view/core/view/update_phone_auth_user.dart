import 'package:new_weedus/export.dart';

class UpdatePhoneUser extends StatefulWidget {
  const UpdatePhoneUser({super.key});

  @override
  State<UpdatePhoneUser> createState() => _UpdatePhoneUserState();
}

class _UpdatePhoneUserState extends State<UpdatePhoneUser> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    UploadProfileImageViewModel viewModel =
        Provider.of<UploadProfileImageViewModel>(context);
    SignUpViewModel signUpViewModel = Provider.of<SignUpViewModel>(context);
    PhoneAuthViewModel phoneAuthViewModel =
        Provider.of<PhoneAuthViewModel>(context);
    AuthState authState = Provider.of<AuthState>(context, listen: false);
    return WillPopScope(
        onWillPop: () async => false,
        child: AuthViewWidgets.landingBackgroundWidget(
            child: _buildUi(
                viewModel, authState, phoneAuthViewModel, signUpViewModel)));
  }

  Widget _buildUi(
          UploadProfileImageViewModel viewModel,
          AuthState authState,
          PhoneAuthViewModel phoneAuthViewModel,
          SignUpViewModel signUpViewModel) =>
      GestureDetector(
          onTap: () => pageOnTapIfBottomSheetTrue(viewModel),
          child: Scaffold(
              key: _scaffoldKey,
              backgroundColor: Colors.transparent,

              /// stack for bottom sheet
              body: Stack(alignment: Alignment.center, children: [
                _buildUiWidgets(viewModel, phoneAuthViewModel, signUpViewModel),
               // CustomBottomImagePickerSheet()
              ])));

  Widget _buildUiWidgets(
          UploadProfileImageViewModel viewModel,
          PhoneAuthViewModel phoneAuthViewModel,
          SignUpViewModel signUpViewModel) =>
      _UploadProfileImageWidgets.buildUI(
          context, viewModel, signUpViewModel, phoneAuthViewModel,
          formKey: formKey,
          imageButtonOnTap: () => viewModel.setBottomSheet(true),
          setAsProfileImageOnTap: () => phoneAuthViewModel.uploadProfileImage(
              context, viewModel, _scaffoldKey));

  void pageOnTapIfBottomSheetTrue(UploadProfileImageViewModel viewModel) {
    if (viewModel.openBottomSheet == true) {
      viewModel.setBottomSheet(false);
    } else {
      return;
    }
  }
}

class _ImageConstants {
  _ImageConstants._();

  static final double imageButtonColorOpacity = 0.6;
  static final double imageButtonBorderWidth = 2.0;
  static final double avatarBackgroundColorOpacity = 0.3;
  static final double iconColorOpacity = 0.5;
  static final Color avatarBackgroundColor =
      effectsBoxColor.withOpacity(avatarBackgroundColorOpacity);
  static final Color iconColor = effectsBoxColor.withOpacity(iconColorOpacity);
  static final double iconSize = 75.0;
  static final BoxDecoration imageButtonDecoration = BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
          color: effectsBoxColor.withOpacity(imageButtonColorOpacity),
          width: imageButtonBorderWidth));

  static final double buttonHeight = 40.0;

  static MaterialStateProperty<Color> get _elevatedButtonBackgroundColor =>
      MaterialStateProperty.all<Color>(avatarBackgroundColor);

  static MaterialStateProperty<RoundedRectangleBorder>
      get _elevatedButtonShape => MaterialStateProperty
          .all<RoundedRectangleBorder>(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(halfDefaultSize)));

  static ButtonStyle get elevatedButtonStyle => ButtonStyle(
      backgroundColor: _elevatedButtonBackgroundColor,
      shape: _elevatedButtonShape);

  static EdgeInsetsGeometry uiTitlePaddingFromTop(BuildContext context) =>
      EdgeInsets.only(top: context.height * 0.15);
  static final EdgeInsetsGeometry uiTitlePadding =
      EdgeInsets.symmetric(horizontal: halfDefaultSize);
  static final double uiTitleFontSize = 16;

  static double maxRadius(BuildContext context) => context.height * .28 / 2;
}

class _UploadProfileImageWidgets {
  /// Build UI Widgets
  static Widget buildUI(
          BuildContext context,
          UploadProfileImageViewModel viewModel,
          SignUpViewModel signUpViewModel,
          PhoneAuthViewModel phoneAuthViewModel,
          {GlobalKey<FormState>? formKey,
          VoidCallback? imageButtonOnTap,
          VoidCallback? setAsProfileImageOnTap}) =>
      Form(
        key: formKey,
        child: ListView(
          children: [
            Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                  _uiTitleWidget(context),
                  _buildSizedBox(context),
                  _imageButton(context, viewModel, signUpViewModel,
                      imageButtonOnTap: imageButtonOnTap),
                  _buildSizedBox(context),
                  _nameFormBuilder(context, phoneAuthViewModel),
                  SizedBox(height: quarterDefaultSize),
                  _buildSizedBox(context),
                  _elevatedButton(context, setAsProfileImageOnTap, viewModel),
                  _emptySpace(context)
                ])),
          ],
        ),
      );

  static Widget _nameFormBuilder(
          BuildContext context, PhoneAuthViewModel phoneAuthViewModel) =>
      SizedBox(
        width: context.width * 0.8,
        child: TextFormBuilder(
            enabled: !phoneAuthViewModel.loading,
            prefix: Icons.person,
            hintText: 'helperName',
            controller: phoneAuthViewModel.nameController,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.words,
            validateFunction: Validations.validateName),
      );

  static Widget _uiTitleWidget(BuildContext context) => Padding(
      padding: _ImageConstants.uiTitlePaddingFromTop(context),
      child: Column(
        children: [
          Container(
              alignment: Alignment.center,
              padding: _ImageConstants.uiTitlePadding,
              width: context.width,
              child: AppViewWidgets.textMontserrat('addYourImage',
                  fontSize: _ImageConstants.uiTitleFontSize,
                  color: effectsBoxColor)),
          SizedBox(height: defaultSize)
        ],
      ));

  static SizedBox _buildSizedBox(BuildContext context) =>
      SizedBox(height: context.height * 0.05);

  static Container _elevatedButton(
          BuildContext context,
          VoidCallback? setAsProfileImageOnTap,
          UploadProfileImageViewModel uploadProfileImageViewModel) =>
      Container(
          width: context.width * .8,
          height: _ImageConstants.buttonHeight,
          margin: EdgeInsets.only(top: defaultSize),
          child: ElevatedButton(
              style: _ImageConstants.elevatedButtonStyle,
              onPressed: setAsProfileImageOnTap,
              child: AppViewWidgets.textMontserrat('Update profile',
                  // setAsProfileImage.tr(),
                  color: uploadProfileImageViewModel.mediaUrl != null
                      ? effectsBoxColor
                      : null)));

  static SizedBox _emptySpace(BuildContext context) =>
      SizedBox(height: context.height * 0.1);

  ///    ///     ///      ///      /// Widgets
  static Widget _imageButton(
          BuildContext context,
          UploadProfileImageViewModel viewModel,
          SignUpViewModel signUpViewModel,
          {VoidCallback? imageButtonOnTap}) =>
      AppViewWidgets.customInkWell(
          onTap: imageButtonOnTap,
          child: Container(
              height: 200,
              decoration: _ImageConstants.imageButtonDecoration,
              child: _circleAvatar(context, viewModel, signUpViewModel)));

  static Widget _circleAvatar(
          BuildContext context,
          UploadProfileImageViewModel viewModel,
          SignUpViewModel signUpViewModel) =>
      Opacity(
          opacity: viewModel.mediaUrl != null ? 1.0 : 0.3,
          child: Stack(alignment: Alignment.center, children: [
            CircleAvatar(
                backgroundColor: _ImageConstants.avatarBackgroundColor,
                maxRadius: _ImageConstants.maxRadius(context),
                backgroundImage: viewModel.mediaUrl != null
                    ? FileImage(viewModel.mediaUrl!)
                    : AppViewWidgets.customAdvanceNetworkImage(profileAvatar),
                child: Container(
                    child: viewModel.mediaUrl != null
                        ? _shrink
                        : Icon(Icons.camera_alt,
                            color: _ImageConstants.iconColor,
                            size: _ImageConstants.iconSize))),
            signUpViewModel.loading
                ? AppViewWidgets.spinKitFadingCircle(context)
                : _shrink
          ]));

  static SizedBox get _shrink => SizedBox.shrink();
}
