import 'package:new_weedus/export.dart';

class CardView extends StatelessWidget {
  const CardView({super.key, required this.product, required this.cart});

  final Product product;
  final CartState cart;

  @override
  Widget build(BuildContext context) {
    return ProductBuildWidgets.buildWidgets(product, cart);
  }
}
