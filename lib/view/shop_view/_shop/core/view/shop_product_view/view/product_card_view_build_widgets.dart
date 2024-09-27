import 'package:new_weedus/_core/widgets/product_cards/vertical_product_card/test_vertical/test_vertical_card.dart';
import 'package:new_weedus/export.dart';

class ProductCardViewBuildWidgets {
  static final double _titleFontSize = 20;
  static final double _dropTitleFontSize = 16;
  static final double _minSpacing = defaultSize * 1.5;
  static final double _thickness = 0.3;
  static final double _desiredItemWidth = 290;

  static Column buildBody(bool isListView, ShopProductViewMixin mixin,
          {List<Product>? product,
          ShopViewProductFilterViewModel? productFilterViewModel}) =>
      Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            productTitle(product, productFilterViewModel!),
            dropDown(productFilterViewModel, mixin)
          ]),
          AppViewWidgets.appDivider(
              indent: doubleDefaultSize, endIndent: doubleDefaultSize),
          productFilterViewModel.isLoading
              ? _shimmer(isListView, productList: product)
              : isListView
                  ? _horizontalProductCard(product!)
                  : _verticalProductCard(product!)
        ],
      );

  static Container productTitle(List<Product>? product,
      ShopViewProductFilterViewModel productFilterViewModel) {
    return Container(
        margin: EdgeInsets.only(left: doubleDefaultSize),
        child: AppViewWidgets.textMontserrat(
            categoryList[productFilterViewModel.selectedCategoryIndex].title,
            fontWeight: FontWeight.w600,
            color: nero,
            fontSize: _titleFontSize));
  }

  static Padding dropDown(ShopViewProductFilterViewModel productFilterViewModel,
          ShopProductViewMixin mixin) =>
      Padding(
          padding: EdgeInsets.only(right: doubleDefaultSize),
          child: CustomDropDown(
              value: mixin.viewTypeValue,
              customHeights: mixin.getCustomItemsHeights(),
              items: mixin.viewTypeList.map((String items) {
                return DropdownMenuItem(value: items, child: _menuItems(items));
              }).toList(),
              onChanged: (String? newValue) =>
                  mixin.onChanged(newValue!, productFilterViewModel)));

  static Row _menuItems(String items) =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        AppViewWidgets.textMontserrat(items,
            fontSize: _dropTitleFontSize,
            fontWeight: FontWeight.w500,
            color: nero),
        SizedBox(width: defaultSize),
        Icon(items.contains('List') ? Icons.list_rounded : Icons.grid_view,
            color: nero)
      ]);

  static ListView _horizontalProductCard(List<Product> product) =>
      ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: doubleDefaultSize),
          itemBuilder: (context, index) =>
              HorizontalProductCardView(product: product[index]),
          separatorBuilder: (context, index) =>
              AppViewWidgets.appDivider(thickness: _thickness),
          itemCount: product.length);

  static Widget _verticalProductCard(List<Product> product) => Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: doubleDefaultSize - halfDefaultSize),
        child: ResponsiveGridList(
            shrinkWrap: true,
            minSpacing: halfDefaultSize,
            desiredItemWidth: 270, //_desiredItemWidth,
            children: List.generate(product.length,
                (index) => TestVerticalCard(product: product[index]))),
      );

  static Widget _shimmer(bool isListView, {List<Product>? productList}) {
    return isListView
        ? ShimmerHorizontalCard(productList: productList!)
        : ShimmerVerticalCard(productList: productList!);
  }
}
