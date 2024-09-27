import 'package:new_weedus/export.dart';

class ShopProductView extends StatefulWidget {
  ShopProductView({Key? key}) : super(key: key);

  @override
  State<ShopProductView> createState() => _ShopProductViewState();
}

class _ShopProductViewState extends State<ShopProductView>
    with ShopProductViewMixin {
  @override
  Widget build(BuildContext context) {
    ShopViewProductFilterViewModel productFilterViewModel =
        context.watch<ShopViewProductFilterViewModel>();
    final product =
        productFilterViewModel.filteredProducts(productFilterViewModel);
    return Center(
      child: CustomScrollView(
        slivers: [
          SliverPadding(
              padding: EdgeInsets.symmetric(vertical: defaultSize * 5),
              sliver: SliverToBoxAdapter(
                  child: ProductCardViewBuildWidgets.buildBody(isListView, this,
                      product: product,
                      productFilterViewModel: productFilterViewModel)))
        ],
      ),
    );
  }
}
