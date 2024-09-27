import 'package:new_weedus/export.dart';

class ProductInfoDialogView extends StatefulWidget {
  const ProductInfoDialogView({super.key, required this.product});

  final Product product;

  @override
  State<ProductInfoDialogView> createState() => _ProductInfoDialogViewState();
}

class _ProductInfoDialogViewState extends State<ProductInfoDialogView>
    with ProductInfoDialogMixin {
  @override
  Widget build(BuildContext context) {
    final _priceValueProvider = context.watch<CloseButtonCountDownState>();
    return Stack(children: [
      ProductInfoDialogWidgets.buildWidget(context,
          product: widget.product,
          currentImageIndex: currentImageIndex,
          selectableImageOnTap: (index) => selectImage(index)),
      ProductInfoDialogWidgets.circularCountDown(context, _priceValueProvider)
    ]);
  }
}
