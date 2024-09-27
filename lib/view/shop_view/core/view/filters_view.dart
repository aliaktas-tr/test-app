import 'package:new_weedus/export.dart';

Widget get _appDivider => AppViewWidgets.appDivider();

class FlowerFilterMenu extends StatefulWidget {
  const FlowerFilterMenu(
      {super.key,
      required this.onBrandChange,
      required this.onThcPotencyChange,
      required this.onPriceRangeChange,
      required this.onFlowerSizeChange,
      required this.onStrainChange,
      required this.onFlowerTypeChange,
      required this.onTerpenesChange});

  final ValueChanged<List<bool>> onBrandChange;
  final ValueChanged<RangeValues> onThcPotencyChange;
  final ValueChanged<RangeValues> onPriceRangeChange;
  final ValueChanged<List<bool>> onFlowerSizeChange;
  final ValueChanged<List<bool>> onStrainChange;
  final ValueChanged<List<bool>> onFlowerTypeChange;
  final ValueChanged<List<bool>> onTerpenesChange;

  @override
  State<FlowerFilterMenu> createState() => _FlowerFilterMenuState();

  void onFilterChange(_FlowerFilterMenuState state) {
    onBrandChange(state._isBrandChecked);
    onThcPotencyChange(state._thcRange);
    onPriceRangeChange(state._priceRange);
    onFlowerSizeChange(state._isFlowerSizeChecked);
    onStrainChange(state._isStrainTypeChecked);
    onFlowerTypeChange(state._isFlowerTypeChecked);
    onTerpenesChange(state._isTerpenesChecked);
  }
}

class _FlowerFilterMenuState extends State<FlowerFilterMenu> {
  List<bool> _isBrandChecked = List<bool>.filled(_flowerBrands.length, false);
  List<bool> _isFlowerSizeChecked =
      List<bool>.filled(_flowerSizeList.length, false);
  List<bool> _isFlowerTypeChecked =
      List<bool>.filled(_flowerTypeList.length, false);
  List<bool> _isTerpenesChecked =
      List<bool>.filled(_flowerTerpenesList.length, false);
  List<bool> _isStrainTypeChecked =
      List<bool>.filled(_strainType.length, false);

  RangeValues _priceRange = const RangeValues(20, 270);
  RangeValues _thcRange = const RangeValues(10, 50);

  String _brandTitle = 'Brand';
  String _priceRangeTitle = 'Price Range';
  String _sizeTitle = 'Size';
  String _thcTitle = 'THC Potency';
  String _strainTypeTitle = 'Strain Type';
  String _flowerTypeTitle = 'Flower  Type';
  String _terpenesTitle = 'Terpenes';
  int _minPriceRange = 20;
  int _maxPriceRange = 270;
  int _minThcPotencyRange = 10;
  int _maxThcPotencyRange = 50;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _BuildProductFilterExpandableHeader(
          headerTitle: _brandTitle,
          value: _isBrandChecked,
          text: _flowerBrands,
          initialExpanded: true,
          onValueChange: (newValue) => setState(() {
                _isBrandChecked = newValue as List<bool>;
                widget.onFilterChange(this);
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _strainTypeTitle,
          value: _isStrainTypeChecked,
          text: _strainType,
          initialExpanded: true,
          onValueChange: (newValue) => setState(() {
                _isStrainTypeChecked = newValue as List<bool>;
                widget.onFilterChange(this);
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _sizeTitle,
          value: _isFlowerSizeChecked,
          text: _flowerSizeList,
          initialExpanded: true,
          onValueChange: (newValue) => setState(() {
                _isFlowerSizeChecked = newValue as List<bool>;
                widget.onFilterChange(this);
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _flowerTypeTitle,
          value: _isFlowerTypeChecked,
          text: _flowerTypeList,
          onValueChange: (newValue) => setState(() {
                _isFlowerTypeChecked = newValue as List<bool>;
                widget.onFilterChange(this);
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _terpenesTitle,
          value: _isTerpenesChecked,
          text: _flowerTerpenesList,
          onValueChange: (newValue) => setState(() {
                _isTerpenesChecked = newValue as List<bool>;
                widget.onFilterChange(this);
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _thcTitle,
          isSliderWidget: true,
          isPriceRange: false,
          min: _minThcPotencyRange,
          max: _maxThcPotencyRange,
          initialValue: _thcRange,
          onValueChange: (newValue) => setState(() {
                _thcRange = newValue as RangeValues;
                widget.onFilterChange(this);
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _priceRangeTitle,
          isSliderWidget: true,
          min: _minPriceRange,
          max: _maxPriceRange,
          initialValue: _priceRange,
          onValueChange: (newValue) => setState(() {
                _priceRange = newValue as RangeValues;
                widget.onFilterChange(this);
              }))
    ]);
  }
}

class PreRollFilterMenu extends StatefulWidget {
  final ValueChanged<List<bool>> onBrandChange;
  final ValueChanged<RangeValues> onThcPotencyChange;
  final ValueChanged<RangeValues> onPriceRangeChange;
  final ValueChanged<List<bool>> onPreRollSizeChange;
  final ValueChanged<List<bool>> onPreRollStrainChange;
  final ValueChanged<List<bool>> onPreRollTypeChange;
  final ValueChanged<List<bool>> onTerpenesChange;

  const PreRollFilterMenu(
      {super.key,
      required this.onBrandChange,
      required this.onThcPotencyChange,
      required this.onPriceRangeChange,
      required this.onPreRollSizeChange,
      required this.onPreRollTypeChange,
      required this.onTerpenesChange,
      required this.onPreRollStrainChange});

  @override
  State<PreRollFilterMenu> createState() => _PreRollFilterMenuState();

  void onFilterChange(_PreRollFilterMenuState state) {
    onBrandChange(state._isBrandChecked);
    onThcPotencyChange(state._thcRange);
    onPriceRangeChange(state._priceRange);
    onPreRollSizeChange(state._isPreRollSizeChecked);
    onPreRollStrainChange(state._isPreRollStrainChecked);
    onPreRollTypeChange(state._isPreRollTypeChecked);
    onTerpenesChange(state._isTerpenesChecked);
  }
}

class _PreRollFilterMenuState extends State<PreRollFilterMenu> {
  List<bool> _isBrandChecked = List<bool>.filled(_preRollBrands.length, false);
  List<bool> _isPreRollSizeChecked =
      List<bool>.filled(_preRollSizeList.length, false);
  List<bool> _isPreRollTypeChecked =
      List<bool>.filled(_preRollTypeList.length, false);
  List<bool> _isTerpenesChecked =
      List<bool>.filled(_preRollTerpenesList.length, false);
  RangeValues _priceRange = const RangeValues(10, 100);
  RangeValues _thcRange = const RangeValues(10, 50);
  List<bool> _isPreRollStrainChecked =
      List<bool>.filled(_strainType.length, false);

  String _brandTitle = 'Brand';
  String _priceRangeTitle = 'Price Range';
  String _sizeTitle = 'Size';
  String _thcTitle = 'THC Potency';
  String _strainTypeTitle = 'Strain Type';
  String _preRollTypeTitle = 'Pre-Roll  Type';
  String _terpenesTitle = 'Terpenes';
  int _minPriceRange = 10;
  int _maxPriceRange = 100;
  int _minThcPotencyRange = 10;
  int _maxThcPotencyRange = 50;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _BuildProductFilterExpandableHeader(
          headerTitle: _brandTitle,
          value: _isBrandChecked,
          text: _preRollBrands,
          initialExpanded: true,
          onValueChange: (newValue) => setState(() {
                _isBrandChecked = newValue as List<bool>;
                widget.onFilterChange(this);
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _strainTypeTitle,
          value: _isPreRollStrainChecked,
          text: _strainType,
          initialExpanded: true,
          onValueChange: (newValue) => setState(() {
                _isPreRollStrainChecked = newValue as List<bool>;
                widget.onFilterChange(this);
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _sizeTitle,
          value: _isPreRollSizeChecked,
          text: _preRollSizeList,
          initialExpanded: true,
          onValueChange: (newValue) => setState(() {
                _isPreRollSizeChecked = newValue as List<bool>;
                widget.onFilterChange(this);
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _preRollTypeTitle,
          value: _isPreRollTypeChecked,
          text: _preRollTypeList,
          onValueChange: (newValue) => setState(() {
                _isPreRollTypeChecked = newValue as List<bool>;
                widget.onFilterChange(this);
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _terpenesTitle,
          value: _isTerpenesChecked,
          text: _preRollTerpenesList,
          onValueChange: (newValue) => setState(() {
                _isTerpenesChecked = newValue as List<bool>;
                widget.onFilterChange(this);
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _thcTitle,
          isSliderWidget: true,
          isPriceRange: false,
          min: _minThcPotencyRange,
          max: _maxThcPotencyRange,
          initialValue: _thcRange,
          onValueChange: (newValue) => setState(() {
                _thcRange = newValue as RangeValues;
                widget.onFilterChange(this);
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _priceRangeTitle,
          isSliderWidget: true,
          min: _minPriceRange,
          max: _maxPriceRange,
          initialValue: _priceRange,
          onValueChange: (newValue) => setState(() {
                _priceRange = newValue as RangeValues;
                widget.onFilterChange(this);
              }))
    ]);
  }
}

class ConcentratesFilterMenu extends StatefulWidget {
  final ValueChanged<List<bool>> onBrandChange;
  final ValueChanged<RangeValues> onThcPotencyChange;
  final ValueChanged<RangeValues> onPriceRangeChange;
  final ValueChanged<List<bool>> onConcentratesSizeChange;
  final ValueChanged<List<bool>> onConcentratesTypeChange;
  final ValueChanged<List<bool>> onConcentratesMethodChange;
  final ValueChanged<List<bool>> onTerpenesChange;
  final ValueChanged<List<bool>> onStrainTypeChange;

  const ConcentratesFilterMenu(
      {Key? key,
      required this.onBrandChange,
      required this.onThcPotencyChange,
      required this.onPriceRangeChange,
      required this.onConcentratesSizeChange,
      required this.onConcentratesTypeChange,
      required this.onConcentratesMethodChange,
      required this.onTerpenesChange,
      required this.onStrainTypeChange})
      : super(key: key);

  @override
  _ConcentratesFilterMenuState createState() => _ConcentratesFilterMenuState();

  void onFilterChange(_ConcentratesFilterMenuState state) {
    onBrandChange(state._isBrandChecked);
    onThcPotencyChange(state._thcRange);
    onPriceRangeChange(state._priceRange);
    onConcentratesSizeChange(state._isConcentratesSizeChecked);
    onConcentratesTypeChange(state._isConcentratesTypeChecked);
    onConcentratesMethodChange(state._isConcentratesMethodChecked);
    onTerpenesChange(state._isTerpenesChecked);
    onStrainTypeChange(state._isStrainTypeChecked);
  }
}

class _ConcentratesFilterMenuState extends State<ConcentratesFilterMenu> {
  List<bool> _isBrandChecked =
      List<bool>.filled(_concentratesBrands.length, false);
  List<bool> _isConcentratesSizeChecked =
      List<bool>.filled(_concentratesSizeList.length, false);
  List<bool> _isConcentratesTypeChecked =
      List<bool>.filled(_concentratesTypeList.length, false);
  List<bool> _isConcentratesMethodChecked =
      List<bool>.filled(_concentratesExtractionMethod.length, false);
  List<bool> _isTerpenesChecked =
      List<bool>.filled(_concentratesTerpenesList.length, false);
  List<bool> _isStrainTypeChecked = List<bool>.filled(_typeList.length, false);
  RangeValues _priceRange = const RangeValues(20, 150);
  RangeValues _thcRange = const RangeValues(50, 90);
  String _brandTitle = 'Brand';
  String _priceRangeTitle = 'Price Range';
  String _sizeTitle = 'Size';
  String _thcTitle = 'THC Potency';
  String _typeTitle = 'Concentrate Type';
  String _extractionMethodTitle = 'Extraction Method';
  String _terpenesTitle = 'Terpenes';
  int _minPriceRange = 20;
  int _maxPriceRange = 150;
  int _minThcPotencyRange = 50;
  int _maxThcPotencyRange = 90;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _BuildProductFilterExpandableHeader(
          headerTitle: _brandTitle,
          value: _isBrandChecked,
          text: _concentratesBrands,
          initialExpanded: true,
          onValueChange: (newValue) => setState(() {
                _isBrandChecked = newValue as List<bool>;
                widget.onFilterChange(this);
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _typeTitle,
          value: _isStrainTypeChecked,
          text: _typeList,
          initialExpanded: true,
          onValueChange: (newValue) => setState(() {
                _isStrainTypeChecked = newValue as List<bool>;
                widget.onFilterChange(this);
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _sizeTitle,
          value: _isConcentratesSizeChecked,
          text: _concentratesSizeList,
          initialExpanded: true,
          onValueChange: (newValue) => setState(() {
                _isConcentratesSizeChecked = newValue as List<bool>;
                widget.onFilterChange(this);
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _typeTitle,
          value: _isConcentratesTypeChecked,
          text: _concentratesTypeList,
          onValueChange: (newValue) => setState(() {
                _isConcentratesTypeChecked = newValue as List<bool>;
                widget.onFilterChange(this);
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _extractionMethodTitle,
          value: _isConcentratesMethodChecked,
          text: _concentratesExtractionMethod,
          onValueChange: (newValue) => setState(() {
                _isConcentratesMethodChecked = newValue as List<bool>;
                widget.onFilterChange(this);
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _terpenesTitle,
          value: _isTerpenesChecked,
          text: _concentratesTerpenesList,
          onValueChange: (newValue) => setState(() {
                _isTerpenesChecked = newValue as List<bool>;
                widget.onFilterChange(this);
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _thcTitle,
          isSliderWidget: true,
          isPriceRange: false,
          min: _minThcPotencyRange,
          max: _maxThcPotencyRange,
          initialValue: _thcRange,
          onValueChange: (newValue) => setState(() {
                _thcRange = newValue as RangeValues;
                widget.onFilterChange(this);
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _priceRangeTitle,
          isSliderWidget: true,
          min: _minPriceRange,
          max: _maxPriceRange,
          initialValue: _priceRange,
          onValueChange: (newValue) => setState(() {
                _priceRange = newValue as RangeValues;
                widget.onFilterChange(this);
              }))
    ]);
  }
}

class VaporizersFilterMenu extends StatefulWidget {
  final ValueChanged<List<bool>> onBrandChange;
  final ValueChanged<RangeValues> onThcPotencyChange;
  final ValueChanged<RangeValues> onCbdPotencyChange;
  final ValueChanged<RangeValues> onPriceRangeChange;
  final ValueChanged<List<bool>> onVapeCbdRatioChange;
  final ValueChanged<List<bool>> onVapeSizeChange;
  final ValueChanged<List<bool>> onVapeTypeChange;
  final ValueChanged<List<bool>> onTerpenesChange;

  const VaporizersFilterMenu({
    Key? key,
    required this.onBrandChange,
    required this.onThcPotencyChange,
    required this.onCbdPotencyChange,
    required this.onPriceRangeChange,
    required this.onVapeCbdRatioChange,
    required this.onVapeSizeChange,
    required this.onVapeTypeChange,
    required this.onTerpenesChange,
  }) : super(key: key);

  @override
  _VaporizersFilterMenuState createState() => _VaporizersFilterMenuState();
}

class _VaporizersFilterMenuState extends State<VaporizersFilterMenu> {
  List<bool> _isBrandChecked = List<bool>.filled(_vapeBrands.length, false);
  List<bool> _isVapeSizeChecked =
      List<bool>.filled(_vapeSizeList.length, false);
  List<bool> _isVapeTypeChecked =
      List<bool>.filled(_vapeTypeList.length, false);
  List<bool> _isVapeCBDRatioChecked =
      List<bool>.filled(_vapeCBDRatioList.length, false);
  List<bool> _isTerpenesChecked =
      List<bool>.filled(_vapeTerpenesList.length, false);
  RangeValues _priceRange = const RangeValues(30, 150);
  RangeValues _thcRange = const RangeValues(20, 90);
  RangeValues _cbdRange = const RangeValues(0, 70);

  String _brandTitle = 'Brand';
  String _priceRangeTitle = 'Price Range';
  String _cbdTitle = 'CBD Potency';
  String _cbdRatioTitle = 'CBD Ratio';
  String _sizeTitle = 'Size';
  String _thcTitle = 'THC Potency';
  String _vapeTypeTitle = 'Vape Type';
  String _terpenesTitle = 'Terpenes';
  int _minPriceRange = 30;
  int _maxPriceRange = 150;
  int _minCbdPotencyRange = 0;
  int _maxCbdPotencyRange = 70;
  int _minThcPotencyRange = 20;
  int _maxThcPotencyRange = 90;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _BuildProductFilterExpandableHeader(
          headerTitle: _brandTitle,
          value: _isBrandChecked,
          text: _vapeBrands,
          initialExpanded: true,
          onValueChange: (newValue) => setState(() {
                _isBrandChecked = newValue as List<bool>;
                _onFilterChange();
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _thcTitle,
          isSliderWidget: true,
          isPriceRange: false,
          min: _minThcPotencyRange,
          max: _maxThcPotencyRange,
          initialValue: _thcRange,
          onValueChange: (newValue) => setState(() {
                _thcRange = newValue as RangeValues;
                _onFilterChange();
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _cbdTitle,
          isSliderWidget: true,
          isPriceRange: false,
          min: _minCbdPotencyRange,
          max: _maxCbdPotencyRange,
          initialValue: _cbdRange,
          onValueChange: (newValue) => setState(() {
                _cbdRange = newValue as RangeValues;
                _onFilterChange();
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _priceRangeTitle,
          isSliderWidget: true,
          min: _minPriceRange,
          max: _maxPriceRange,
          initialValue: _priceRange,
          onValueChange: (newValue) => setState(() {
                _priceRange = newValue as RangeValues;
                _onFilterChange();
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _cbdRatioTitle,
          value: _isVapeCBDRatioChecked,
          text: _vapeCBDRatioList,
          onValueChange: (newValue) => setState(() {
                _isVapeCBDRatioChecked = newValue as List<bool>;
                _onFilterChange();
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _sizeTitle,
          value: _isVapeSizeChecked,
          text: _vapeSizeList,
          onValueChange: (newValue) => setState(() {
                _isVapeSizeChecked = newValue as List<bool>;
                _onFilterChange();
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _vapeTypeTitle,
          value: _isVapeTypeChecked,
          text: _vapeTypeList,
          onValueChange: (newValue) => setState(() {
                _isVapeTypeChecked = newValue as List<bool>;
                _onFilterChange();
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _terpenesTitle,
          value: _isTerpenesChecked,
          text: _vapeTerpenesList,
          onValueChange: (newValue) => setState(() {
                _isTerpenesChecked = newValue as List<bool>;
                _onFilterChange();
              }))
    ]);
  }

  void _onFilterChange() {
    widget.onBrandChange(_isBrandChecked);
    widget.onThcPotencyChange(_thcRange);
    widget.onCbdPotencyChange(_cbdRange);
    widget.onPriceRangeChange(_priceRange);
    widget.onVapeCbdRatioChange(_isVapeCBDRatioChecked);
    widget.onVapeSizeChange(_isVapeSizeChecked);
    widget.onVapeTypeChange(_isVapeTypeChecked);
    widget.onTerpenesChange(_isTerpenesChecked);
  }
}

class EdiblesFilterMenu extends StatefulWidget {
  final ValueChanged<List<bool>> onBrandChange;
  final ValueChanged<List<bool>> onEdiblesThcChange;
  final ValueChanged<List<bool>> onEdiblesCbdChange;
  final ValueChanged<List<bool>> onEdiblesQuantityChange;
  final ValueChanged<RangeValues> onPriceRangeChange;
  final ValueChanged<List<bool>> onEdiblesTypeChange;

  const EdiblesFilterMenu({
    Key? key,
    required this.onBrandChange,
    required this.onEdiblesThcChange,
    required this.onEdiblesCbdChange,
    required this.onEdiblesQuantityChange,
    required this.onPriceRangeChange,
    required this.onEdiblesTypeChange,
  }) : super(key: key);

  @override
  _EdiblesFilterMenuState createState() => _EdiblesFilterMenuState();
}

class _EdiblesFilterMenuState extends State<EdiblesFilterMenu> {
  List<bool> _isBrandChecked = List<bool>.filled(_ediblesBrands.length, false);
  List<bool> _isEdiblesTHCChecked =
      List<bool>.filled(_ediblesTHCList.length, false);
  List<bool> _isEdiblesCBDChecked =
      List<bool>.filled(_ediblesCBDList.length, false);
  List<bool> _isEdiblesQuantityChecked =
      List<bool>.filled(_ediblesQuantityList.length, false);
  List<bool> _isEdiblesTypeChecked =
      List<bool>.filled(_ediblesTypeList.length, false);
  RangeValues _priceRange = const RangeValues(10, 300);
  String _brandTitle = 'Brand';
  String _priceRangeTitle = 'Price Range';
  String _cbdTitle = 'CBD';
  String _ediblesTypeTitle = 'Edibles Type';
  String _thcTitle = 'THC';
  String _quantityTitle = 'Quantity';
  int _minPriceRange = 10;
  int _maxPriceRange = 300;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _BuildProductFilterExpandableHeader(
          headerTitle: _brandTitle,
          value: _isBrandChecked,
          text: _ediblesBrands,
          initialExpanded: true,
          onValueChange: (newValue) => setState(() {
                _isBrandChecked = newValue as List<bool>;
                _onFilterChange();
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _thcTitle,
          value: _isEdiblesTHCChecked,
          text: _ediblesTHCList,
          onValueChange: (newValue) => setState(() {
                _isEdiblesTHCChecked = newValue as List<bool>;
                _onFilterChange();
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _cbdTitle,
          value: _isEdiblesCBDChecked,
          text: _ediblesCBDList,
          onValueChange: (newValue) => setState(() {
                _isEdiblesCBDChecked = newValue as List<bool>;
                _onFilterChange();
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _quantityTitle,
          value: _isEdiblesQuantityChecked,
          text: _ediblesQuantityList,
          onValueChange: (newValue) => setState(() {
                _isEdiblesQuantityChecked = newValue as List<bool>;
                _onFilterChange();
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _priceRangeTitle,
          isSliderWidget: true,
          min: _minPriceRange,
          max: _maxPriceRange,
          initialValue: _priceRange,
          onValueChange: (newValue) => setState(() {
                _priceRange = newValue as RangeValues;
                _onFilterChange();
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _ediblesTypeTitle,
          value: _isEdiblesTypeChecked,
          text: _ediblesTypeList,
          onValueChange: (newValue) => setState(() {
                _isEdiblesTypeChecked = newValue as List<bool>;
                _onFilterChange();
              }))
    ]);
  }

  void _onFilterChange() {
    widget.onBrandChange(_isBrandChecked);
    widget.onEdiblesThcChange(_isEdiblesTHCChecked);
    widget.onEdiblesCbdChange(_isEdiblesCBDChecked);
    widget.onEdiblesQuantityChange(_isEdiblesQuantityChecked);
    widget.onPriceRangeChange(_priceRange);
    widget.onEdiblesTypeChange(_isEdiblesTypeChecked);
  }
}

class BeveragesFilterMenu extends StatefulWidget {
  final ValueChanged<List<bool>> onBrandChange;
  final ValueChanged<List<bool>> onBeveragesThcChange;
  final ValueChanged<List<bool>> onBeveragesCbdChange;
  final ValueChanged<RangeValues> onPriceRangeChange;
  final ValueChanged<List<bool>> onBeveragesTypeChange;

  const BeveragesFilterMenu({
    Key? key,
    required this.onBrandChange,
    required this.onBeveragesThcChange,
    required this.onBeveragesCbdChange,
    required this.onPriceRangeChange,
    required this.onBeveragesTypeChange,
  }) : super(key: key);

  @override
  _BeveragesFilterMenuState createState() => _BeveragesFilterMenuState();
}

class _BeveragesFilterMenuState extends State<BeveragesFilterMenu> {
  List<bool> _isBrandChecked =
      List<bool>.filled(_beveragesBrands.length, false);
  List<bool> _isBeveragesTHCChecked =
      List<bool>.filled(_beveragesTHCList.length, false);
  List<bool> _isBeveragesCBDChecked =
      List<bool>.filled(_beveragesCBDList.length, false);
  List<bool> _isBeveragesTypeChecked =
      List<bool>.filled(_beveragesTypeList.length, false);
  RangeValues _priceRange = const RangeValues(10, 300);
  String _brandTitle = 'Brand';
  String _priceRangeTitle = 'Price Range';
  String _cbdTitle = 'CBD';
  String _beverageTypeTitle = 'Beverage Type';
  String _thcTitle = 'THC';
  int _minPriceRange = 10;
  int _maxPriceRange = 300;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _BuildProductFilterExpandableHeader(
          headerTitle: _brandTitle,
          value: _isBrandChecked,
          text: _beveragesBrands,
          initialExpanded: true,
          onValueChange: (newValue) => setState(() {
                _isBrandChecked = newValue as List<bool>;
                _onFilterChange();
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _beverageTypeTitle,
          initialExpanded: true,
          value: _isBeveragesTypeChecked,
          text: _beveragesTypeList,
          onValueChange: (newValue) => setState(() {
                _isBeveragesTypeChecked = newValue as List<bool>;
                _onFilterChange();
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _priceRangeTitle,
          isSliderWidget: true,
          initialExpanded: true,
          min: _minPriceRange,
          max: _maxPriceRange,
          initialValue: _priceRange,
          onValueChange: (newValue) => setState(() {
                _priceRange = newValue as RangeValues;
                _onFilterChange();
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _thcTitle,
          value: _isBeveragesTHCChecked,
          text: _beveragesTHCList,
          onValueChange: (newValue) => setState(() {
                _isBeveragesTHCChecked = newValue as List<bool>;
                _onFilterChange();
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _cbdTitle,
          value: _isBeveragesCBDChecked,
          text: _beveragesCBDList,
          onValueChange: (newValue) => setState(() {
                _isBeveragesCBDChecked = newValue as List<bool>;
                _onFilterChange();
              }))
    ]);
  }

  void _onFilterChange() {
    widget.onBrandChange(_isBrandChecked);
    widget.onBeveragesThcChange(_isBeveragesTHCChecked);
    widget.onBeveragesCbdChange(_isBeveragesCBDChecked);
    widget.onPriceRangeChange(_priceRange);
    widget.onBeveragesTypeChange(_isBeveragesTypeChecked);
  }
}

class TopicalFilterMenu extends StatefulWidget {
  final ValueChanged<List<bool>> onBrandChange;
  final ValueChanged<RangeValues> onPriceRangeChange;
  final ValueChanged<List<bool>> onTopicalsTypeChange;

  const TopicalFilterMenu({
    Key? key,
    required this.onBrandChange,
    required this.onPriceRangeChange,
    required this.onTopicalsTypeChange,
  }) : super(key: key);

  @override
  _TopicalFilterMenuState createState() => _TopicalFilterMenuState();
}

class _TopicalFilterMenuState extends State<TopicalFilterMenu> {
  List<bool> _isBrandChecked = List<bool>.filled(_topicalBrands.length, false);
  List<bool> _isTopicalsTypeChecked =
      List<bool>.filled(_topicalTypeList.length, false);
  RangeValues _priceRange = const RangeValues(10, 100);
  String _brandTitle = 'Brand';
  String _priceRangeTitle = 'Price Range';
  String _topicalsTypeTitle = 'Topicals Type';
  int _minPriceRange = 10;
  int _maxPriceRange = 100;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _BuildProductFilterExpandableHeader(
          headerTitle: _brandTitle,
          value: _isBrandChecked,
          text: _topicalBrands,
          initialExpanded: true,
          onValueChange: (newValue) => setState(() {
                _isBrandChecked = newValue as List<bool>;
                _onFilterChange();
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _topicalsTypeTitle,
          value: _isTopicalsTypeChecked,
          text: _topicalTypeList,
          initialExpanded: true,
          onValueChange: (newValue) => setState(() {
                _isTopicalsTypeChecked = newValue as List<bool>;
                _onFilterChange();
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _priceRangeTitle,
          isSliderWidget: true,
          initialExpanded: true,
          min: _minPriceRange,
          max: _maxPriceRange,
          initialValue: _priceRange,
          onValueChange: (newValue) => setState(() {
                _priceRange = newValue as RangeValues;
                _onFilterChange();
              }))
    ]);
  }

  void _onFilterChange() {
    widget.onBrandChange(_isBrandChecked);
    widget.onPriceRangeChange(_priceRange);
    widget.onTopicalsTypeChange(_isTopicalsTypeChecked);
  }
}

class TincturesFilterMenu extends StatefulWidget {
  final ValueChanged<List<bool>> onBrandChange;
  final ValueChanged<RangeValues> onThcPotencyChange;
  final ValueChanged<RangeValues> onCbdPotencyChange;
  final ValueChanged<RangeValues> onPriceRangeChange;
  final ValueChanged<List<bool>> onTincturesTypeChange;

  const TincturesFilterMenu({
    Key? key,
    required this.onBrandChange,
    required this.onThcPotencyChange,
    required this.onCbdPotencyChange,
    required this.onPriceRangeChange,
    required this.onTincturesTypeChange,
  }) : super(key: key);

  @override
  _TincturesFilterMenuState createState() => _TincturesFilterMenuState();
}

class _TincturesFilterMenuState extends State<TincturesFilterMenu> {
  List<bool> _isBrandChecked =
      List<bool>.filled(_tincturesBrands.length, false);
  List<bool> _isTincturesTypeChecked =
      List<bool>.filled(_tincturesTypeList.length, false);
  RangeValues _priceRange = const RangeValues(10, 200);
  RangeValues _thcRange = const RangeValues(0, 1000); // Example THC range
  RangeValues _cbdRange = const RangeValues(0, 500); // Example CBD range
  String _brandTitle = 'Brand';
  String _priceRangeTitle = 'Price Range';
  String _cbdPotencyTitle = 'CBD Potency';
  String _tincturesTypeTitle = 'Tinctures Type';
  String _thcPotencyTitle = 'THC Potency';
  int _minPriceRange = 10;
  int _maxPriceRange = 3000;
  int _minCbdPotencyRange = 0;
  int _maxCbdPotencyRange = 500;
  int _minThcPotencyRange = 0;
  int _maxThcPotencyRange = 1000;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _BuildProductFilterExpandableHeader(
          headerTitle: _brandTitle,
          value: _isBrandChecked,
          text: _tincturesBrands,
          initialExpanded: true,
          onValueChange: (newValue) => setState(() {
                _isBrandChecked = newValue as List<bool>;
                _onFilterChange();
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _thcPotencyTitle,
          isSliderWidget: true,
          isPriceRange: false,
          initialExpanded: true,
          min: _minThcPotencyRange,
          max: _maxThcPotencyRange,
          initialValue: _thcRange,
          onValueChange: (newValue) => setState(() {
                _thcRange = newValue as RangeValues;
                _onFilterChange();
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _cbdPotencyTitle,
          isSliderWidget: true,
          isPriceRange: false,
          initialExpanded: true,
          min: _minCbdPotencyRange,
          max: _maxCbdPotencyRange,
          initialValue: _cbdRange,
          onValueChange: (newValue) => setState(() {
                _cbdRange = newValue as RangeValues;
                _onFilterChange();
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _tincturesTypeTitle,
          value: _isTincturesTypeChecked,
          text: _tincturesTypeList,
          onValueChange: (newValue) => setState(() {
                _isTincturesTypeChecked = newValue as List<bool>;
                _onFilterChange();
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _priceRangeTitle,
          isSliderWidget: true,
          min: _minPriceRange,
          max: _maxPriceRange,
          initialValue: _priceRange,
          onValueChange: (newValue) => setState(() {
                _priceRange = newValue as RangeValues;
                _onFilterChange();
              }))
    ]);
  }

  void _onFilterChange() {
    widget.onBrandChange(_isBrandChecked);
    widget.onThcPotencyChange(_thcRange);
    widget.onCbdPotencyChange(_cbdRange);
    widget.onPriceRangeChange(_priceRange);
    widget.onTincturesTypeChange(_isTincturesTypeChecked);
  }
}

class GrowingFilterMenu extends StatefulWidget {
  final ValueChanged<List<bool>> onBrandChange;
  final ValueChanged<RangeValues> onPriceRangeChange;

  const GrowingFilterMenu({
    Key? key,
    required this.onBrandChange,
    required this.onPriceRangeChange,
  }) : super(key: key);

  @override
  _GrowingFilterMenuState createState() => _GrowingFilterMenuState();
}

class _GrowingFilterMenuState extends State<GrowingFilterMenu> {
  List<bool> _isBrandChecked = List<bool>.filled(_growingBrands.length, false);
  RangeValues _priceRange = const RangeValues(10, 3000);
  String _brandTitle = 'Brand';
  String _priceRangeTitle = 'Price Range';
  int _minPriceRange = 10;
  int _maxPriceRange = 3000;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _BuildProductFilterExpandableHeader(
          headerTitle: _brandTitle,
          value: _isBrandChecked,
          text: _growingBrands,
          initialExpanded: true,
          onValueChange: (newValue) => setState(() {
                _isBrandChecked = newValue as List<bool>;
                _onFilterChange();
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _priceRangeTitle,
          isSliderWidget: true,
          initialExpanded: true,
          min: _minPriceRange,
          max: _maxPriceRange,
          initialValue: _priceRange,
          onValueChange: (newValue) => setState(() {
                _priceRange = newValue as RangeValues;
                _onFilterChange();
              }))
    ]);
  }

  void _onFilterChange() {
    widget.onBrandChange(_isBrandChecked);
    widget.onPriceRangeChange(_priceRange);
  }
}

class CBDFilterMenu extends StatefulWidget {
  final ValueChanged<List<bool>> onBrandChange;
  final ValueChanged<RangeValues> onPriceRangeChange;
  final ValueChanged<List<bool>> onCbdTypeChange;

  const CBDFilterMenu({
    Key? key,
    required this.onBrandChange,
    required this.onPriceRangeChange,
    required this.onCbdTypeChange,
  }) : super(key: key);

  @override
  _CBDFilterMenuState createState() => _CBDFilterMenuState();
}

class _CBDFilterMenuState extends State<CBDFilterMenu> {
  List<bool> _isBrandChecked = List<bool>.filled(_cbdBrands.length, false);
  List<bool> _isCbdTypeChecked = List<bool>.filled(_cbdTypeList.length, false);
  RangeValues _priceRange = const RangeValues(10, 200);
  String _brandTitle = 'Brand';
  String _priceRangeTitle = 'Price Range';
  String _cbdTypeTitle = 'CBD Type';
  int _minPriceRange = 10;
  int _maxPriceRange = 200;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _BuildProductFilterExpandableHeader(
          headerTitle: _brandTitle,
          value: _isBrandChecked,
          text: _cbdBrands,
          initialExpanded: true,
          onValueChange: (newValue) => setState(() {
                _isBrandChecked = newValue as List<bool>;
                _onFilterChange();
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _cbdTypeTitle,
          value: _isCbdTypeChecked,
          text: _cbdTypeList,
          initialExpanded: true,
          onValueChange: (newValue) => setState(() {
                _isCbdTypeChecked = newValue as List<bool>;
                _onFilterChange();
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _priceRangeTitle,
          isSliderWidget: true,
          initialExpanded: true,
          min: _minPriceRange,
          max: _maxPriceRange,
          initialValue: _priceRange,
          onValueChange: (newValue) => setState(() {
                _priceRange = newValue as RangeValues;
                _onFilterChange();
              }))
    ]);
  }

  void _onFilterChange() {
    widget.onBrandChange(_isBrandChecked);
    widget.onPriceRangeChange(_priceRange);
    widget.onCbdTypeChange(_isCbdTypeChecked);
  }
}

class AccessoriesFilterMenu extends StatefulWidget {
  final ValueChanged<List<bool>> onBrandChange;
  final ValueChanged<RangeValues> onPriceRangeChange;
  final ValueChanged<List<bool>> onAccessoriesTypeChange;

  const AccessoriesFilterMenu({
    Key? key,
    required this.onBrandChange,
    required this.onPriceRangeChange,
    required this.onAccessoriesTypeChange,
  }) : super(key: key);

  @override
  _AccessoriesFilterMenuState createState() => _AccessoriesFilterMenuState();
}

class _AccessoriesFilterMenuState extends State<AccessoriesFilterMenu> {
  List<bool> _isBrandChecked =
      List<bool>.filled(_accessoriesBrands.length, false);
  List<bool> _isAccessoriesTypeChecked =
      List<bool>.filled(_accessoriesTypeList.length, false);
  RangeValues _priceRange = const RangeValues(0, 400);
  String _brandTitle = 'Brand';
  String _priceRangeTitle = 'Price Range';
  String _accessoriesTypeTitle = 'Accessories Type';
  int _minPriceRange = 0;
  int _maxPriceRange = 400;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _BuildProductFilterExpandableHeader(
          headerTitle: _brandTitle,
          value: _isBrandChecked,
          text: _accessoriesBrands,
          initialExpanded: true,
          onValueChange: (newValue) => setState(() {
                _isBrandChecked = newValue as List<bool>;
                _onFilterChange();
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _accessoriesTypeTitle,
          value: _isAccessoriesTypeChecked,
          text: _accessoriesTypeList,
          initialExpanded: true,
          onValueChange: (newValue) => setState(() {
                _isAccessoriesTypeChecked = newValue as List<bool>;
                _onFilterChange();
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _priceRangeTitle,
          isSliderWidget: true,
          min: _minPriceRange,
          max: _maxPriceRange,
          initialValue: _priceRange,
          onValueChange: (newValue) => setState(() {
                _priceRange = newValue as RangeValues;
                _onFilterChange();
              }))
    ]);
  }

  void _onFilterChange() {
    widget.onBrandChange(_isBrandChecked);
    widget.onPriceRangeChange(_priceRange);
    widget.onAccessoriesTypeChange(_isAccessoriesTypeChecked);
  }
}

class ApparelFilterMenu extends StatefulWidget {
  final ValueChanged<List<bool>> onBrandChange;
  final ValueChanged<RangeValues> onPriceRangeChange;
  final ValueChanged<List<bool>> onApparelSizeChange;

  const ApparelFilterMenu({
    Key? key,
    required this.onBrandChange,
    required this.onPriceRangeChange,
    required this.onApparelSizeChange,
  }) : super(key: key);

  @override
  _ApparelFilterMenuState createState() => _ApparelFilterMenuState();
}

class _ApparelFilterMenuState extends State<ApparelFilterMenu> {
  List<bool> _isBrandChecked = List<bool>.filled(_apparelBrands.length, false);
  List<bool> _isApparelSizeChecked =
      List<bool>.filled(_apparelSizeList.length, false);
  RangeValues _priceRange = const RangeValues(10, 100);

  String _brandTitle = 'Brand';
  String _priceRangeTitle = 'Price Range';
  String _apparelSizeTitle = 'Apparel Size';
  int _minPriceRange = 10;
  int _maxPriceRange = 100;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _BuildProductFilterExpandableHeader(
          headerTitle: _brandTitle,
          value: _isBrandChecked,
          text: _apparelBrands,
          initialExpanded: true,
          onValueChange: (newValue) => setState(() {
                _isBrandChecked = newValue as List<bool>;
                _onFilterChange();
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _priceRangeTitle,
          isSliderWidget: true,
          min: _minPriceRange,
          max: _maxPriceRange,
          initialValue: _priceRange,
          onValueChange: (newValue) => setState(() {
                _priceRange = newValue as RangeValues;
                _onFilterChange();
              })),
      _appDivider,
      _BuildProductFilterExpandableHeader(
          headerTitle: _apparelSizeTitle,
          value: _isApparelSizeChecked,
          text: _apparelSizeList,
          onValueChange: (newValue) => setState(() {
                _isApparelSizeChecked = newValue as List<bool>;
                _onFilterChange();
              }))
    ]);
  }

  void _onFilterChange() {
    widget.onBrandChange(_isBrandChecked);
    widget.onPriceRangeChange(_priceRange);
    widget.onApparelSizeChange(_isApparelSizeChecked);
  }
}

class _BuildProductFilterExpandableHeader extends StatelessWidget {
  const _BuildProductFilterExpandableHeader(
      {super.key,
      this.headerTitle,
      this.value,
      this.text,
      this.onValueChange,
      this.isSliderWidget = false,
      this.isPriceRange = true,
      this.initialExpanded = false,
      this.min,
      this.max,
      this.initialValue});

  final String? headerTitle;
  final List<bool>? value;
  final List<String>? text;
  final ValueChanged<dynamic>? onValueChange;
  final bool? isSliderWidget;
  final bool? isPriceRange;
  final bool? initialExpanded;
  final int? min;
  final int? max;
  final RangeValues? initialValue;

  @override
  Widget build(BuildContext context) {
    return ProductFilterExpandableHeader(
        initialExpanded: initialExpanded!,
        headerTitle: headerTitle!,
        value: value,
        text: text,
        isSliderWidget: isSliderWidget!,
        isPriceRange: isPriceRange!,
        min: min,
        max: max,
        lowerValue: initialValue?.start.toInt(),
        upperValue: initialValue?.end.toInt(),
        onValueChange: onValueChange);
  }
}

List<String> _typeList = ['Sativa', 'Hybrid', 'Indica'];
List<String> _strainType = ['Sativa', 'Hybrid', 'Indica', 'CBD'];

///FLOWERS
List<String> _flowerBrands = [
  'Alien Labs',
  'Almora Farm',
  'Aster Farms',
  'Cannabiotix',
  'Circles',
  'Claybourne Co.',
  'Farmer And The Felon',
  'Flow Kana',
  'Fog City Farms',
  'Henry’s Original',
  'High Supply',
  'Jetty Extracts',
  'LA Cannabis Co',
  'Lime',
  'Maven',
  'Raw Garden',
  'Stiiizy',
  'Wonderbrett'
];
List<String> _flowerSizeList = ['3.5g', '7g', '14g', '28g'];
List<String> _flowerTypeList = ['Flower', 'Popcorn', 'Premium', 'Shake'];
List<String> _flowerTerpenesList = [
  'Caryophyllene',
  'Humulene',
  'Limonene',
  'Linalool',
  'Myrcene',
  'Ocimene',
  'Pinene',
  'Terpinolene'
];

///PRE-ROLL
List<String> _preRollBrands = [
  'Henry\'s Original',
  'Jeeter',
  'Lowell Farms',
  'Ozone',
  'Slims',
  'Swift Lifts',
  'Weekenders',
  'West Coast Cure',
];
List<String> _preRollSizeList = [
  '0.5g',
  '1g',
  '1.5g',
  '2g',
  '2.5g',
  '3g',
  '3.5g',
  '4g',
  '4.5g',
  '5g',
];
List<String> _preRollTypeList = [
  'Glass Joint',
  'Infused',
  'PreRolls',
  'Shorties'
];
List<String> _preRollTerpenesList = ['Caryophyllene', 'Limonene', 'Nerolidol'];

///CONCENTRATES
List<String> _concentratesBrands = [
  '22K',
  'Amigo',
  'Budderfly',
  'FloraCal',
  'Grassroots',
  'Jetty Extracts',
  'Ozone Reserve',
  'Rythm',
  'Verano',
];
List<String> _concentratesSizeList = [
  '0.5g',
  '1g',
  '2g',
];
List<String> _concentratesTypeList = [
  'Cured Resin',
  'Live Badder',
  'Live Budder',
  'Live Resin',
  'Live Rosin',
  'Live Sauce',
  'Live Sugar',
  'Shatter',
  'Solventless Live Rosin',
  'Wax'
];
List<String> _concentratesExtractionMethod = ['Live', 'Solventless'];
List<String> _concentratesTerpenesList = [
  'Caryophyllene',
  'Humulene',
  'Limonene',
  'Linalool',
  'Myrcene',
  'Nerolidol',
  'Pinene'
];

///VAPORIZERS
List<String> _vapeBrands = ['Stiiizy'];
List<String> _vapeSizeList = ['300mg', '500mg', '1g'];
List<String> _vapeTypeList = [
  'Cartridge',
  'Disposable Pen',
  'Live Cartridge',
  'Live Resin Cartridge',
  'Solventless Cart'
];
List<String> _vapeExtractionMethod = [
  'BHO',
  'Distillate',
  'Live',
  'Solventless'
];
List<String> _vapeTerpenesList = [
  'Caryophyllene',
  'Humulene',
  'Limonene',
  'Linalool',
  'Myrcene',
  'Nerolidol',
  'Pinene',
  'Terpinolene'
];
List<String> _vapeCBDRatioList = ['CBD 1:1', 'CBD 1:2', 'CBD 2:1'];

///EDIBLES
List<String> _ediblesBrands = [
  'Camino',
  'Encore',
  'Good News',
  'Hedy',
  'Incredibles',
  'Kiva',
  'Lost Farm',
  'Mindy\'s',
  'Nature\'s Grace',
  'Ozone',
  'Petra',
  'WAN',
];
List<String> _ediblesTHCList = ['10mg', '50mg', '100mg'];
List<String> _ediblesCBDList = ['50mg', '100mg', '200mg'];
List<String> _ediblesCBNList = ['20mg', '40mg', '50mg'];
List<String> _ediblesQuantityList = ['1ct', '5ct', '10ct', '20ct', '40ct'];
List<String> _ediblesCBDRatioList = [
  'CBD 10:1',
  'CBD 1:1',
  'CBD 20:1',
  'CBD 2:1'
];
List<String> _ediblesTypeList = [
  'Candy',
  'Chocolate',
  'Gummy',
  'Hard Candy',
  'Mint'
];
List<String> _ediblesFlavorList = [
  'Berries',
  'Black Cherry',
  'Blackberry',
  'Blue Raspberry',
  'Blueberry',
  'Caramel',
  'Clementine Orange',
  'Coffee',
  'Grape',
  'Green Apple',
  'Honey Melon',
  'Key Lime',
  'Keylime Kiwi',
  'Mandarin Orange',
  'Mango',
  'Marshmallow Graham',
  'Milk And Cookies',
  'Mint Chocolate',
  'Orange',
  'Orchard Peach',
  'Peach',
  'Peanut',
  'Pineapple',
  'Pomegranate',
  'Prickly Pear',
  'Raspberry',
  'Sour Cherry',
  'Sour Green Apple',
  'Strawberry',
  'Strawberry Lemonade',
  'Strawberry Peach',
  'Tangerine',
  'Watermelon',
  'Watermelon Lemonade',
  'Watermelon Spritz',
  'White Grape',
  'Wild Berry',
  'Wild Cherry',
  'Wintermint',
  'Yuzu'
];

///BEVERAGES

List<String> _beveragesBrands = ['Cann', 'Rebel Coast'];
List<String> _beveragesTHCList = [
  '5mg',
  '10mg',
  '15mg',
  '20mg',
  '50mg',
  '100mg'
];
List<String> _beveragesCBDList = [
  '5mg',
  '10mg',
  '15mg',
  '20mg',
  '50mg',
  '100mg'
];
List<String> _beveragesCBDRatioList = ['CBD 1:1', 'CBD 5:1'];
List<String> _beveragesTypeList = [
  'Energy',
  'Mocktail',
  'Seltzer',
  'Sparkling',
  'Tonic'
];
List<String> _beveragesFlavorList = [
  'Black Cherry',
  'Grapefruit',
  'Green Apple',
  'Lemon Lime',
  'Lime',
  'Mango',
  'Raspberry',
  'Tropical Fruit'
];

///TOPICALS
List<String> _topicalBrands = [
  'Avexia',
  'Buddies',
  'High Gorgeous',
  'Pure Essentials'
];
List<String> _topicalTHCList = ['100mg'];
List<String> _topicalCBDList = ['100mg', '200mg'];
List<String> _topicalCBDRatioList = ['CBD 1:1', 'CBD 2:1'];
List<String> _topicalTypeList = ['Balm', 'Body Oil', 'Lotion'];

///TINCTURES
List<String> _tincturesBrands = ['Yummi Karma', 'Care by Design'];
List<String> _tincturesTHCList = [
  '10mg',
  '25mg',
  '50mg',
  '100mg',
  '200mg',
  '300mg',
  '400mg',
  '500mg'
];
List<String> _tincturesCBDList = [
  '10mg',
  '25mg',
  '50mg',
  '100mg',
  '200mg',
  '300mg',
  '400mg',
  '500mg'
];
List<String> _tincturesCBDRatioList = [
  'CBD 1:1',
  'CBD 2:1',
  'CBD 4:1',
  'CBD 4:4'
];
List<String> _tincturesTypeList = [
  'CBD Isolate',
  'Broad Spectrum',
  'Full Spectrum'
];

///GROWING
List<String> _growingBrands = ['AC INFINITY', 'Grower\'s Choice', 'Optic'];
List<String> _growingTypeList = [
  'Ashtray',
  'Battery',
  'Bong',
  'Book',
  'Charger',
  'Cleaning',
  'Clothing',
  'Cones',
  'Dab Rig',
  'Glass',
  'Grinder',
  'Hat',
  'Herbal Blend',
  'Humidity Pack',
  'Infuser',
  'Lighter',
  'Matches',
  'Odor',
  'Papers',
  'Pipe',
  'Storage',
  'Tool',
  'Tote Bag',
  'Tray',
  'Vaporizer',
  'Water Bottle'
];

/// CBD
List<String> _cbdBrands = ['Lazarus Naturals', 'SBCBD'];
List<String> _cbdTypeList = [
  'Balm',
  'Bath Bomb',
  'Creams',
  'Elixir',
  'Facial Skincare',
  'Lotions',
  'Massage Oil',
  'Oil',
  'Patches',
  'Roll Ons'
];

///ACCESSORIES
List<String> _accessoriesBrands = [
  'Cirrus Glass',
  'EYCE',
  'Lit Silicone',
  'Magical',
  'OCB',
  'Red Eye Tek',
  'Shine',
  'Stache',
  'West Coast Gifts',
  'Zenco'
];
List<String> _accessoriesTypeList = [
  'Ashtray',
  'Battery',
  'Bong',
  'Book',
  'Charger',
  'Cleaning',
  'Clothing',
  'Cones',
  'Dab Rig',
  'Glass',
  'Grinder',
  'Hat',
  'Herbal Blend',
  'Humidity Pack',
  'Infuser',
  'Lighter',
  'Matches',
  'Odor',
  'Papers',
  'Pipe',
  'Storage',
  'Tool',
  'Tote Bag',
  'Tray',
  'Vaporizer',
  'Water Bottle'
];

///APPARELS
List<String> _apparelBrands = ['Brand'];
List<String> _apparelSizeList = ['XS', 'S', 'M', 'L', 'XL'];
