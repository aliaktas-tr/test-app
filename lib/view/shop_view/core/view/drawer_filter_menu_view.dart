/*
import 'package:new_weedus/export.dart';

class DrawerFilterMenuView extends StatelessWidget {
  const DrawerFilterMenuView(
      {super.key, required this.categoryOnTap, required this.strainTypeOnTap});

  final Function(int) categoryOnTap;
  final Function(int) strainTypeOnTap;
  final String _categoryTitle = 'Categories';
  final String _filterTitle = 'Filter result by:';
  final double _categoryTitleFontSize = 20;
  final double _filterTitleFontSize = 16;

  @override
  Widget build(BuildContext context) {
    var state = context.watch<ShopState>();
    return Container(
        height: double.infinity, color: white, child: _leftSideMenu(state));
  }

  Widget _leftSideMenu(ShopState state) {
    return ListView(
      primary: false,
      children: [
        Container(
            padding: EdgeInsets.fromLTRB(doubleDefaultSize, defaultSize * 1.9,
                doubleDefaultSize, doubleDefaultSize),
            child: _menu(state.pageIndex, state: state)),
      ],
    );
  }

  Widget _menu(int index,  {ShopState? state}) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppViewWidgets.textMontserrat(_categoryTitle,
              color: nero,
              fontSize: _categoryTitleFontSize,
              fontWeight: FontWeight.w600),
          SizedBox(height: defaultSize * 1.4),
          _categoryBoxGrid(state),
          AppViewWidgets.appDivider(),
          AppViewWidgets.textMontserrat(_filterTitle,
              fontWeight: FontWeight.w500, fontSize: _filterTitleFontSize),
          SizedBox(height: doubleDefaultSize),
         // _strainTypeGrid(state),
           _getStrainFilterMenu(index),
          _getMenu(index)
        ]);
  }

  GridView _categoryBoxGrid(ShopState? state) {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: categoryList.length,
        gridDelegate: _gridDelegate,
        itemBuilder: (context, index) => _getItemBuilder(index, state: state));
  }

  SliverGridDelegate get _gridDelegate =>
      SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: halfDefaultSize,
          mainAxisSpacing: halfDefaultSize,
          childAspectRatio: 4.7);

  Widget _getItemBuilder(int index, {ShopState? state}) {
    return AppViewWidgets.customInkWell(
      onTap: () => categoryOnTap(index),
      child: AppViewWidgets.typeCategoryBoxWidget(categoryList[index].title,
          inFilterMenu: true,
          fontSize: _filterTitleFontSize,
          state: state,
          index: index),
    );
  }



  Widget _getStrainFilterMenu(int index) {
    if (index == 6 ||
        index == 7 ||
        index == 8 ||
        index == 9 ||
        index == 10 ||
        index == 11) {
      return SizedBox.shrink();
    } else {
      return StrainFilterMenu();
    }
  }

  Widget _getMenu(int index) {
    switch (index) {
      case 0:
        return FlowerFilterMenu();

      case 1:
        return PreRollFilterMenu();
      case 2:
        return ConcentratesFilterMenu();
      case 3:
        return VaporizersFilterMenu();
      case 4:
        return EdiblesFilterMenu();
      case 5:
        return BeveragesFilterMenu();
      case 6:
        return TopicalFilterMenu();
      case 7:
        return TincturesFilterMenu();
      case 8:
        return GrowingFilterMenu();
      case 9:
        return CBDFilterMenu();
      case 10:
        return AccessoriesFilterMenu();
      case 11:
        return ApparelFilterMenu();
      default:
        return FlowerFilterMenu();
    }
  }
}
*/


import 'package:new_weedus/export.dart';

class DrawerFilterMenuView extends StatelessWidget {
  final Function(int) categoryOnTap;
  final String _categoryTitle = 'Categories';
  final String _filterTitle = 'Filter result by:';
  final double _categoryTitleFontSize = 20;
  final double _filterTitleFontSize = 16;

  // Callbacks for filter changes
  final void Function(List<bool>) onBrandChange;
  final void Function(RangeValues) onThcPotencyChange;
  final void Function(RangeValues) onPriceRangeChange;
  final void Function(List<bool>) onFlowerSizeChange;
  final void Function(List<bool>) onStrainChange;
  final void Function(List<bool>) onFlowerTypeChange;
  final void Function(List<bool>) onTerpenesChange;

  ///preroll
  final void Function(List<bool>) onPreRollBrandChange;
  final void Function(RangeValues) onPreRollThcPotencyChange;
  final void Function(RangeValues) onPreRollPriceRangeChange;
  final void Function(List<bool>) onPreRollSizeChange;
  final void Function(List<bool>) onPreRollStrainChange;
  final void Function(List<bool>) onPreRollTypeChange;
  final void Function(List<bool>) onPreRollTerpenesChange;

  /// concentrates
  final void Function(List<bool>) onConcentratesBrandChange;
  final void Function(RangeValues) onConcentratesThcPotencyChange;
  final void Function(RangeValues) onConcentratesPriceRangeChange;
  final void Function(List<bool>) onConcentratesSizeChange;
  final void Function(List<bool>) onConcentratesTypeChange;
  final void Function(List<bool>) onStrainTypeChange;
  final void Function(List<bool>) onConcentratesMethodChange;
  final void Function(List<bool>) onConcentratesTerpenesChange;

  ///vaporizers
  final void Function(List<bool>) onVapeBrandChange;
  final void Function(RangeValues) onVapeThcPotencyChange;
  final void Function(RangeValues) onVapeCbdPotencyChange;
  final void Function(RangeValues) onVapePriceRangeChange;
  final void Function(List<bool>) onVapeCbdRatioChange;
  final void Function(List<bool>) onVapeSizeChange;
  final void Function(List<bool>) onVapeTypeChange;
  final void Function(List<bool>) onVapeTerpenesChange;

  ///edibles
  final void Function(List<bool>) onEdiblesBrandChange;
  final void Function(List<bool>) onEdiblesThcChange;
  final void Function(List<bool>) onEdiblesCbdChange;
  final void Function(List<bool>) onEdiblesQuantityChange;
  final void Function(RangeValues) onEdiblesPriceRangeChange;
  final void Function(List<bool>) onEdiblesTypeChange;

  ///beverages
  final void Function(List<bool>) onBeveragesBrandChange;
  final void Function(List<bool>) onBeveragesThcChange;
  final void Function(List<bool>) onBeveragesCbdChange;
  final void Function(RangeValues) onBeveragesPriceRangeChange;
  final void Function(List<bool>) onBeveragesTypeChange;

  ///topicals
  final void Function(List<bool>) onTopicalsBrandChange;
  final void Function(RangeValues) onTopicalsPriceRangeChange;
  final void Function(List<bool>) onTopicalsTypeChange;

  ///tinctures
  final void Function(List<bool>) onTincturesBrandChange;
  final void Function(RangeValues) onTincturesThcPotencyChange;
  final void Function(RangeValues) onTincturesCbdPotencyChange;
  final void Function(RangeValues) onTincturesPriceRangeChange;
  final void Function(List<bool>) onTincturesTypeChange;

  ///growing
  final void Function(List<bool>) onGrowingBrandChange;
  final void Function(RangeValues) onGrowingPriceRangeChange;

  ///cbd
  final void Function(List<bool>) onCbdBrandChange;
  final void Function(RangeValues) onCbdPriceRangeChange;
  final void Function(List<bool>) onCbdTypeChange;

  ///accessories
  final void Function(List<bool>) onAccessoriesBrandChange;
  final void Function(RangeValues) onAccessoriesPriceRangeChange;
  final void Function(List<bool>) onAccessoriesTypeChange;

  ///apparel
  final void Function(List<bool>) onApparelBrandChange;
  final void Function(RangeValues) onApparelPriceRangeChange;
  final void Function(List<bool>) onApparelSizeChange;

  const DrawerFilterMenuView({
    super.key,
    required this.categoryOnTap,
    required this.onBrandChange,
    required this.onThcPotencyChange,
    required this.onPriceRangeChange,
    required this.onFlowerSizeChange,
    required this.onFlowerTypeChange,
    required this.onTerpenesChange,
    required this.onStrainChange,
    required this.onPreRollBrandChange,
    required this.onPreRollThcPotencyChange,
    required this.onPreRollPriceRangeChange,
    required this.onPreRollSizeChange,
    required this.onPreRollTypeChange,
    required this.onPreRollTerpenesChange,
    required this.onPreRollStrainChange,
    required this.onConcentratesBrandChange,
    required this.onConcentratesThcPotencyChange,
    required this.onConcentratesPriceRangeChange,
    required this.onConcentratesSizeChange,
    required this.onConcentratesTypeChange,
    required this.onConcentratesMethodChange,
    required this.onConcentratesTerpenesChange,
    required this.onStrainTypeChange,
    required this.onVapeBrandChange,
    required this.onVapeThcPotencyChange,
    required this.onVapeCbdPotencyChange,
    required this.onVapePriceRangeChange,
    required this.onVapeCbdRatioChange,
    required this.onVapeSizeChange,
    required this.onVapeTypeChange,
    required this.onVapeTerpenesChange,
    required this.onEdiblesBrandChange,
    required this.onEdiblesThcChange,
    required this.onEdiblesCbdChange,
    required this.onEdiblesQuantityChange,
    required this.onEdiblesPriceRangeChange,
    required this.onEdiblesTypeChange,
    required this.onBeveragesBrandChange,
    required this.onBeveragesThcChange,
    required this.onBeveragesCbdChange,
    required this.onBeveragesPriceRangeChange,
    required this.onBeveragesTypeChange,
    required this.onTopicalsBrandChange,
    required this.onTopicalsPriceRangeChange,
    required this.onTopicalsTypeChange,
    required this.onTincturesBrandChange,
    required this.onTincturesThcPotencyChange,
    required this.onTincturesCbdPotencyChange,
    required this.onTincturesPriceRangeChange,
    required this.onTincturesTypeChange,
    required this.onGrowingBrandChange,
    required this.onGrowingPriceRangeChange, required this.onCbdBrandChange, required this.onCbdPriceRangeChange, required this.onCbdTypeChange, required this.onAccessoriesBrandChange, required this.onAccessoriesPriceRangeChange, required this.onAccessoriesTypeChange, required this.onApparelBrandChange, required this.onApparelPriceRangeChange, required this.onApparelSizeChange,
  });

  @override
  Widget build(BuildContext context) {
    var state = context.watch<ShopViewProductFilterViewModel>();
    return Container(
        height: double.infinity,
        color: white,
        child: _leftSideMenu(context, state));
  }

  Widget _leftSideMenu(BuildContext context, ShopViewProductFilterViewModel state) {
    return ListView(
      primary: false,
      children: [
        Container(
            padding: EdgeInsets.fromLTRB(doubleDefaultSize, defaultSize * 1.9,
                doubleDefaultSize, doubleDefaultSize),
            child: _menu(context, state.selectedCategoryIndex, state: state)),
      ],
    );
  }

  Widget _menu(BuildContext context, int index, {ShopViewProductFilterViewModel? state}) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppViewWidgets.textMontserrat(_categoryTitle,
              color: nero,
              fontSize: _categoryTitleFontSize,
              fontWeight: FontWeight.w600),
          SizedBox(height: defaultSize * 1.4),
          _categoryBoxGrid(state),
          AppViewWidgets.appDivider(),
          AppViewWidgets.textMontserrat(_filterTitle,
              fontWeight: FontWeight.w500, fontSize: _filterTitleFontSize),
          SizedBox(height: doubleDefaultSize),
          _getFilterMenu(context, index)
        ]);
  }

  GridView _categoryBoxGrid(ShopViewProductFilterViewModel? state) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: categoryList.length,
        gridDelegate: _gridDelegate,
        itemBuilder: (context, index) => _getItemBuilder(index, state: state));
  }

  SliverGridDelegate get _gridDelegate =>
      const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: halfDefaultSize,
          mainAxisSpacing: halfDefaultSize,
          childAspectRatio: 4.7);

  Widget _getItemBuilder(int index, {ShopViewProductFilterViewModel? state}) {
    return AppViewWidgets.customInkWell(
      onTap: () => categoryOnTap(index),
      child: AppViewWidgets.typeCategoryBoxWidget(categoryList[index].title,
          inFilterMenu: true,
          fontSize: _filterTitleFontSize,
          state: state,
          index: index),
    );
  }

  Widget _getFilterMenu(BuildContext context, int index) {
    switch (index) {
      case 0:
        return FlowerFilterMenu(
          onBrandChange: onBrandChange,
          onThcPotencyChange: onThcPotencyChange,
          onPriceRangeChange: onPriceRangeChange,
          onFlowerSizeChange: onFlowerSizeChange,
          onFlowerTypeChange: onFlowerTypeChange,
          onTerpenesChange: onTerpenesChange,
          onStrainChange: onStrainChange,
        );
      case 1:
        return PreRollFilterMenu(
          onBrandChange: onPreRollBrandChange,
          onThcPotencyChange: onPreRollThcPotencyChange,
          onPriceRangeChange: onPreRollPriceRangeChange,
          onPreRollStrainChange: onPreRollStrainChange,
          onPreRollSizeChange: onPreRollSizeChange,
          onPreRollTypeChange: onPreRollTypeChange,
          onTerpenesChange: onPreRollTerpenesChange,
        );
      case 2:
        return ConcentratesFilterMenu(
          onBrandChange: onConcentratesBrandChange,
          onThcPotencyChange: onConcentratesThcPotencyChange,
          onPriceRangeChange: onConcentratesPriceRangeChange,
          onConcentratesSizeChange: onConcentratesSizeChange,
          onConcentratesTypeChange: onConcentratesTypeChange,
          onConcentratesMethodChange: onConcentratesMethodChange,
          onStrainTypeChange: onStrainTypeChange,
          onTerpenesChange: onConcentratesTerpenesChange,
        );
      case 3:
        return VaporizersFilterMenu(
          onBrandChange: onVapeBrandChange,
          onThcPotencyChange: onVapeThcPotencyChange,
          onCbdPotencyChange: onVapeCbdPotencyChange,
          onPriceRangeChange: onVapePriceRangeChange,
          onVapeCbdRatioChange: onVapeCbdRatioChange,
          onVapeSizeChange: onVapeSizeChange,
          onVapeTypeChange: onVapeTypeChange,
          onTerpenesChange: onVapeTerpenesChange,
        );
      case 4:
        return EdiblesFilterMenu(
          onBrandChange: onEdiblesBrandChange,
          onEdiblesThcChange: onEdiblesThcChange,
          onEdiblesCbdChange: onEdiblesCbdChange,
          onEdiblesQuantityChange: onEdiblesQuantityChange,
          onPriceRangeChange: onEdiblesPriceRangeChange,
          onEdiblesTypeChange: onEdiblesTypeChange,
        );
      case 5: // Beverages
        return BeveragesFilterMenu(
          onBrandChange: onBeveragesBrandChange,
          onBeveragesThcChange: onBeveragesThcChange,
          onBeveragesCbdChange: onBeveragesCbdChange,
          onPriceRangeChange: onBeveragesPriceRangeChange,
          onBeveragesTypeChange: onBeveragesTypeChange,
        );
      case 6: // Topicals
        return TopicalFilterMenu(
          onBrandChange: onTopicalsBrandChange,
          // TopicalFilterMenu için geri çağırmaları kullanın
          onPriceRangeChange: onTopicalsPriceRangeChange,
          onTopicalsTypeChange: onTopicalsTypeChange,
        );
      case 7: // Tinctures
        return TincturesFilterMenu(
          onBrandChange: onTincturesBrandChange,
          onThcPotencyChange: onTincturesThcPotencyChange,
          onCbdPotencyChange: onTincturesCbdPotencyChange,
          onPriceRangeChange: onTincturesPriceRangeChange,
          onTincturesTypeChange: onTincturesTypeChange,
        );
      case 8: // Growing
        return GrowingFilterMenu(
          onBrandChange: onGrowingBrandChange,
          onPriceRangeChange: onGrowingPriceRangeChange,
        );
      case 9: // CBD
        return CBDFilterMenu(
          onBrandChange: onCbdBrandChange,
          onPriceRangeChange: onCbdPriceRangeChange,
          onCbdTypeChange: onCbdTypeChange,
        );
      case 10: // Accessories
        return AccessoriesFilterMenu(
          onBrandChange: onAccessoriesBrandChange,
          onPriceRangeChange: onAccessoriesPriceRangeChange,
          onAccessoriesTypeChange: onAccessoriesTypeChange,
        );
      case 11: // Apparel
        return ApparelFilterMenu(
          onBrandChange: onApparelBrandChange,
          onPriceRangeChange: onApparelPriceRangeChange,
          onApparelSizeChange: onApparelSizeChange,
        );
      default:
        return Container();
    }
  }
}
