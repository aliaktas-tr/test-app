
import 'package:new_weedus/export.dart';


class _ImageConstants {
  static final double imageButtonColorOpacity = 0.6;
  static final double imageButtonBorderWidth = 2.0;
  static final double avatarBackgroundColorOpacity = 0.3;
  static final double iconColorOpacity = 0.5;
  static final Color avatarBackgroundColor =
      effectsBoxColor.withOpacity(avatarBackgroundColorOpacity);
  static final Color iconColor =
      effectsBoxColor.withOpacity(iconColorOpacity);
  static final double iconSize = 75.0;
  static final BoxDecoration imageButtonDecoration = BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
          color: effectsBoxColor
              .withOpacity(imageButtonColorOpacity),
          width: imageButtonBorderWidth));
  static final String bottomSheetTitle = 'Select From';
  static final double bottomSheetTitleFontSize = 18;
  static final double zeroValue = 0.0;
  static final double thicknessValue = 1.0;
  static final EdgeInsetsGeometry verticalDividerPadding =
      EdgeInsets.only(top: halfDefaultSize);
  static final EdgeInsetsGeometry bottomSheetPadding =
      EdgeInsets.all(halfDefaultSize);
  static final double _opacityValue = 0.5;
  static final BoxDecoration bottomSheetDecoration = BoxDecoration(
      color: effectsBoxColor.withOpacity(_opacityValue),
      borderRadius: BorderRadius.circular(halfDefaultSize));
  static final double buttonHeight = 40.0;
  static final double densityValue = -3.0;
  static final VisualDensity listTileDensity =
      VisualDensity(vertical: densityValue);

  static WidgetStateProperty<Color> get _elevatedButtonBackgroundColor =>
      WidgetStateProperty.all<Color>(avatarBackgroundColor);

  static WidgetStateProperty<RoundedRectangleBorder>
      get _elevatedButtonShape => WidgetStateProperty
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

  static List<PlatformUiSettings> buildUiSettings() {
    return [
      AndroidUiSettings(
          statusBarColor: Colors.black,
          toolbarTitle: '',
          toolbarColor: Colors.black,
          toolbarWidgetColor: Colors.white,
          activeControlsWidgetColor: appColor,
          dimmedLayerColor: Colors.black54,
          initAspectRatio: CropAspectRatioPreset.square,
          hideBottomControls: false,
          lockAspectRatio: true),
      IOSUiSettings(title: '')
    ];
  }
}

class UploadProfileImageWidgets {
  /// Build UI Widgets
  static Widget buildUI(
          BuildContext context,
          UploadProfileImageViewModel viewModel,
          SignUpViewModel signUpViewModel,
          {VoidCallback? imageButtonOnTap,
          VoidCallback? setAsProfileImageOnTap}) =>
      ListView(
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
               SizedBox(height: halfDefaultSize),
                _elevatedButton(context, setAsProfileImageOnTap, viewModel),
                _emptySpace(context)
              ])),
        ],
      );

  static Widget _uiTitleWidget(BuildContext context) => Padding(
      padding: _ImageConstants.uiTitlePaddingFromTop(context),
      child: Column(
        children: [
          Container(
              alignment: Alignment.center,
              padding: _ImageConstants.uiTitlePadding,
              width: context.width,
              child: AppViewWidgets.textMontserrat('addYourImage'.tr(),
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
          width: context.width * .75,
          height: _ImageConstants.buttonHeight,
          margin: EdgeInsets.only(top: defaultSize),
          child: ElevatedButton(
              style: _ImageConstants.elevatedButtonStyle,
              onPressed: setAsProfileImageOnTap,
              child: AppViewWidgets.textMontserrat(
                  'setAsProfileImage'.tr(),
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

  static Widget buildBottomSheet(BuildContext context,
          {Function? cameraTap, Function? galleryTap, bool? expand}) =>
      SizedBox(
          height: context.height,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
            /*    Align(
                    alignment: Alignment.bottomCenter,
                    child: _bottomSheetWidgetExpandedSection(
                        expand, context, galleryTap, cameraTap))*/
              ]));

/*  static ExpandedSection2 _bottomSheetWidgetExpandedSection(bool? expand,
          BuildContext context, Function? galleryTap, Function? cameraTap) =>
      ExpandedSection2(
          expand: expand,
          axis: Axis.horizontal,
          child: Container(
              width: context.width,
              decoration: _ImageConstants.bottomSheetDecoration,
              margin: _ImageConstants.bottomSheetPadding,
              padding: _ImageConstants.bottomSheetPadding,
              child: Column(children: [
                _bottomSheetTitleWidget,
                _divider,
                _bottomSheetButtons(galleryTap, cameraTap)
              ])));*/

  static Row _bottomSheetButtons(Function? galleryTap, Function? cameraTap) =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        _listTile(
            icon: Ionicons.image_outline,
            title: 'gallery'.tr(),
            onTap: galleryTap),
        _verticalDivider,
        _listTile(
            icon: Ionicons.camera_outline,
            title: 'camera'.tr(),
            onTap: cameraTap)
      ]);

  static Widget get _bottomSheetTitleWidget => SizedBox(
      height: _ImageConstants.buttonHeight,
      child: Center(
          child: _text(_ImageConstants.bottomSheetTitle,
              fontSize: _ImageConstants.bottomSheetTitleFontSize,
              fontWeight: FontWeight.w500,
              color: effectsBoxColor)));

  static Widget get _divider =>
      AppViewWidgets.appDivider(height: _ImageConstants.zeroValue);

  static Widget _listTile({IconData? icon, String? title, Function? onTap}) =>
      Expanded(
          child: SizedBox(
              height: _ImageConstants.buttonHeight,
              child: ListTile(
                  visualDensity: _ImageConstants.listTileDensity,
                  leading: Icon(icon, color: nero),
                  title: _text(title),
                  onTap: onTap as void Function()?)));

  static Widget get _verticalDivider => Padding(
      padding: _ImageConstants.verticalDividerPadding,
      child: SizedBox(
          height: _ImageConstants.buttonHeight,
          child: VerticalDivider(
              width: _ImageConstants.zeroValue,
              thickness: _ImageConstants.thicknessValue)));

  static Widget _text(String? title,
          {Color? color, double? fontSize, FontWeight? fontWeight}) =>
      AppViewWidgets.textMontserrat(title,
          color: color ?? nero,
          fontSize: fontSize,
          fontWeight: fontWeight);
}
