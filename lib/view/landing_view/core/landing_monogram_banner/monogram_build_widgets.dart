import 'package:new_weedus/export.dart';

class _MonogramBuildConstants {
  _MonogramBuildConstants._();

  static const String _subTitle =
      'From soil to seed, the expert growers at Monogram leverage a lifetime of cultivation experience to ensure our flower is treated with the respect it deserves through every stage of the grow process. Precise control and constant monitoring allows our flower to reach its full potential as a superior smoke.';
  static const String _buttonTitle = 'Add to Cart';
  static const String _thcTitle = 'THC: ';
  static const String _aLookBehindThe = 'A LOOK BEHIND THE';
  static const String _monogramTitle = ' MONOGRAM ';
  static const String _processTitle = 'PROCESS';

  static final double _titleFontSize = 40;
  static final double _subTitleFontSize = 16;
  static final int _descMaxLines = 3;
  static final double _desiredItemWidth = 290;
  static const double _opacityValue = 0.7;

  static SizedBox get _halfHeightEmptySpace =>
      SizedBox(height: halfDefaultSize);

  static SizedBox get _halfWidthEmptySpace => SizedBox(width: halfDefaultSize);

  static SizedBox get _heightEmptySpace => SizedBox(height: defaultSize);
  static final EdgeInsetsGeometry _buildPadding =
      EdgeInsets.symmetric(horizontal: doubleDefaultSize);

  static final Radius _borderRadius = Radius.circular(defaultSize);

  static double _pageSize(BuildContext context) => context.width * 0.8;
}

class MonogramBuildWidgets {
  static Padding buildWidgets(BuildContext context, MonogramMixin mixin,
          {CartState? cartState,
          ScrollController? horizontalScrollController,
          ScrollController? verticalScrollController}) =>
      Padding(
          padding: _MonogramBuildConstants._buildPadding,
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                _monogramRichTextTitle(context,
                    horizontalScrollController: horizontalScrollController,
                    verticalScrollController: verticalScrollController),
                _MonogramBuildConstants._halfHeightEmptySpace,
                _subTitle(context),
                _MonogramBuildConstants._heightEmptySpace,
                _MonogramCardWidget._buildCard(context, mixin,cartState: cartState),
              ])));

  static _monogramRichTextTitle(BuildContext context,
          {ScrollController? horizontalScrollController,
          ScrollController? verticalScrollController}) =>
      Center(
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: _MonogramBuildConstants._aLookBehindThe,
                  style: _style(),
                  children: <TextSpan>[
                    TextSpan(
                        text: _MonogramBuildConstants._monogramTitle,
                        style: _style(
                            fontWeight: FontWeight.bold, color: appColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => _bindPage(context,
                              horizontalScrollController:
                                  horizontalScrollController,
                              verticalScrollController:
                                  verticalScrollController)),
                    TextSpan(
                        text: _MonogramBuildConstants._processTitle,
                        style: _style())
                  ])));

  static TextStyle _style({FontWeight? fontWeight, Color? color}) =>
      GoogleFonts.aboreto(
          color: color ?? nero,
          fontSize: _MonogramBuildConstants._titleFontSize,
          fontWeight: fontWeight);

  static _subTitle(BuildContext context) => SizedBox(
      width: context.width <= 1200 ? null : context.width * 0.7,
      //width: _MonogramBuildConstants._pageSize(context),
      child: AppViewWidgets.textMontserrat(_MonogramBuildConstants._subTitle,
          fontSize: _MonogramBuildConstants._subTitleFontSize,
          textAlign: TextAlign.center));

  static void _bindPage(BuildContext ctx,
      {ScrollController? horizontalScrollController,
      ScrollController? verticalScrollController}) {
    SmartDialog.show(
        alignment: Alignment.center,
        builder: (context) {
          return MonogramDialogWidgets.buildDialog(context,
              horizontalScrollController: horizontalScrollController,
              verticalScrollController: verticalScrollController);
        });
  }
}

class _MonogramCardWidget {
  static ResponsiveGridList _buildCard(
          BuildContext context, MonogramMixin mixin,{CartState? cartState}) =>
      ResponsiveGridList(
          rowMainAxisAlignment: MainAxisAlignment.center,
          shrinkWrap: true,
          desiredItemWidth: _MonogramBuildConstants._desiredItemWidth,
          children: List.generate(
              monogramBannerModel.length,
              (index) => _cartBuilderWidget(context, mixin,cartState: cartState,
                  product: monogramBannerModel[index])));

  static Widget _cartBuilderWidget(BuildContext context, MonogramMixin mixin,
          {CartState? cartState, Product? product}) =>
      Card(
          color: nero.withOpacity(_MonogramBuildConstants._opacityValue),
          child: Column(children: [
            AppViewWidgets.customInkWell(
                onTap: () => _productInfoDialog(product),
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: _MonogramBuildConstants._borderRadius,
                        topRight: _MonogramBuildConstants._borderRadius),
                    child: Image.asset(product!.images![0]))),
            Padding(
                padding: EdgeInsets.all(halfDefaultSize),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _textWidget(product.brand!, fontWeight: FontWeight.w600),
                      _textWidget(product.title!, fontWeight: FontWeight.w600),
                      Row(children: [
                        _textWidget(product.type!),
                        _MonogramBuildConstants._halfWidthEmptySpace,
                        _textWidget(
                            '${_MonogramBuildConstants._thcTitle} ${product.thc}')
                      ]),
                      _MonogramBuildConstants._halfHeightEmptySpace,
                      _textWidget(formatPrice(product.price),
                          fontSize: _MonogramBuildConstants._subTitleFontSize,
                          fontWeight: FontWeight.w600,
                          color: appColor),
                      _MonogramBuildConstants._halfHeightEmptySpace,
                      _descText(product.description!)
                    ])),
            _MonogramBuildConstants._halfHeightEmptySpace,
            _buttonWidget(
                onTap: () => mixin.addProduct(context,cartState!,
                    product: product, isDispensaryView: false))
          ]));

  static void _productInfoDialog(Product product) {
    SmartDialog.show(
        alignment: Alignment.center,
        builder: (context) {
          return ProductInfoDialogView(product: product);
        });
  }

  static Widget _textWidget(String title,
          {FontWeight? fontWeight, double? fontSize, Color? color}) =>
      AppViewWidgets.textMontserrat(title,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color ?? scaffoldBackgroundColor);

  static Text _descText(String description) => Text(description,
      maxLines: _MonogramBuildConstants._descMaxLines,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.montserrat(color: scaffoldBackgroundColor));

  static Padding _buttonWidget({VoidCallback? onTap}) => Padding(
      padding: const EdgeInsets.all(halfDefaultSize),
      child: Align(
          alignment: Alignment.bottomRight,
          child: TextButton(
              onPressed: onTap,
              child: AppViewWidgets.textMontserrat(
                  _MonogramBuildConstants._buttonTitle,
                  fontWeight: FontWeight.w500,
                  color: nero),
              style: _buttonStyle)));

  static ButtonStyle get _buttonStyle => TextButton.styleFrom(
      backgroundColor: appColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultSize)));
}
