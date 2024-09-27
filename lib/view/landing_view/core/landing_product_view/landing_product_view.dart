import 'package:new_weedus/export.dart';

class LandingProductView extends StatefulWidget {
  const LandingProductView(
      {super.key,
      required this.productList,
      required this.title,
      required this.controller,
      required this.scrollDirection,
      required this.previousOnTap,
      required this.nextOnTap});

  final List<Product> productList;
  final String title;
  final AutoScrollController controller;
  final Axis scrollDirection;
  final VoidCallback previousOnTap;
  final VoidCallback nextOnTap;

  @override
  State<LandingProductView> createState() => _LandingProductViewState();
}

class _LandingProductViewState extends State<LandingProductView>
    with LandingProductMixin {
  @override
  Widget build(BuildContext context) {
    CartState cartState = Provider.of<CartState>(context);
    return LandingProductBuildWidgets.buildWidget(context,
        nextOnTap: widget.nextOnTap,
        previousOnTap: widget.previousOnTap,
        scrollDirection: widget.scrollDirection,
        controller: widget.controller,
        productList: widget.productList,
        title: widget.title,
        mixin: this,
        cartState: cartState,
        isDispensaryView: false);
  }
}
