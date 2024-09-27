import 'package:new_weedus/export.dart';

class HorizontalProductInfoWidget extends StatelessWidget {
  const HorizontalProductInfoWidget(
      {Key? key, required this.product})
      : super(key: key);
  final Product product;
  final double _containerHeight = 50;
  final double _brandFontSize = 14;
  final double _titleFontSize = 16;
  final String _thcTitle = 'THC:';
  final String _cbdTitle = 'CBD:  ';
  final String _flOzTitle = 'FL OZ: ';
  final String _mlTitle = 'ML: ';

  @override
  Widget build(BuildContext context) {
    return AppViewWidgets.customInkWell(
        onTap: () => _productInfoDialog(product),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [_titleColumn, _quarterHeightSizedBox, _strainTypeRow]));
  }

  SizedBox get _quarterHeightSizedBox => SizedBox(height: quarterDefaultSize);

  Widget get _titleColumn => Container(
      height: _containerHeight,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [_brand, _title]));

  Widget get _brand => AppViewWidgets.textMontserrat(product.brand!,
      fontSize: _brandFontSize,
      color: effectsTextColor,
      fontWeight: FontWeight.normal);

  Widget get _title => AppViewWidgets.textMontserrat(product.title!,
      fontSize: _titleFontSize, color: nero);

  Widget get _strainTypeRow => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_product, _emptySpace, _strainWightType],
      );

  Widget get _product => product.isIndica != null ||
          product.isSativa != null ||
          product.isHybrid != null ||
          product.isCBD != null
      ? StrainTypeView(product: product)
      : SizedBox.shrink();

  Widget get _emptySpace => product.isIndica != null ||
          product.isSativa != null ||
          product.isHybrid != null ||
          product.isCBD != null
      ? SizedBox(width: halfDefaultSize)
      : SizedBox.shrink();

  Widget get _strainWightType => Row(
        children: [_thc, _cbd, _flOz, _ml],
      );

  Widget get _thc => product.thc != null
      ? AppViewWidgets.typeBoxWidget2('$_thcTitle ${product.thc}%',
          hasNextWidget: product.cbd != null || product.flOz != null)
      : SizedBox.shrink();

  Widget get _cbd => product.cbd != null
      ? AppViewWidgets.typeBoxWidget2('$_cbdTitle ${product.cbd}%',
          hasNextWidget: product.flOz != null || product.ml != null)
      : SizedBox.shrink();

  Widget get _flOz => product.flOz != null
      ? AppViewWidgets.typeBoxWidget2('$_flOzTitle ${product.flOz}',
          hasNextWidget: product.ml != null)
      : SizedBox.shrink();

  Widget get _ml => product.ml != null
      ? AppViewWidgets.typeBoxWidget2('$_mlTitle ${product.ml}',
          hasNextWidget: false)
      : SizedBox.shrink();

  static void _productInfoDialog(Product product) {
    SmartDialog.show(
        alignment: Alignment.center,
        builder: (context) {
          return ProductInfoDialogView(product: product);
        });
  }
}
