import 'package:new_weedus/export.dart';

class _ProductInfoDialogConstants {
  _ProductInfoDialogConstants._();

  static final double _height = 36;
  static final double _positionValue = 30;
  static final double _allPaddingValue = 40;
  static final double _desktopSize = 920;
  static final double _mobileSize = 500;
  static final double _widgetWidth = 400;
  static final int _duration = 3;
  static final int _initialDuration = 0;
  static final double _widthHeight = 36;
  static final int _darkenValue = 20;
  static final Color _ringColor = effectsBoxColor;
  static final Color _fillColor = effectsBoxColor.darken(_darkenValue);
  static final double _strokeWidth = 4.0;
  static final StrokeCap _strokeCap = StrokeCap.round;

  static final EdgeInsetsGeometry _boxPadding =
      EdgeInsets.symmetric(horizontal: halfDefaultSize);
  static final BoxDecoration _decoration = BoxDecoration(
      color: appColor, borderRadius: BorderRadius.circular(doubleDefaultSize));
  static const String _lineageTitle = 'Lineage';
  static const String _lineageDesc = 'Peanut Butter Breath x Lava Cake';
  static const String _terpenesTitle = 'Terpenes';
  static const String _terpenesDesc = 'Myrcene';
  static const String _cbdTitle = 'CBD';
  static const String _thcTitle = 'THC';
  static const double _titleWidth = 100;
  static const double _titleFontSize = 16;
  static const double _descriptionFontSize = 14;
  static const double _descriptionFontHeight = 1.5;
  static const double _imageWidth = 310;
  static const double _imageHeight = 250;
  static const double _imageListWidth = 100;
  static const double _listImageHeight = 70;
  static const double _listImageWeight = 50;
  static final double _imageListContainerHeight = 60;
  static const double _productNameFontSize = 24;

  static EdgeInsetsGeometry get _selectableImagePadding => EdgeInsets.symmetric(
      horizontal: quarterDefaultSize, vertical: halfDefaultSize);

  static BoxDecoration _selectableImageDecoration(int index,
          {int? currentIndex}) =>
      BoxDecoration(
          border: currentIndex == index
              ? Border.all(
                  color: currentIndex == index
                      ? appColor
                      : effectsTextColor.withOpacity(0.5))
              : null,
          borderRadius: BorderRadius.circular(halfDefaultSize));
}

class ProductInfoDialogWidgets {
  static SizedBox get _quarterHeightSizedBox =>
      SizedBox(height: quarterDefaultSize);

  static Widget get _appDivider => AppViewWidgets.appDivider();

  static SizedBox get _shrink => SizedBox.shrink();

  static Positioned circularCountDown(BuildContext context,
          CloseButtonCountDownState _priceValueProvider) =>
      Positioned(
          right: _ProductInfoDialogConstants._positionValue,
          top: _ProductInfoDialogConstants._positionValue,
          child: _circularProgressIndicator(
              context, _priceValueProvider.controller));

  static Widget buildWidget(BuildContext context,
          {Product? product,
          int? currentImageIndex,
          Function(int)? selectableImageOnTap}) =>
      Container(
          padding: context.width <= _ProductInfoDialogConstants._desktopSize
              ? EdgeInsets.all(defaultSize)
              : EdgeInsets.all(_ProductInfoDialogConstants._allPaddingValue),
          margin: EdgeInsets.all(defaultSize),
          width: context.width <= _ProductInfoDialogConstants._desktopSize
              ? _ProductInfoDialogConstants._mobileSize
              : null,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultSize),
              color: scaffoldBackgroundColor),
          child: context.width <= _ProductInfoDialogConstants._desktopSize
              ? _mobileView(context,
                  product: product,
                  currentImageIndex: currentImageIndex,
                  selectableImageOnTap: selectableImageOnTap)
              : _desktopView(context,
                  product: product,
                  currentImageIndex: currentImageIndex,
                  selectableImageOnTap: selectableImageOnTap));

  static SizedBox get _buildSizedBox => SizedBox(height: 10);

  static SizedBox get _fiftyWidthSizedBox => SizedBox(width: 50);

  static SizedBox get _fiftyHeightSizedBox => SizedBox(height: 50);

  static SingleChildScrollView _mobileView(BuildContext context,
          {Product? product,
          int? currentImageIndex,
          Function(int)? selectableImageOnTap}) =>
      SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
            _imageColumn(context, product!, currentImageIndex!,
                selectableImageOnTap: selectableImageOnTap),
            _fiftyHeightSizedBox,
            _productInfoColumn(context,
                product: product,
                currentImageIndex: currentImageIndex,
                selectableImageOnTap: selectableImageOnTap)
          ]));

  static SingleChildScrollView _desktopView(BuildContext context,
          {Product? product,
          int? currentImageIndex,
          Function(int)? selectableImageOnTap}) =>
      SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _imageColumn(context, product!, currentImageIndex!,
                          selectableImageOnTap: selectableImageOnTap),
                      _fiftyWidthSizedBox,
                      _productInfoColumn(context,
                          product: product,
                          currentImageIndex: currentImageIndex,
                          selectableImageOnTap: selectableImageOnTap)
                    ])
              ])));

  static Column _productInfoColumn(BuildContext context,
          {Product? product,
          int? currentImageIndex,
          Function(int)? selectableImageOnTap}) =>
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _productBrandAndName(product!),
            _buildSizedBox,
            _sizedWidget(child: _priceButtons(product)),
            _sizedWidget(child: _appDivider),
            _cannabinoids(context, product),
            _quarterHeightSizedBox,
            _getTerpenes(context, currentImageIndex!),
            _sizedWidget(child: _effects(product)),
            _sizedWidget(child: _getDescription(product)),
            _sizedWidget(child: _appDivider)
          ]);

  static SizedBox _sizedWidget({Widget? child}) =>
      SizedBox(width: _ProductInfoDialogConstants._widgetWidth, child: child);

  static Column _imageColumn(
          BuildContext context, Product product, int currentImageIndex,
          {Function(int)? selectableImageOnTap,
          CrossAxisAlignment? crossAxisAlignment,
          MainAxisSize? mainAxisSize}) =>
      Column(
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
          mainAxisSize: mainAxisSize ?? MainAxisSize.min,
          children: [
            _strainWidget(product),
            SizedBox(height: 41),
            _imageRow(context, product, currentImageIndex,
                selectableImageOnTap: selectableImageOnTap)
          ]);

  static Widget _strainWidget(Product product) =>
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _getStrain(product),
        _titleWidget(product.product!.capitalize())
      ]);

  static Widget _imageRow(
          BuildContext context, Product product, int currentImageIndex,
          {Function(int)? selectableImageOnTap}) =>
      Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _imageViewWidget(currentImageIndex, product: product),
            SizedBox(width: defaultSize),
            _imageListWidget(product, currentImageIndex,
                selectableImageOnTap: selectableImageOnTap)
          ]);

  static Widget get imageSeparatorWidget =>
      AppViewWidgets.appDivider(height: defaultSize);

  static Widget _imageListWidget(Product product, int currentImageIndex,
          {Function(int)? selectableImageOnTap}) =>
      _imageListBuilder(
          product: product,
          itemBuilder: (context, index) => AppViewWidgets.customInkWell(
              onTap: () => selectableImageOnTap!(index),
              child: _selectableImageWidget(index,
                  product: product, currentIndex: currentImageIndex)));

  static Widget _productBrandAndName(Product product) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _text(product.brand!,
            fontSize: _ProductInfoDialogConstants._productNameFontSize,
            fontWeight: FontWeight.bold),
        _text(product.title!,
            color: nero,
            fontWeight: FontWeight.bold,
            fontSize: _ProductInfoDialogConstants._productNameFontSize)
      ]);

  static Widget _priceButtons(Product product) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [DialogProductPrice(product: product)]);

  static Widget _cannabinoids(BuildContext context, Product product) =>
      product.type != null || product.thc != null || product.cbd != null
          ? Column(children: [
              product.thc != null
                  ? _titleAndValueWidget(context,
                      title: _ProductInfoDialogConstants._thcTitle,
                      value: '${product.thc}%')
                  : _shrink,
              product.cbd != null ? _quarterHeightSizedBox : _shrink,
              product.cbd != null
                  ? _titleAndValueWidget(context,
                      title: _ProductInfoDialogConstants._cbdTitle,
                      value: '${product.cbd}%')
                  : _shrink
            ])
          : _shrink;

  static Widget _getTerpenes(BuildContext context, int currentIndex) =>
      currentIndex != 0 &&
              currentIndex != 1 &&
              currentIndex != 2 &&
              currentIndex != 3
          ? _shrink
          : Column(children: [
              _titleAndValueWidget(context,
                  title: _ProductInfoDialogConstants._lineageTitle,
                  value: _ProductInfoDialogConstants._lineageDesc),
              _quarterHeightSizedBox,
              _titleAndValueWidget(context,
                  title: _ProductInfoDialogConstants._terpenesTitle,
                  value: _ProductInfoDialogConstants._terpenesDesc)
            ]);

  static Widget _effects(Product product) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _appDivider,
        EffectView(product: product),
        product.isSativa != null ||
                product.isIndica != null ||
                product.isHybrid != null
            ? _appDivider
            : _shrink
      ]);

  static Widget _getDescription(Product product) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _text('${product.title}:'),
        _quarterHeightSizedBox,
        _descriptionWidget(product)
      ]);

  ///

  static Widget _getStrain(Product product) => product.isIndica != null ||
          product.isSativa != null ||
          product.isHybrid != null ||
          product.isCBD != null
      ? Row(children: [
          StrainTypeView(
              product: product,
              boxHeight: _ProductInfoDialogConstants._height,
              padding: _ProductInfoDialogConstants._boxPadding,
              boxDecoration: _ProductInfoDialogConstants._decoration,
              fontColor: nero,
              fontSize: _ProductInfoDialogConstants._titleFontSize),
          SizedBox(width: defaultSize)
        ])
      : _shrink;

  static Widget _titleAndValueWidget(BuildContext context,
      {String? title, String? value, Widget? child}) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
          width: _ProductInfoDialogConstants._titleWidth,
          child: _text('$title:', textAlign: TextAlign.start)),

      /// Expanded(child: child ?? _text(value!, color: nero))
      SizedBox(
          width: context.width * 0.3,
          child: child ?? _text(value!, color: nero))
    ]);
  }

  static Widget _descriptionWidget(Product product) {
    return _text(
        product.description != null
            ? product.description!
            : AppStrings.loremIpsum,
        fontSize: _ProductInfoDialogConstants._descriptionFontSize,
        fontWeight: FontWeight.normal,
        color: nero,
        height: _ProductInfoDialogConstants._descriptionFontHeight);
  }

  static Widget _imageViewWidget(int currentIndex, {Product? product}) {
    return Container(
        width: _ProductInfoDialogConstants._imageWidth,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(defaultSize),
          child: Image.asset(product!.images![currentIndex],
              filterQuality: FilterQuality.high, height: _ProductInfoDialogConstants._imageHeight),
        ));
  }

  static Widget _imageListBuilder(
      {Product? product, Widget? Function(BuildContext, int)? itemBuilder}) {
    return SizedBox(
        width: _ProductInfoDialogConstants._imageListWidth,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: itemBuilder!,
                  separatorBuilder: (context, index) => imageSeparatorWidget,
                  itemCount: product!.images!.length)
            ]));
  }

  static Widget _titleWidget(String title) => Container(
      child: AppViewWidgets.textMontserrat(title,
          fontWeight: FontWeight.bold,
          fontSize: _ProductInfoDialogConstants._productNameFontSize,
          textAlign: TextAlign.start));

  static Widget _selectableImageWidget(int index,
          {Product? product, int? currentIndex}) =>
      Container(
          height: _ProductInfoDialogConstants._imageListContainerHeight,
          padding: _ProductInfoDialogConstants._selectableImagePadding,
          decoration: _ProductInfoDialogConstants._selectableImageDecoration(
              index,
              currentIndex: currentIndex),
          child: _imageWidget(index, product: product));

  static Widget _imageWidget(int index, {Product? product}) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(defaultSize),
        child: Image.asset(product!.images![index],
            width: _ProductInfoDialogConstants._listImageWeight,
            height: _ProductInfoDialogConstants._listImageHeight));
  }

  static Widget _text(String title,
          {double? fontSize,
          FontWeight? fontWeight,
          TextAlign? textAlign,
          Color? color,
          double? height}) =>
      AppViewWidgets.textMontserrat(title,
          fontSize: fontSize ?? _ProductInfoDialogConstants._titleFontSize,
          fontWeight: fontWeight ?? FontWeight.w500,
          color: color ?? effectsTextColor,
          textAlign: textAlign,
          height: height);

  static Widget _circularProgressIndicator(
          BuildContext context, CountDownController controller) =>
      Stack(alignment: Alignment.center, children: [
        CircularCountDownTimer(
            duration: _ProductInfoDialogConstants._duration,
            initialDuration: _ProductInfoDialogConstants._initialDuration,
            controller: controller,
            width: _ProductInfoDialogConstants._widthHeight,
            height: _ProductInfoDialogConstants._widthHeight,
            ringColor: _ProductInfoDialogConstants._ringColor,
            ringGradient: null,
            fillColor: _ProductInfoDialogConstants._fillColor,
            fillGradient: null,
            backgroundGradient: null,
            strokeWidth: _ProductInfoDialogConstants._strokeWidth,
            strokeCap: _ProductInfoDialogConstants._strokeCap,
            textFormat: CountdownTextFormat.S,
            isReverse: false,
            isReverseAnimation: false,
            isTimerTextShown: true,
            autoStart: false,
            onStart: () {},
            onComplete: () => SmartDialog.dismiss(force: true),
            onChange: (String timeStamp) {},
            timeFormatterFunction: (defaultFormatterFunction, duration) => ''),
        AppViewWidgets.customInkWell(
            child: Icon(Icons.close),
            onTap: () => SmartDialog.dismiss(force: true))
      ]);
}
