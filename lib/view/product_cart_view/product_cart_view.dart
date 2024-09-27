import 'package:new_weedus/export.dart';

class ProductCartView extends StatefulWidget {
  const ProductCartView({super.key, required this.context});
  final BuildContext context;


  @override
  State<ProductCartView> createState() => _ProductCartViewState();
}

class _ProductCartViewState extends State<ProductCartView>
    with ProductCartMixin {
  @override
  Widget build(BuildContext context) {
    CartState cartState = Provider.of<CartState>(context);
    return ProductCartViewBuildWidgets.buildWidget(widget.context, cart: cartState);
  }
}
