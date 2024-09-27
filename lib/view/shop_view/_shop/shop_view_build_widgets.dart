import 'package:new_weedus/export.dart';

class ShopViewBuildWidgets {
  static final double _responsiveSize = 1200;
  static final double _drawerWidth = 400;
  static final double _adminPanelButtonWidth = 165.0;
  static final int _flexValue = 5;

  static Widget adminPanelButton(BuildContext context) => Container(
      margin: const EdgeInsets.all(halfDefaultSize),
      width: _adminPanelButtonWidth,
      child: DrawerWidgets.testButton(context));

  static PreferredSizeWidget getAppBar(BuildContext context,
          CartState cartState, GlobalKey<ScaffoldState> scaffoldKey) =>
      CustomAppBar(
          scaffoldKey: scaffoldKey,
          cartState: cartState);

  static DrawerMenuView? menuDrawer(
          BuildContext context, CartState cartState,AuthState authState, ShopViewMixin mixin) =>
      context.width > _responsiveSize
          ? null
          : DrawerMenuView(context: context,
              cart: cartState, orderStatusTabTitle: mixin.orderStatus,authState: authState);

  static Widget body(BuildContext context,
          {ShopViewProductFilterViewModel? productFilterViewModel}) =>
      Row(children: [
        context.width <= _responsiveSize
            ? SizedBox.shrink()
            : _drawer(productFilterViewModel: productFilterViewModel),
        Expanded(flex: _flexValue, child: ShopProductView())
      ]);

  static Widget _drawer(
      {ShopViewProductFilterViewModel? productFilterViewModel}) {
    return Drawer(
      width: _drawerWidth,
      child: DrawerFilterMenuView(
        categoryOnTap: (index) {
          productFilterViewModel!.setSelectedCategoryIndex = index;
          productFilterViewModel.applyFilters();
        },
        onStrainChange: (strainTypes) async =>
            productFilterViewModel!.onStrainChange(strainTypes),
        onBrandChange: (brands) async =>
            productFilterViewModel!.onBrandChange(brands),
        onThcPotencyChange: (thcRange) async =>
            productFilterViewModel!.onThcPotencyChange(thcRange),
        onPriceRangeChange: (priceRange) async =>
            productFilterViewModel!.onPriceRangeChange(priceRange),
        onFlowerSizeChange: (sizes) async =>
            productFilterViewModel!.onFlowerSizeChange(sizes),
        onFlowerTypeChange: (types) async =>
            productFilterViewModel!.onFlowerTypeChange(types),
        onTerpenesChange: (terpenes) async =>
            productFilterViewModel!.onTerpenesChange(terpenes),
        // Pre-Roll Filters
        onPreRollBrandChange: (brands) async =>
            productFilterViewModel!.onPreRollBrandChange(brands),
        onPreRollStrainChange: (strainTypes) async =>
            productFilterViewModel!.onPreRollStrainChange(strainTypes),
        onPreRollThcPotencyChange: (thcRange) async =>
            productFilterViewModel!.onPreRollThcPotencyChange(thcRange),
        onPreRollPriceRangeChange: (priceRange) async =>
            productFilterViewModel!.onPreRollPriceRangeChange(priceRange),
        onPreRollSizeChange: (sizes) async =>
            productFilterViewModel!.onPreRollSizeChange(sizes),
        onPreRollTypeChange: (types) async =>
            productFilterViewModel!.onPreRollTypeChange(types),
        onPreRollTerpenesChange: (terpenes) async =>
            productFilterViewModel!.onPreRollTerpenesChange(terpenes),
        // Concentrates Filters
        onConcentratesBrandChange: (brands) async =>
            productFilterViewModel!.onConcentratesBrandChange(brands),
        onConcentratesThcPotencyChange: (thcRange) async =>
            productFilterViewModel!.onConcentratesThcPotencyChange(thcRange),
        onConcentratesPriceRangeChange: (priceRange) async =>
            productFilterViewModel!.onConcentratesPriceRangeChange(priceRange),
        onConcentratesSizeChange: (sizes) async =>
            productFilterViewModel!.onConcentratesSizeChange(sizes),
        onConcentratesTypeChange: (types) async =>
            productFilterViewModel!.onConcentratesTypeChange(types),
        onConcentratesMethodChange: (methods) async =>
            productFilterViewModel!.onConcentratesMethodChange(methods),
        onConcentratesTerpenesChange: (terpenes) async =>
            productFilterViewModel!.onConcentratesTerpenesChange(terpenes),
        onStrainTypeChange: (types) async =>
            productFilterViewModel!.onStrainTypeChange(types),
        // Vape Filters
        onVapeBrandChange: (brands) async =>
            productFilterViewModel!.onVapeBrandChange(brands),
        onVapeThcPotencyChange: (thcRange) async =>
            productFilterViewModel!.onVapeThcPotencyChange(thcRange),
        onVapeCbdPotencyChange: (cbdRange) async =>
            productFilterViewModel!.onVapeCbdPotencyChange(cbdRange),
        onVapePriceRangeChange: (priceRange) async =>
            productFilterViewModel!.onVapePriceRangeChange(priceRange),
        onVapeCbdRatioChange: (cbdRatios) async =>
            productFilterViewModel!.onVapeCbdRatioChange(cbdRatios),
        onVapeSizeChange: (sizes) async =>
            productFilterViewModel!.onVapeSizeChange(sizes),
        onVapeTypeChange: (types) async =>
            productFilterViewModel!.onVapeTypeChange(types),
        onVapeTerpenesChange: (terpenes) async =>
            productFilterViewModel!.onVapeTerpenesChange(terpenes),
        // Edibles Filters
        onEdiblesBrandChange: (brands) async =>
            productFilterViewModel!.onEdiblesBrandChange(brands),
        onEdiblesThcChange: (thcs) async =>
            productFilterViewModel!.onEdiblesThcChange(thcs),
        onEdiblesCbdChange: (cbds) async =>
            productFilterViewModel!.onEdiblesCbdChange(cbds),
        onEdiblesQuantityChange: (quantities) async =>
            productFilterViewModel!.onEdiblesQuantityChange(quantities),
        onEdiblesPriceRangeChange: (priceRange) async =>
            productFilterViewModel!.onEdiblesPriceRangeChange(priceRange),
        onEdiblesTypeChange: (types) async =>
            productFilterViewModel!.onEdiblesTypeChange(types),
        // Beverages Filters
        onBeveragesBrandChange: (brands) async =>
            productFilterViewModel!.onBeveragesBrandChange(brands),
        onBeveragesThcChange: (thcs) async =>
            productFilterViewModel!.onBeveragesThcChange(thcs),
        onBeveragesCbdChange: (cbds) async =>
            productFilterViewModel!.onBeveragesCbdChange(cbds),
        onBeveragesPriceRangeChange: (priceRange) async =>
            productFilterViewModel!.onBeveragesPriceRangeChange(priceRange),
        onBeveragesTypeChange: (types) async =>
            productFilterViewModel!.onBeveragesTypeChange(types),
        // Topicals Filters
        onTopicalsBrandChange: (brands) async =>
            productFilterViewModel!.onTopicalsBrandChange(brands),
        onTopicalsPriceRangeChange: (priceRange) async =>
            productFilterViewModel!.onTopicalsPriceRangeChange(priceRange),
        onTopicalsTypeChange: (types) async =>
            productFilterViewModel!.onTopicalsTypeChange(types),
        //  Tinctures Filters
        onTincturesBrandChange: (brands) async =>
            productFilterViewModel!.onTincturesBrandChange(brands),
        onTincturesThcPotencyChange: (thcRange) async =>
            productFilterViewModel!.onTincturesThcPotencyChange(thcRange),
        onTincturesCbdPotencyChange: (cbdRange) async =>
            productFilterViewModel!.onTincturesCbdPotencyChange(cbdRange),
        onTincturesPriceRangeChange: (priceRange) async =>
            productFilterViewModel!.onTincturesPriceRangeChange(priceRange),
        onTincturesTypeChange: (types) async =>
            productFilterViewModel!.onTincturesTypeChange(types),
        // Growing Filters
        onGrowingBrandChange: (brands) async =>
            productFilterViewModel!.onGrowingBrandChange(brands),
        onGrowingPriceRangeChange: (priceRange) async =>
            productFilterViewModel!.onGrowingPriceRangeChange(priceRange),
        //  CBD Filters
        onCbdBrandChange: (brands) async =>
            productFilterViewModel!.onCbdBrandChange(brands),
        onCbdPriceRangeChange: (priceRange) async =>
            productFilterViewModel!.onCbdPriceRangeChange(priceRange),
        onCbdTypeChange: (types) async =>
            productFilterViewModel!.onCbdTypeChange(types),
        // Accessories Filters
        onAccessoriesBrandChange: (brands) async =>
            productFilterViewModel!.onAccessoriesBrandChange(brands),
        onAccessoriesPriceRangeChange: (priceRange) async =>
            productFilterViewModel!.onAccessoriesPriceRangeChange(priceRange),
        onAccessoriesTypeChange: (types) async =>
            productFilterViewModel!.onAccessoriesTypeChange(types),
        //  Apparel Filters
        onApparelBrandChange: (brands) async =>
            productFilterViewModel!.onApparelBrandChange(brands),
        onApparelPriceRangeChange: (priceRange) async =>
            productFilterViewModel!.onApparelPriceRangeChange(priceRange),
        onApparelSizeChange: (sizes) async =>
            productFilterViewModel!.onApparelSizeChange(sizes),
      ),
    );
  }
}
