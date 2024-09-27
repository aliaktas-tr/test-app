import 'package:new_weedus/export.dart';

class _LandingProductConstants {
  _LandingProductConstants._();

  static const String _buttonTitle = 'Add to Cart';
  static final double _titleFontSize = 40.0;
  static final double _subTitleFontSize = 16.0;
  static final int _descMaxLines = 3;
  static final double _height = 390.0;
  static final double _width = 270.0;
  static final double _gradientFractionOnStart = 0.0;
  static final double _gradientFractionOnEnd = 0.15;
  static final double _imageWidth = 90.0;
  static final double _imageHeight = 80.0;
  static final double _screenSize = 1200.0;
  static final String _grams = 'g';
  static final String _flOzTitle = 'fl oz';
  static final String _mlTitle = 'ml';
  static final String _slash = ' / ';

  static SizedBox get _halfHeightEmptySpace =>
      SizedBox(height: halfDefaultSize);

  static SizedBox get _halfWidthEmptySpace => SizedBox(width: halfDefaultSize);

  static final Radius _borderRadius = Radius.circular(defaultSize);

  static double _pageSize(BuildContext context) => context.width * 0.8;
  static double _buttonPaddingValue = 2.0;
}

class LandingProductBuildWidgets {
  static Widget buildWidget(BuildContext context,
          {VoidCallback? previousOnTap,
          VoidCallback? nextOnTap,
          Axis? scrollDirection,
          AutoScrollController? controller,
          String? title,
          List<Product>? productList,
          LandingProductMixin? mixin,
          CartState? cartState,
          bool? isDispensaryView}) =>
      Padding(
          padding: EdgeInsets.symmetric(horizontal: doubleDefaultSize),
          child: Center(
              child: SizedBox(
                  width: context.width <= _LandingProductConstants._screenSize
                      ? null
                      : context.width * 0.7,
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _title(title!),
                        _heightSizedBox,
                        Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _leftScrollButton(previousOnTap: previousOnTap!),
                              _widthSizedBox,
                              _productCards(context,
                                  scrollDirection: scrollDirection,
                                  controller: controller!,
                                  productList: productList,
                                  mixin: mixin,
                                  cartState: cartState,
                                  isDispensaryView: isDispensaryView),
                              _widthSizedBox,
                              _rightScrollButton(nextOnTap: nextOnTap!)
                            ])
                      ]))));

  static Widget _title(String? title) => Align(
      alignment: Alignment.centerLeft,
      child: Text(title ?? '', style: _style(fontWeight: FontWeight.bold)));

  static Widget _productCards(BuildContext context,
          {Axis? scrollDirection,
          AutoScrollController? controller,
          List<Product>? productList,
          LandingProductMixin? mixin,
          CartState? cartState,
          bool? isDispensaryView}) =>
      Expanded(
        child: SizedBox(
            width: context.width <= _LandingProductConstants._screenSize
                ? null
                : context.width * 0.6,
            child: Center(
                child: SizedBox(
                    width: _LandingProductConstants._pageSize(context),
                    child: _LandingProductCardWidget._buildCard(context,
                        scrollDirection: scrollDirection,
                        scrollController: controller,
                        productList: productList,
                        mixin: mixin,
                        cartState: cartState,
                        isDispensaryView: isDispensaryView)))),
      );

  static Widget _leftScrollButton({VoidCallback? previousOnTap}) =>
      ScrollButtonHoverWidget(
          onTap: previousOnTap!,
          icon: Icons.arrow_back_ios_new,
          padding: EdgeInsets.only(
              right: _LandingProductConstants._buttonPaddingValue));

  static Widget _rightScrollButton({VoidCallback? nextOnTap}) =>
      ScrollButtonHoverWidget(
          onTap: nextOnTap!,
          icon: Icons.arrow_forward_ios,
          padding: EdgeInsets.only(
              left: _LandingProductConstants._buttonPaddingValue));

  static SizedBox get _widthSizedBox => SizedBox(width: defaultSize);

  static SizedBox get _heightSizedBox => SizedBox(height: defaultSize);

  static TextStyle _style({FontWeight? fontWeight}) => GoogleFonts.aboreto(
      color: nero,
      fontSize: _LandingProductConstants._titleFontSize,
      fontWeight: fontWeight);
}

class _LandingProductCardWidget {
  static SizedBox _buildCard(BuildContext context,
          {AutoScrollController? scrollController,
          Axis? scrollDirection,
          List<Product>? productList,
          LandingProductMixin? mixin,
          CartState? cartState,
          bool? isDispensaryView}) =>
      SizedBox(
          height: _LandingProductConstants._height,
          child: FadingEdgeScrollView.fromScrollView(
              gradientFractionOnStart:
                  _LandingProductConstants._gradientFractionOnStart,
              gradientFractionOnEnd:
                  _LandingProductConstants._gradientFractionOnEnd,
              child: ListView.separated(
                  scrollDirection: scrollDirection!,
                  controller: scrollController,
                  itemBuilder: (context, index) => SizedBox(
                      width: _LandingProductConstants._width,
                      height: _LandingProductConstants._height,
                      child: AppViewWidgets.customInkWell(
                        onTap: () => _showProductInfoDialog(productList[index]),
                        child: _hoverContainer(context,
                            product: productList[index],
                            index: index,
                            controller: scrollController,
                            cartState: cartState,
                            mixin: mixin,
                            isDispensaryView: isDispensaryView),
                      )),
                  separatorBuilder: (context, index) =>
                      SizedBox(width: defaultSize),
                  itemCount: productList!.length)));

  static Widget _hoverContainer(BuildContext context,
          {int? index,
          AutoScrollController? controller,
          LandingProductMixin? mixin,
          CartState? cartState,
          Product? product,
          bool? isDispensaryView}) =>
      _wrapScrollTag(
          index: index!,
          controller: controller!,
          child: CardHoverWidget(
              child: _cardColumn(context,
                  product: product,
                  cartState: cartState,
                  mixin: mixin,
                  isDispensaryView: isDispensaryView)));

  static Column _cardColumn(BuildContext context,
          {LandingProductMixin? mixin,
          CartState? cartState,
          Product? product,
          bool? isDispensaryView}) =>
      Column(children: [
        _productImage(product!),
        _productInfo(product),
        _LandingProductConstants._halfHeightEmptySpace,
        Spacer(),
        _buttonWidget(
            onTap: () => mixin!.addProduct(context,cartState!,
                product: product, isDispensaryView: isDispensaryView))
      ]);

  static Widget _productImage(Product product) => Stack(
        children: [
          Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: _LandingProductConstants._borderRadius,
                      topRight: _LandingProductConstants._borderRadius),
                  child: Padding(
                      padding: const EdgeInsets.all(halfDefaultSize),
                      child: Image.asset(product.images![0],
                          height: _LandingProductConstants._imageHeight,
                          width: _LandingProductConstants._imageWidth)))),
          Positioned(
              top: halfDefaultSize,
              left: halfDefaultSize,
              child: _strainTypeView(product)),
        ],
      );

  static Padding _productInfo(Product product) => Padding(
      padding: EdgeInsets.all(halfDefaultSize),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _textWidget(product.brand!,
            fontWeight: FontWeight.w600, color: effectsBoxColor.darken(20)),
        _textWidget(product.title!, fontWeight: FontWeight.w600),
        _weightWidget(product),
        /*       Row(
          children: [
            product.size != null
                ? _textWidget(
                    product.size.toString() + _LandingProductConstants._grams,
                    fontWeight: FontWeight.w600,
                    fontSize: 16)
                : product.pack != null
                    ? _textWidget(product.pack!, fontWeight: FontWeight.w600)
                    : _shrink,
            SizedBox(width: defaultSize),
            _textWidget(product.type!)
          ],
        ),*/
        _LandingProductConstants._halfWidthEmptySpace,
        SizedBox(height: quarterDefaultSize),
        CannabinolView(product: product),
        _LandingProductConstants._halfHeightEmptySpace,
        decimalPrice(product),
        _LandingProductConstants._halfHeightEmptySpace,
        product.description != null && product.description!.isNotEmpty
            ? _descText(product.description!)
            : _shrink,
      ]));

  static Row _weightWidget(Product product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        product.size != null
            ? _textWidget(
                '${product.size.toString() + _LandingProductConstants._grams}',
                fontWeight: FontWeight.w600,
                fontSize: _LandingProductConstants._subTitleFontSize)
            : product.ml != null && product.flOz != null
                ? Row(children: [
                    product.flOz != null
                        ? _textWidget(
                            '${product.flOz.toString()} ${_LandingProductConstants._flOzTitle}',
                            fontWeight: FontWeight.w600,
                            fontSize:
                                _LandingProductConstants._subTitleFontSize)
                        : _shrink,
                    product.ml != null
                        ? _textWidget(_LandingProductConstants._slash,
                            fontWeight: FontWeight.w600,
                            fontSize:
                                _LandingProductConstants._subTitleFontSize)
                        : _shrink,
                    product.ml != null
                        ? _textWidget(
                            '${product.ml.toString()} ${_LandingProductConstants._mlTitle}',
                            fontWeight: FontWeight.w600,
                            fontSize:
                                _LandingProductConstants._subTitleFontSize)
                        : _shrink
                  ])
                : product.pack != null
                    ? _textWidget(product.pack!,
                        fontWeight: FontWeight.w600,
                        fontSize: _LandingProductConstants._subTitleFontSize)
                    : _shrink,
        SizedBox(width: halfDefaultSize),
        product.type != null
            ? _textWidget(product.type!,
                fontSize: _LandingProductConstants._subTitleFontSize)
            : _shrink,
      ],
    );
  }

  static SmallDecimalPriceText decimalPrice(Product product) {
    return SmallDecimalPriceText(
        mainAxisAlignment: MainAxisAlignment.start,
        product: product,
        color: appColor.darken(20),
        priceSize: 18);
  }

  static SizedBox get _shrink => const SizedBox.shrink();

  static void _showProductInfoDialog(Product product) {
    SmartDialog.show(
        alignment: Alignment.center,
        builder: (context) {
          return ProductInfoDialogView(product: product);
        });
  }

  static Widget _strainTypeView(Product product) => product.isIndica != null ||
          product.isSativa != null ||
          product.isHybrid != null ||
          product.isCBD != null
      ? Row(children: [StrainTypeView(product: product)])
      : _shrink;

  static ClipRRect _wrapScrollTag(
          {required AutoScrollController controller,
          required int index,
          required Widget child}) =>
      ClipRRect(
          borderRadius: BorderRadius.circular(defaultSize),
          child: AutoScrollTag(
              key: ValueKey(index),
              controller: controller,
              index: index,
              child: child));

  static Widget _textWidget(String title,
          {FontWeight? fontWeight, double? fontSize, Color? color}) =>
      AppViewWidgets.textMontserrat(title,
          fontSize: fontSize, fontWeight: fontWeight, color: color ?? nero);

  static Text _descText(String? description) => Text(description ?? '',
      maxLines: _LandingProductConstants._descMaxLines,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.montserrat(color: nero));

  static Padding _buttonWidget({VoidCallback? onTap}) => Padding(
      padding: const EdgeInsets.all(halfDefaultSize),
      child: Align(
          alignment: Alignment.bottomRight,
          child: TextButton(
              onPressed: onTap,
              child: AppViewWidgets.textMontserrat(
                  _LandingProductConstants._buttonTitle,
                  fontWeight: FontWeight.w500,
                  color: nero),
              style: _buttonStyle)));

  static ButtonStyle get _buttonStyle => TextButton.styleFrom(
      backgroundColor: appColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultSize)));
}
