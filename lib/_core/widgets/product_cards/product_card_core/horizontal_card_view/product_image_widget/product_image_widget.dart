import 'package:new_weedus/export.dart';


class HorizontalProductImageWidget extends StatelessWidget {
  const HorizontalProductImageWidget(
      {Key? key, required this.product})
      : super(key: key);
  final Product product;
  final double _imageWidth = 70;
  final double _imageHeight = 50;
  final double _typeFontSize = 14;

  @override
  Widget build(BuildContext context) {
    return AppViewWidgets.customInkWell(
        onTap: () =>_productInfoDialog(product),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_productImage, _quarterHeightEmptySpace, _productType]));
  }

  Widget get _productImage => SizedBox(
      width: _imageWidth,
      height: _imageHeight,
      child: OnHoverWidget(
          child: Image.asset(product.transparentImages != null
              ? product.transparentImages![0]
              : product.images![0])));

  SizedBox get _quarterHeightEmptySpace => SizedBox(height: quarterDefaultSize);

  Widget get _productType => Padding(
      padding: const EdgeInsets.symmetric(vertical: quarterDefaultSize),
      child: product.type != null
          ? AppViewWidgets.textMontserrat(product.type!, fontSize: _typeFontSize)
          : SizedBox.shrink());

  static void _productInfoDialog(Product product) {
    SmartDialog.show(
        alignment: Alignment.center,
        builder: (context) {
          return ProductInfoDialogView(product: product);
        });
  }
}
