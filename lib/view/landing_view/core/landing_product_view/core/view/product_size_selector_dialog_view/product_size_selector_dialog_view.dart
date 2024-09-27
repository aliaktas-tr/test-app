import 'package:new_weedus/export.dart';

class ProductSizeSelectorDialogView extends StatelessWidget {
  ProductSizeSelectorDialogView({Key? key, this.product, this.isDispensaryView, required this.contextDue})
      : super(key: key);
  final Product? product;
  final bool? isDispensaryView;
  final BuildContext contextDue;

  final ProductCartViewModel _cardViewModel = ProductCartViewModel();

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartState>();
    return ProductSizeSelectorDialogBuildWidgets.buildWidget(contextDue,
        cart: cart,
        product: product,
        cardViewModel: _cardViewModel,
        isDispensaryView: isDispensaryView);
  }
}
