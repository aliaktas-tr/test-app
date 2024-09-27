import 'package:new_weedus/export.dart';

class TestVerticalCard extends StatelessWidget {
  const TestVerticalCard({super.key, this.product});

  final Product? product;

  @override
  Widget build(BuildContext context) {
    CartState cartState = Provider.of<CartState>(context);
    return _LandingProductBuildWidgets.buildWidget(context,
        product: product,
        cartState: cartState,
        isDispensaryView: false);
  }
}

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

class _LandingProductBuildWidgets {
  static Widget buildWidget(BuildContext context,
          {Product? product,
          CartState? cartState,
          bool? isDispensaryView}) =>
      _productCards(context,
          product: product,
          cartState: cartState,
          isDispensaryView: isDispensaryView);



  static Widget _productCards(BuildContext context,
          {Product? product,
          CartState? cartState,
          bool? isDispensaryView}) =>
      _LandingProductCardWidget._buildCard(context,
          product: product,
          cartState: cartState,
          isDispensaryView: isDispensaryView);

  static SizedBox get _widthSizedBox => SizedBox(width: defaultSize);

  static SizedBox get _heightSizedBox => SizedBox(height: defaultSize);

  static TextStyle _style({FontWeight? fontWeight}) => GoogleFonts.aboreto(
      color: nero,
      fontSize: _LandingProductConstants._titleFontSize,
      fontWeight: fontWeight);
}

class _LandingProductCardWidget {
  static SizedBox _buildCard(BuildContext context,
          {Product? product,
          CartState? cartState,
          bool? isDispensaryView}) =>
      SizedBox(
          width: _LandingProductConstants._width,
          height: _LandingProductConstants._height,
          child: AppViewWidgets.customInkWell(
            onTap: () => _showProductInfoDialog(product!),
            child: _hoverContainer(context,
                product: product,
                cartState: cartState,
                isDispensaryView: isDispensaryView),
          ));

  static Widget _hoverContainer(BuildContext context,
          {
          CartState? cartState,
          Product? product,
          bool? isDispensaryView}) =>
      CardHoverWidget(
          child: _cardColumn(context,
              product: product,
              cartState: cartState,
              isDispensaryView: isDispensaryView));

  static Column _cardColumn(BuildContext context,
          {CartState? cartState, Product? product, bool? isDispensaryView}) =>
      Column(children: [
        _productImage(product!),
        _productInfo(product),
        _LandingProductConstants._halfHeightEmptySpace,
        Spacer(),
        _buttonWidget(
            onTap: () => addProduct(context,cartState!,
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

  static final double _purchaseSize = 28.5;
  static final ProductCartViewModel _cardViewModel = ProductCartViewModel();

  static void addProduct(BuildContext context,CartState cart,
      {Product? product, bool? isDispensaryView}) {
    if (product!.size != null &&
        product.size! + cart.totalSize > _purchaseSize) {
      BuildPurchaseErrorDialog.dialog(cart);
    } else if (product.sizeList != null && product.sizeList!.length > 1) {
      BuildDialog.showDialog(
          child: ProductSizeSelectorDialogView(contextDue: context,
              product: product, isDispensaryView: isDispensaryView));
    } else {
      if (cart.cartItems!.containsKey(product.tag)) {
        _cardViewModel.addItemToCart(context,
            product: product, cart: cart, isDispensaryView: isDispensaryView);
      } else {
        _cardViewModel.addNewItemToCart(context,
            product: product, cart: cart, isDispensaryView: isDispensaryView);
      }
    }
  }

  static Widget _strainTypeView(Product product) => product.isIndica != null ||
          product.isSativa != null ||
          product.isHybrid != null ||
          product.isCBD != null
      ? Row(children: [StrainTypeView(product: product)])
      : _shrink;

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
