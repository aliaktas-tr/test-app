import 'package:new_weedus/export.dart';

class AppViewWidgets {
  static const double _fontSize = 14;
  static const double _itemSize = 20.0;
  static const double _thickness = 0.7;
  static final int _itemCount = 5;
  static final int _alphaValue = 50;
  static final String _noDataTitle = 'No Available Data';
  static final double _noDataIconSize = 30;
  static final double _noDataFontSize = 24;
  static final Color _unratedColor = Colors.amber.withAlpha(_alphaValue);
  static final EdgeInsetsGeometry _itemPadding = EdgeInsets.only(right: 1);
  static final Color _color = Colors.grey.withOpacity(0.5);

  static Widget textMontserrat(String? title,
          {double? fontSize,
          FontWeight? fontWeight,
          Color? color,
          double? height,
          double? letterSpacing,
          bool? isSalePrice = false,
          int? maxLines,
          TextAlign? textAlign,
          TextOverflow? overflow,
          TextDecoration? decoration,
          double? decorationThickness,
          double? wordSpacing,
          FontStyle? fontStyle,
          List<Shadow>? shadows,
          Color? decorationColor}) =>
      Text(title!,
          style: GoogleFonts.montserrat(
              fontSize: fontSize ?? _fontSize,
              fontWeight: fontWeight?? FontWeight.w500,
              color: color,
              height: height,
              shadows: shadows,
              decoration: decoration != null
                  ? decoration
                  : isSalePrice!
                      ? TextDecoration.lineThrough
                      : null,
              decorationThickness: decorationThickness,
              decorationColor: decorationColor,
              letterSpacing: letterSpacing,
              wordSpacing: wordSpacing,
              fontStyle: fontStyle),
          maxLines: maxLines,
          textAlign: textAlign,
          overflow: overflow);

  static Widget ratingBuilder(
          {required double initialRating,
          double? itemSize,
          EdgeInsetsGeometry? itemPadding}) =>
      RatingBar.builder(
          initialRating: initialRating,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          unratedColor: _unratedColor,
          itemCount: _itemCount,
          itemSize: itemSize ?? _itemSize,
          ignoreGestures: true,
          itemPadding: itemPadding ?? _itemPadding,
          itemBuilder: (context, _) => Icon(Icons.star, color: appColor),
          onRatingUpdate: (rating) {});

  static Widget appDivider(
          {double? indent,
          double? endIndent,
          double? thickness,
          double? height,
          Color? color}) =>
      Divider(
          thickness: thickness ?? _thickness,
          height: height ?? doubleDefaultSize,
          indent: indent ?? null,
          endIndent: endIndent ?? null,
          color: color ?? null);

  static Widget noDataWidget() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Iconsax.warning_2, color: _color, size: _noDataIconSize),
            _halfHeightSizedBox,
            AppViewWidgets.textMontserrat(_noDataTitle,
                color: _color, fontSize: _noDataFontSize)
          ]);

  static Widget customInkWell(
          {VoidCallback? onTap, Widget? child, Function(bool)? onHover}) =>
      InkWell(
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: onTap,
          onHover: onHover ?? null,
          child: child);

  static Widget windowsStyleCustomTabWidget(
          {String? buttonTitle,
          double? dropdownWidth,
          List<ListTile>? dropdownItems,
          List<Widget>? children,
          Color? dropdownBackgroundColor,
          bool? isLeftOffSet = true,
          Color? titleColor}) =>
      WindowStyleDropdownMenu(
          dropdownWidth: dropdownWidth ?? 300,
          titleColor: titleColor,
          buttonTitle: buttonTitle!,
          dropdownItems: dropdownItems,
          dropdownBackgroundColor: dropdownBackgroundColor,
          isLeftOffSet: isLeftOffSet,
          children: children);

  static void customSnackBar(BuildContext context, String? msg,
      {Color? backgroundColor,
      Color? textColor = scaffoldBackgroundColor,
      FontWeight? fontWeight,
      double? fontSize,
      bool? hasIcon = true,
      IconData? icon,
      int duration = 4,
      bool isGradientIcon = false,
      Color iconColor = Colors.red,
      DismissDirection? dismissDirection,
      SnackBarBehavior? behavior,
      EdgeInsetsGeometry? margin}) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        dismissDirection: dismissDirection,
        behavior: behavior ?? SnackBarBehavior.floating,
        margin: margin ?? EdgeInsets.all(halfDefaultSize),
        backgroundColor: backgroundColor ?? nero,
        content: Row(children: [
          hasIcon!
              ? Row(children: [
                  Icon(icon ?? Icons.error_outline_rounded,
                      color: iconColor, size: 20),
                  SizedBox(width: halfDefaultSize)
                ])
              : SizedBox.shrink(),
          Expanded(
              child: Container(
                  child: AppViewWidgets.textMontserrat(msg!,
                      fontSize: fontSize,
                      color: textColor,
                      fontWeight: fontWeight)))
        ])));
  }

  static Widget loadingSpinKit({double? size}) => Center(
      child: SpinKitCircle(
          size: size ?? 60,
          itemBuilder: (context, index) {
            final colors = [effectsBoxColor, appColor];
            final color = colors[index % colors.length];
            return DecoratedBox(
                decoration:
                    BoxDecoration(color: color, shape: BoxShape.circle));
          }));

  static SizedBox get _halfHeightSizedBox => SizedBox(height: halfDefaultSize);

  static Widget typeCategoryBoxWidget(String title,
      {double? fontSize,
      FontWeight? fontWeight,
      bool? boxActive = true,
      bool? inFilterMenu = false,
      int? index,
      ShopViewProductFilterViewModel? state}) {
    return Container(
        padding: boxActive!
            ? EdgeInsets.symmetric(
                vertical: quarterDefaultSize, horizontal: halfDefaultSize)
            : null,
        decoration: boxActive
            ? BoxDecoration(
                color: index == state!.selectedCategoryIndex
                    ? effectsBoxColor
                    : null,
                border: Border.all(color: effectsBoxColor))
            : null,
        child: Center(
            child: AppViewWidgets.textMontserrat(title,
                color: effectsTextColor,
                fontWeight: fontWeight ?? FontWeight.w500,
                fontSize: fontSize ?? null)));
  }

  static Widget typeBoxWidget2(
    String title, {
    double? fontSize,
    FontWeight? fontWeight,
    bool? hasNextWidget = false,
  }) {
    return Row(
      children: [
        Container(
            child: AppViewWidgets.textMontserrat(title,
                color: effectsTextColor,
                fontWeight: fontWeight ?? FontWeight.w500,
                fontSize: fontSize ?? null)),
        hasNextWidget!
            ? Row(
                children: [
                  SizedBox(width: halfDefaultSize),
                  circleSeparate(),
                  SizedBox(width: halfDefaultSize),
                ],
              )
            : SizedBox.shrink()
      ],
    );
  }

  static Widget circleSeparate() {
    return Container(
        width: 5,
        height: 5,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: effectsTextColor));
  }

  static Widget spinKitFadingCircle(BuildContext context,
      {double? size, Color? color}) {
    double _height = size ?? context.height / 2;
    return SizedBox(
        height: _height,
        child: Center(
            child: SpinKitFadingCircle(
                size: size ?? 60,
                itemBuilder: (context, index) => DecoratedBox(
                    decoration: BoxDecoration(
                        color: color ?? effectsBoxColor.darken(20),
                        shape: BoxShape.circle)))));
  }

  static Widget customImage(String? path,
          {double height = 38,
          bool isBorder = false,
          Color? borderColor = Colors.white,
          double? borderWidth,
          EdgeInsetsGeometry? borderPadding}) =>
      Container(
          padding: borderPadding ?? EdgeInsets.zero,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: borderColor!,
                  width: isBorder
                      ? borderWidth != null
                          ? borderWidth
                          : 2
                      : 0)),
          child: CircleAvatar(
              maxRadius: height / 2,
              backgroundColor: Colors.transparent,
              backgroundImage:
                  customAdvanceNetworkImage(path ?? profileAvatar)));

  static dynamic customAdvanceNetworkImage(String? path) {
    path ??= profileAvatar;
    return CachedNetworkImageProvider(path,
        cacheManager:
            CacheManager(Config('weedus', stalePeriod: Duration(days: 7))));
  }
}
