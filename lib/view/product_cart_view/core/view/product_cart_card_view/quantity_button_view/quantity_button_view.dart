import 'package:new_weedus/export.dart';

class QuantityButtonView extends StatelessWidget {
  const QuantityButtonView(
      {required this.product, required this.cart});

  final Product product;
  final CartState cart;

  @override
  Widget build(BuildContext context) {
    return QuantityButtonBuildWidgets.buildWidgets(product, cart);
  }
}
