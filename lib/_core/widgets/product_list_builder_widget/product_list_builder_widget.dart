import 'package:new_weedus/export.dart';

class ProductMenuTitleListBuilder extends StatefulWidget {
  const ProductMenuTitleListBuilder({Key? key, this.menuList, this.onTap})
      : super(key: key);
  final List<String>? menuList;
  final VoidCallback? onTap;

  @override
  State<ProductMenuTitleListBuilder> createState() =>
      _ProductMenuTitleListBuilderState();
}

class _ProductMenuTitleListBuilderState
    extends State<ProductMenuTitleListBuilder> {
  final double _desiredItemWidth = 150;
  final double _fontSize = 16;
  final String _productRoute = '/product';

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ShopViewProductFilterViewModel>();
    return ResponsiveGridList(
        shrinkWrap: true,
        minSpacing: halfDefaultSize,
        desiredItemWidth: _desiredItemWidth,
        children: List.generate(
            widget.menuList!.length,
            (index) => UnderLineTextHover(
                isUnderLineHover: false,
                fontSize: _fontSize,
                title: widget.menuList![index],
                onTap: widget.onTap ?? (() => _onTap(state, index)))));
  }

  void _onTap(ShopViewProductFilterViewModel state, int index) {
    setState(() {
      state.setSelectedCategoryIndex = index;
    });
    context.go(_productRoute);
  }
}
