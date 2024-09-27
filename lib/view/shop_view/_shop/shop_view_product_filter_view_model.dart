import 'package:new_weedus/export.dart';

class ShopViewProductFilterViewModel extends ChangeNotifier {
  int _selectedCategoryIndex = 0;
  bool _isLoading = false;

  set setSelectedCategoryIndex(int index) {
    _selectedCategoryIndex = index;
    notifyListeners();
  }

  int get selectedCategoryIndex => _selectedCategoryIndex;

  // Apply filters and trigger loading state
  void applyFilters() {
    _isLoading = true;
    notifyListeners();

    // Simulate loading delay (replace with actual data fetching/filtering logic if needed)
    Future.delayed(const Duration(milliseconds: 400), () {
      _isLoading = false;
      notifyListeners();
    });
  }

  bool get isLoading => _isLoading;

  /// filters

  Set<double> _selectedFlowerSizes = {};
  List<bool> _selectedStrainTypes =
      List<bool>.filled(_strainType.length, false);
  List<bool> _selectedFlowerBrands =
      List<bool>.filled(_flowerBrands.length, false);
  Set<double> _selectedSizes = {};
  double? _selectedSize;
  List<bool> _isFlowerTypeChecked =
      List<bool>.filled(_flowerTypeList.length, false);
  String? _selectedTerpenes;
  RangeValues _selectedThcRange = const RangeValues(10, 50);
  RangeValues _selectedPriceRange = const RangeValues(20, 270);

  // Filter state variables for Pre-Rolls
  List<bool> _selectedPreRollBrands =
      List<bool>.filled(_preRollBrands.length, false);
  List<bool> _selectedPreRollSizes =
      List<bool>.filled(_preRollSizeList.length, false);
  List<bool> _selectedPreRollStrainTypes =
      List<bool>.filled(_strainType.length, false);
  List<bool> _selectedPreRollTypes =
      List<bool>.filled(_preRollTypeList.length, false);
  List<bool> _selectedPreRollTerpenes =
      List<bool>.filled(_preRollTerpenesList.length, false);
  RangeValues _selectedPreRollThcRange = const RangeValues(10, 50);
  RangeValues _selectedPreRollPriceRange = const RangeValues(10, 60);

  // Filter state variables for Concentrates
  List<bool> _selectedConcentratesBrands =
      List<bool>.filled(_concentratesBrands.length, false);
  List<bool> _selectedConcentratesSizes =
      List<bool>.filled(_concentratesSizeList.length, false);
  List<bool> _selectedConcentratesTypes =
      List<bool>.filled(_concentratesTypeList.length, false);
  List<bool> _selectedConcentratesStrainTypes =
      List<bool>.filled(_typeList.length, false);
  List<bool> _selectedConcentratesMethods =
      List<bool>.filled(_concentratesExtractionMethod.length, false);
  List<bool> _selectedTypes = List<bool>.filled(_typeList.length, false);
  List<bool> _selectedConcentratesTerpenes =
      List<bool>.filled(_concentratesTerpenesList.length, false);
  RangeValues _selectedConcentratesThcRange = const RangeValues(60, 90);
  RangeValues _selectedConcentratesPriceRange = const RangeValues(40, 120);

  // Filter state variables for Vaporizers
  List<bool> _selectedVapeBrands = List<bool>.filled(_vapeBrands.length, false);
  List<bool> _selectedVapeSizes =
      List<bool>.filled(_vapeSizeList.length, false);
  List<bool> _selectedVapeTypes =
      List<bool>.filled(_vapeTypeList.length, false);
  List<bool> _selectedVapeMethods =
      List<bool>.filled(_vapeExtractionMethod.length, false);
  List<bool> _selectedVapeCbdRatios =
      List<bool>.filled(_vapeCBDRatioList.length, false);
  List<bool> _selectedVapeTerpenes =
      List<bool>.filled(_vapeTerpenesList.length, false);
  RangeValues _selectedVapeThcRange = const RangeValues(20, 90);
  RangeValues _selectedVapeCbdRange = const RangeValues(0, 70);
  RangeValues _selectedVapePriceRange = const RangeValues(30, 140);

  // Filter state variables for Edibles
  List<bool> _selectedEdiblesBrands =
      List<bool>.filled(_ediblesBrands.length, false);
  List<bool> _selectedEdiblesThc =
      List<bool>.filled(_ediblesTHCList.length, false);
  List<bool> _selectedEdiblesCbd =
      List<bool>.filled(_ediblesCBDList.length, false);
  List<bool> _selectedEdiblesQuantity =
      List<bool>.filled(_ediblesQuantityList.length, false);
  RangeValues _selectedEdiblesPriceRange = const RangeValues(10, 60);
  List<bool> _selectedEdiblesTypes =
      List<bool>.filled(_ediblesTypeList.length, false);

  // Filter state variables for Beverages
  List<bool> _selectedBeveragesBrands =
      List<bool>.filled(_beveragesBrands.length, false);
  List<bool> _selectedBeveragesThc =
      List<bool>.filled(_beveragesTHCList.length, false);
  List<bool> _selectedBeveragesCbd =
      List<bool>.filled(_beveragesCBDList.length, false);
  RangeValues _selectedBeveragesPriceRange = const RangeValues(10, 60);
  List<bool> _selectedBeveragesTypes =
      List<bool>.filled(_beveragesTypeList.length, false);

  // Filter state variables for Topicals
  List<bool> _selectedTopicalsBrands =
      List<bool>.filled(_topicalBrands.length, false);
  List<bool> _selectedTopicalsTypes =
      List<bool>.filled(_topicalTypeList.length, false);
  RangeValues _selectedTopicalsPriceRange = const RangeValues(10, 100);

  // Filter state variables for Tinctures
  List<bool> _selectedTincturesBrands =
      List<bool>.filled(_tincturesBrands.length, false);
  RangeValues _selectedTincturesThcRange = const RangeValues(0, 1000);
  RangeValues _selectedTincturesCbdRange = const RangeValues(0, 500);
  RangeValues _selectedTincturesPriceRange = const RangeValues(10, 100);
  List<bool> _selectedTincturesTypes =
      List<bool>.filled(_tincturesTypeList.length, false);

  // Filter state variables for Accessories
  List<bool> _selectedAccessoriesBrands =
      List<bool>.filled(_accessoriesBrands.length, false);
  List<bool> _selectedAccessoriesTypes =
      List<bool>.filled(_accessoriesTypeList.length, false);
  RangeValues _selectedAccessoriesPriceRange = const RangeValues(0, 400);

  // Filter state variables for Apparel
  List<bool> _selectedApparelBrands =
      List<bool>.filled(_apparelBrands.length, false);
  List<bool> _selectedApparelSizes =
      List<bool>.filled(_apparelSizeList.length, false);
  RangeValues _selectedApparelPriceRange = const RangeValues(10, 100);

  // Growing filter state
  List<bool> _selectedGrowingBrands =
      List<bool>.filled(_growingBrands.length, false);
  RangeValues _selectedGrowingPriceRange = const RangeValues(10, 3000);

  // CBD filter state
  List<bool> _selectedCbdBrands = List<bool>.filled(_cbdBrands.length, false);
  List<bool> _selectedCbdTypes = List<bool>.filled(_cbdTypeList.length, false);
  RangeValues _selectedCbdPriceRange = const RangeValues(10, 200);

  List<Product> filteredProducts(ShopViewProductFilterViewModel productFilterViewModel) {
    List<Product> categoryProducts =
        productList[productFilterViewModel.selectedCategoryIndex];

    return categoryProducts.where((product) {
      // Apply filters based on the selected category
      switch (productFilterViewModel.selectedCategoryIndex) {
        case 0: // Flowers
          return _applyFlowerFilters(product);
        case 1: // Pre-Rolls
          return _applyPreRollFilters(product);
        case 2: // Concentrates
          return _applyConcentratesFilters(product);
        case 3: // Vaporizers
          return _applyVaporizersFilters(product);
        case 4: // Edibles
          return _applyEdiblesFilters(product);
        case 5: // Beverages
          return _applyBeveragesFilters(product);
        case 6: // Topicals
          return _applyTopicalsFilters(product);
        case 7: // Tinctures
          return _applyTincturesFilters(product);
        case 8: // Growing
          return _applyGrowingFilters(product);
        case 9: // CBD
          return _applyCbdFilters(product);
        case 10: // Accessories
          return _applyAccessoriesFilters(product);
        case 11: // Apparel
          return _applyApparelFilters(product);
        default:
          return true; // No filters for other categories, show all products
      }
    }).toList();
  }

  bool _applyFlowerFilters(Product product) {
    // Brand filter
    final brandIndex = _flowerBrands.indexOf(product.brand!);
    bool brandMatch = _selectedFlowerBrands.any((isSelected) => isSelected)
        ? (brandIndex != -1 &&
            _selectedFlowerBrands[
                brandIndex]) // Check if brand is found and selected
        : true;

    // Size filter
    bool sizeMatch =
        _selectedSizes.isEmpty || _selectedSizes.contains(product.size);

    // Flower type filter
    bool flowerTypeMatch = _isFlowerTypeChecked.any((isSelected) => isSelected)
        ? _isFlowerTypeChecked[_flowerTypeList.indexOf(product.type!)]
        : true;

    // Terpenes filter
    bool terpenesMatch = _selectedTerpenes == null ||
        (product.tagList != null &&
            product.tagList!.contains(_selectedTerpenes));

    // Price range filter (with type conversion)
    bool priceMatch = product.price != null &&
        double.tryParse(product.price!.toString()) != null &&
        double.parse(product.price!.toString()) >= _selectedPriceRange.start &&
        double.parse(product.price!.toString()) <= _selectedPriceRange.end;

    // THC Potency filter
    bool thcMatch = product.thc != null &&
        product.thc! >= _selectedThcRange.start &&
        product.thc! <= _selectedThcRange.end;

    // Type filter (Sativa, Indica, Hybrid, CBD)
    bool typeMatch = (_selectedStrainTypes[0] && product.isSativa == true) ||
        (_selectedStrainTypes[1] && product.isHybrid == true) ||
        (_selectedStrainTypes[2] && product.isIndica == true) ||
        (_selectedStrainTypes[3] && product.isCBD == true);

    // If no type filter is selected, all products match
    if (!_selectedStrainTypes.any((isSelected) => isSelected)) {
      typeMatch = true;
    }

    return brandMatch &&
        sizeMatch &&
        flowerTypeMatch &&
        terpenesMatch &&
        priceMatch &&
        thcMatch &&
        typeMatch;
  }

  bool _applyPreRollFilters(Product product) {
    // Brand filter
    bool brandMatch = _selectedPreRollBrands.any((isSelected) => isSelected)
        ? _selectedPreRollBrands[_preRollBrands.indexOf(product.brand!)]
        : true;

    // Size filter
    bool sizeMatch = _selectedSize == null || product.size == _selectedSize;

    // Pre-Roll type filter
    bool preRollTypeMatch =
        _selectedPreRollTypes.any((isSelected) => isSelected)
            ? _selectedPreRollTypes[_preRollTypeList.indexOf(product.type!)]
            : true;

    // Terpenes filter
    bool terpenesMatch = _selectedTerpenes == null ||
        (product.tagList != null &&
            product.tagList!.contains(_selectedTerpenes));

    // Price range filter (with type conversion)
    bool priceMatch = product.price != null &&
        double.tryParse(product.price!.toString()) != null &&
        double.parse(product.price!.toString()) >=
            _selectedPreRollPriceRange.start &&
        double.parse(product.price!.toString()) <=
            _selectedPreRollPriceRange.end;

    // Type filter (Sativa, Indica, Hybrid, CBD)
    bool typeMatch =
        (_selectedPreRollStrainTypes[0] && product.isSativa == true) ||
            (_selectedPreRollStrainTypes[1] && product.isHybrid == true) ||
            (_selectedPreRollStrainTypes[2] && product.isIndica == true) ||
            (_selectedPreRollStrainTypes[3] && product.isCBD == true);
    if (!_selectedPreRollStrainTypes.any((isSelected) => isSelected)) {
      typeMatch = true;
    }

    // THC Potency filter
    bool thcMatch = product.thc != null &&
        product.thc! >= _selectedPreRollThcRange.start &&
        product.thc! <= _selectedPreRollThcRange.end;

    // Combine all filter conditions
    return brandMatch &&
        sizeMatch &&
        preRollTypeMatch &&
        terpenesMatch &&
        typeMatch &&
        priceMatch &&
        thcMatch;
  }

  bool _applyConcentratesFilters(Product product) {
    bool brandMatch =
        _selectedConcentratesBrands.any((isSelected) => isSelected)
            ? _selectedConcentratesBrands[
                _concentratesBrands.indexOf(product.brand!)]
            : true;

    bool sizeMatch = _selectedConcentratesSizes.any((isSelected) => isSelected)
        ? _selectedConcentratesSizes[
            _concentratesSizeList.indexOf(product.size!.toString() + 'g')]
        : true;

    bool typeMatch = _selectedConcentratesTypes.any((isSelected) => isSelected)
        ? _selectedConcentratesTypes[
            _concentratesTypeList.indexOf(product.type!)]
        : true;

    bool methodMatch =
        _selectedConcentratesMethods.any((isSelected) => isSelected)
            ? _selectedConcentratesMethods[_concentratesExtractionMethod
                .indexOf(product.extractionMethodList![0])]
            : true;

    bool terpeneMatch = _selectedTerpenes == null ||
        (product.tagList != null &&
            product.tagList!.contains(_selectedTerpenes));

    bool priceMatch = product.price != null &&
        double.tryParse(product.price!.toString()) != null &&
        double.parse(product.price!.toString()) >=
            _selectedConcentratesPriceRange.start &&
        double.parse(product.price!.toString()) <=
            _selectedConcentratesPriceRange.end;

    bool thcMatch = product.thc != null &&
        product.thc! >= _selectedConcentratesThcRange.start &&
        product.thc! <= _selectedConcentratesThcRange.end;

    bool strainTypeMatch =
        (_selectedConcentratesStrainTypes[0] && product.isSativa == true) ||
            (_selectedConcentratesStrainTypes[1] && product.isHybrid == true) ||
            (_selectedConcentratesStrainTypes[2] && product.isIndica == true);

    if (!_selectedConcentratesStrainTypes.any((isSelected) => isSelected)) {
      strainTypeMatch = true;
    }

    return brandMatch &&
        sizeMatch &&
        typeMatch &&
        methodMatch &&
        terpeneMatch &&
        priceMatch &&
        thcMatch &&
        strainTypeMatch;
  }

  bool _applyVaporizersFilters(Product product) {
    final brandIndex =
        product.brand != null ? _vapeBrands.indexOf(product.brand!) : -1;
    bool brandMatch = _selectedVapeBrands.any((isSelected) => isSelected)
        ? (brandIndex != -1 && _selectedVapeBrands[brandIndex])
        : true;
    ;

    final sizeIndex = product.size != null
        ? _vapeSizeList.indexOf(product.size!.toString() + 'g')
        : -1;
    bool sizeMatch = _selectedVapeSizes.any((isSelected) => isSelected)
        ? (sizeIndex != -1 && _selectedVapeSizes[sizeIndex])
        : true;

    final typeIndex =
        product.type != null ? _vapeTypeList.indexOf(product.type!) : -1;
    bool typeMatch = _selectedVapeTypes.any((isSelected) => isSelected)
        ? (typeIndex != -1 && _selectedVapeTypes[typeIndex])
        : true;

    bool terpenesMatch = _selectedTerpenes == null ||
        (product.tagList != null &&
            product.tagList!.contains(_selectedTerpenes));

    bool priceMatch = product.price != null &&
        double.parse(product.price!.toString()) >=
            _selectedVapePriceRange.start &&
        double.parse(product.price!.toString()) <= _selectedVapePriceRange.end;

    bool thcMatch = product.thc != null &&
        product.thc! >= _selectedVapeThcRange.start &&
        product.thc! <= _selectedVapeThcRange.end;

    double? cbdRatio =
        (product.cbd != null && product.thc != null && product.thc != 0)
            ? (product.cbd! / product.thc!)
            : 0.0;

    bool cbdRatioMatch = cbdRatio >= _selectedVapeCbdRange.start &&
        cbdRatio <= _selectedVapeCbdRange.end;

    bool cbdMatch = product.cbd == null ||
        (product.cbd! >= _selectedVapeCbdRange.start &&
            product.cbd! <= _selectedVapeCbdRange.end);

    bool allMatch = brandMatch &&
        sizeMatch &&
        typeMatch &&
        cbdRatioMatch &&
        terpenesMatch &&
        priceMatch &&
        thcMatch &&
        cbdMatch;
    return allMatch;
  }

  bool _applyEdiblesFilters(Product product) {
    final brandIndex =
        product.brand != null ? _ediblesBrands.indexOf(product.brand!) : -1;
    bool brandMatch = _selectedEdiblesBrands.any((isSelected) => isSelected)
        ? (brandIndex != -1 && _selectedEdiblesBrands[brandIndex])
        : true;

    final thcIndex = product.thc != null
        ? _ediblesTHCList.indexOf(product.thc!.toString() + 'mg')
        : -1;
    bool thcMatch = _selectedEdiblesThc.any((isSelected) => isSelected)
        ? (thcIndex != -1 && _selectedEdiblesThc[thcIndex])
        : true;

    final cbdIndex = product.cbd != null
        ? _ediblesCBDList.indexOf(product.cbd!.toString() + 'mg')
        : -1;
    bool cbdMatch = _selectedEdiblesCbd.any((isSelected) => isSelected)
        ? (cbdIndex != -1 && _selectedEdiblesCbd[cbdIndex])
        : true;

    final quantityIndex = product.quantity != null
        ? _ediblesQuantityList.indexOf(product.quantity!.toString() + 'ct')
        : -1;
    bool quantityMatch =
        _selectedEdiblesQuantity.any((isSelected) => isSelected)
            ? (quantityIndex != -1 && _selectedEdiblesQuantity[quantityIndex])
            : true;

    final typeIndex =
        product.type != null ? _ediblesTypeList.indexOf(product.type!) : -1;
    bool typeMatch = _selectedEdiblesTypes.any((isSelected) => isSelected)
        ? (typeIndex != -1 && _selectedEdiblesTypes[typeIndex])
        : true;

    bool priceMatch = product.price != null &&
        double.tryParse(product.price!.toString()) != null &&
        double.parse(product.price!.toString()) >=
            _selectedEdiblesPriceRange.start &&
        double.parse(product.price!.toString()) <=
            _selectedEdiblesPriceRange.end;

    return brandMatch &&
        thcMatch &&
        cbdMatch &&
        quantityMatch &&
        typeMatch &&
        priceMatch;
  }

  bool _applyBeveragesFilters(Product product) {
    try {
      final brandIndex = _beveragesBrands.indexOf(product.brand!);
      bool brandMatch = _selectedBeveragesBrands.any((isSelected) => isSelected)
          ? (brandIndex != -1 && _selectedBeveragesBrands[brandIndex])
          : true;
      bool thcMatch = _selectedBeveragesThc.any((isSelected) => isSelected)
          ? _beveragesTHCList.contains(product.thc)
          : true;

      bool cbdMatch = _selectedBeveragesCbd.any((isSelected) => isSelected) &&
              product.cbd != null
          ? _beveragesCBDList.contains(product.cbd)
          : true;
      final typeIndex = _beveragesTypeList.indexOf(product.type!);
      bool typeMatch = _selectedBeveragesTypes.any((isSelected) => isSelected)
          ? (typeIndex != -1 && _selectedBeveragesTypes[typeIndex])
          : true;
      bool priceMatch = product.price != null &&
          double.parse(product.price!.toString()) >=
              _selectedBeveragesPriceRange.start &&
          double.parse(product.price!.toString()) <=
              _selectedBeveragesPriceRange.end;
      bool allMatch =
          brandMatch && thcMatch && cbdMatch && typeMatch && priceMatch;
      return allMatch;
    } catch (e) {
      print('Error applying beverages filters: $e');
      return false;
    }
  }

  bool _applyTopicalsFilters(Product product) {
    try {
      final brandIndex = _topicalBrands.indexOf(product.brand!);
      bool brandMatch = _selectedTopicalsBrands.any((isSelected) => isSelected)
          ? (brandIndex != -1 && _selectedTopicalsBrands[brandIndex])
          : true;

      bool typeMatch = _selectedTopicalsTypes.any((isSelected) => isSelected)
          ? _selectedTopicalsTypes[_topicalTypeList.indexOf(product.type!)]
          : true;

      bool priceMatch = product.price != null &&
          product.price! >= _selectedTopicalsPriceRange.start &&
          product.price! <= _selectedTopicalsPriceRange.end;

      return brandMatch && typeMatch && priceMatch;
    } catch (e) {
      print('Error applying topicals filters: $e');
      return false;
    }
  }

  bool _applyTincturesFilters(Product product) {
    try {
      final brandIndex = _tincturesBrands.indexOf(product.brand!);
      bool brandMatch = _selectedTincturesBrands.any((isSelected) => isSelected)
          ? (brandIndex != -1 && _selectedTincturesBrands[brandIndex])
          : true;

      bool typeMatch = _selectedTincturesTypes.any((isSelected) => isSelected)
          ? _selectedTincturesTypes[_tincturesTypeList.indexOf(product.type!)]
          : true;

      bool priceMatch = product.price != null &&
          product.price! >= _selectedTincturesPriceRange.start &&
          product.price! <= _selectedTincturesPriceRange.end;

      bool thcMatch = product.thc != null &&
          product.thc! >= _selectedTincturesThcRange.start &&
          product.thc! <= _selectedTincturesThcRange.end;

      bool cbdMatch = product.cbd != null &&
          product.cbd! >= _selectedTincturesCbdRange.start &&
          product.cbd! <= _selectedTincturesCbdRange.end;

      return brandMatch && typeMatch && priceMatch && thcMatch && cbdMatch;
    } catch (e) {
      print('Error applying tinctures filters: $e');
      return false;
    }
  }

  bool _applyGrowingFilters(Product product) {
    try {
      final brandIndex = _growingBrands.indexOf(product.brand!);
      bool brandMatch = _selectedGrowingBrands.any((isSelected) => isSelected)
          ? (brandIndex != -1 && _selectedGrowingBrands[brandIndex])
          : true;

      bool priceMatch = product.price != null &&
          product.price! >= _selectedGrowingPriceRange.start &&
          product.price! <= _selectedGrowingPriceRange.end;

      return brandMatch && priceMatch;
    } catch (e) {
      print('Error applying growing filters: $e');
      return false;
    }
  }

  bool _applyCbdFilters(Product product) {
    try {
      final brandIndex = _cbdBrands.indexOf(product.brand!);
      bool brandMatch = _selectedCbdBrands.any((isSelected) => isSelected)
          ? (brandIndex != -1 && _selectedCbdBrands[brandIndex])
          : true;

      bool typeMatch = _selectedCbdTypes.any((isSelected) => isSelected)
          ? _selectedCbdTypes[_cbdTypeList.indexOf(product.type!)]
          : true;

      bool priceMatch = product.price != null &&
          product.price! >= _selectedCbdPriceRange.start &&
          product.price! <= _selectedCbdPriceRange.end;

      return brandMatch && typeMatch && priceMatch;
    } catch (e) {
      print('Error applying CBD filters: $e');
      return false;
    }
  }

  bool _applyAccessoriesFilters(Product product) {
    try {
      final brandIndex = _accessoriesBrands.indexOf(product.brand!);
      bool brandMatch =
          _selectedAccessoriesBrands.any((isSelected) => isSelected)
              ? (brandIndex != -1 && _selectedAccessoriesBrands[brandIndex])
              : true;

      bool typeMatch = _selectedAccessoriesTypes.any((isSelected) => isSelected)
          ? _selectedAccessoriesTypes[
              _accessoriesTypeList.indexOf(product.type!)]
          : true;

      bool priceMatch = product.price != null &&
          product.price! >= _selectedAccessoriesPriceRange.start &&
          product.price! <= _selectedAccessoriesPriceRange.end;

      return brandMatch && typeMatch && priceMatch;
    } catch (e) {
      print('Error applying accessories filters: $e');
      return false;
    }
  }

  bool _applyApparelFilters(Product product) {
    try {
      final brandIndex = _apparelBrands.indexOf(product.brand!);
      bool brandMatch = _selectedApparelBrands.any((isSelected) => isSelected)
          ? (brandIndex != -1 && _selectedApparelBrands[brandIndex])
          : true;

      bool sizeMatch = _selectedApparelSizes.any((isSelected) => isSelected)
          ? _selectedApparelSizes[
              _apparelSizeList.indexOf(product.apparelSize!)]
          : true;

      bool priceMatch = product.price != null &&
          product.price! >= _selectedApparelPriceRange.start &&
          product.price! <= _selectedApparelPriceRange.end;

      return brandMatch && sizeMatch && priceMatch;
    } catch (e) {
      print('Error applying apparel filters: $e');
      return false;
    }
  }

  /// filter functions

  Future<void> onStrainChange(List<bool> strainTypes) async {
    _selectedStrainTypes = strainTypes;
    notifyListeners();
  }

  Future<void> onBrandChange(List<bool> brands) async {
    _selectedFlowerBrands = brands;
    notifyListeners();
  }

  Future<void> onThcPotencyChange(thcRange) async {
    _selectedThcRange = thcRange;
    notifyListeners();
  }

  Future<void> onPriceRangeChange(priceRange) async {
    _selectedPriceRange = priceRange;
    notifyListeners();
  }

  Future<void> onFlowerSizeChange(sizes) async {
    _selectedSizes = {};
    for (int i = 0; i < sizes.length; i++) {
      if (sizes[i]) {
        final parsedSize = double.tryParse(
            _flowerSizeList[i].replaceAll(RegExp(r'[^0-9.]'), ''));
        notifyListeners();
        if (parsedSize != null) {
          _selectedSizes.add(parsedSize);
          notifyListeners();
        } else {
          print('Error parsing size: ${_flowerSizeList[i]}');
        }
      }
    }
  }

  Future<void> onFlowerTypeChange(types) async {
    _isFlowerTypeChecked = types;
    notifyListeners();
  }

  Future<void> onTerpenesChange(terpenes) async {
    _selectedTerpenes = terpenes.indexOf(true) != -1
        ? _flowerTerpenesList[terpenes.indexOf(true)]
        : null;
    notifyListeners();
  }

  Future<void> onPreRollBrandChange(brands) async {
    _selectedPreRollBrands = brands;
    notifyListeners();
  }

  Future<void> onPreRollStrainChange(strainTypes) async {
    _selectedPreRollStrainTypes = strainTypes;
    notifyListeners();
  }

  Future<void> onPreRollThcPotencyChange(thcRange) async {
    _selectedPreRollThcRange = thcRange;
    notifyListeners();
  }

  Future<void> onPreRollPriceRangeChange(priceRange) async {
    _selectedPreRollPriceRange = priceRange;
    notifyListeners();
  }

  Future<void> onPreRollSizeChange(sizes) async {
    final selectedIndex = sizes.indexOf(true);
    _selectedSize = selectedIndex != -1
        ? double.tryParse(
            _preRollSizeList[selectedIndex].replaceAll(RegExp(r'[^0-9.]'), ''))
        : null;
    notifyListeners();
  }

  Future<void> onPreRollTypeChange(types) async {
    _selectedPreRollTypes = types;
    notifyListeners();
  }

  Future<void> onPreRollTerpenesChange(terpenes) async {
    _selectedTerpenes = terpenes.indexOf(true) != -1
        ? _preRollTerpenesList[terpenes.indexOf(true)]
        : null;
    notifyListeners();
  }

  Future<void> onConcentratesBrandChange(brands) async {
    _selectedConcentratesBrands = brands;
    notifyListeners();
  }

  Future<void> onConcentratesThcPotencyChange(thcRange) async {
    _selectedConcentratesThcRange = thcRange;
    notifyListeners();
  }

  Future<void> onConcentratesPriceRangeChange(priceRange) async {
    _selectedConcentratesPriceRange = priceRange;
    notifyListeners();
  }

  Future<void> onConcentratesSizeChange(sizes) async {
    _selectedConcentratesSizes = sizes;
    notifyListeners();
  }

  Future<void> onConcentratesTypeChange(types) async {
    _selectedConcentratesTypes = types;
    notifyListeners();
  }

  Future<void> onConcentratesMethodChange(methods) async {
    _selectedConcentratesMethods = methods;
    notifyListeners();
  }

  Future<void> onConcentratesTerpenesChange(terpenes) async {
    _selectedConcentratesTerpenes = terpenes;
    notifyListeners();
  }

  Future<void> onStrainTypeChange(types) async {
    _selectedConcentratesStrainTypes = types;
    notifyListeners();
  }

  /// Vape
  Future<void> onVapeBrandChange(brands) async {
    _selectedVapeBrands = brands;
    notifyListeners();
  }

  Future<void> onVapeThcPotencyChange(thcRange) async {
    _selectedVapeThcRange = thcRange;
    notifyListeners();
  }

  Future<void> onVapeCbdPotencyChange(cbdRange) async {
    _selectedVapeCbdRange = cbdRange;
    notifyListeners();
  }

  Future<void> onVapePriceRangeChange(priceRange) async {
    _selectedVapePriceRange = priceRange;
    notifyListeners();
  }

  Future<void> onVapeCbdRatioChange(cbdRatios) async {
    _selectedVapeCbdRatios = cbdRatios;
    notifyListeners();
  }

  Future<void> onVapeSizeChange(sizes) async {
    _selectedVapeSizes = sizes;
    notifyListeners();
  }

  Future<void> onVapeTypeChange(types) async {
    _selectedVapeTypes = types;
    notifyListeners();
  }

  Future<void> onVapeTerpenesChange(terpenes) async {
    _selectedVapeTerpenes = terpenes;
    notifyListeners();
  }

  // edibles
  Future<void> onEdiblesBrandChange(brands) async {
    _selectedEdiblesBrands = brands;
    notifyListeners();
  }

  Future<void> onEdiblesThcChange(thcs) async {
    _selectedEdiblesThc = thcs;
    notifyListeners();
  }

  Future<void> onEdiblesCbdChange(cbds) async {
    _selectedEdiblesCbd = cbds;
    notifyListeners();
  }

  Future<void> onEdiblesQuantityChange(quantities) async {
    _selectedEdiblesQuantity = quantities;
    notifyListeners();
  }

  Future<void> onEdiblesPriceRangeChange(priceRange) async {
    _selectedEdiblesPriceRange = priceRange;
    notifyListeners();
  }

  Future<void> onEdiblesTypeChange(types) async {
    _selectedEdiblesTypes = types;
    notifyListeners();
  }

  // Beverages
  Future<void> onBeveragesBrandChange(brands) async {
    _selectedBeveragesBrands = brands;
    notifyListeners();
  }

  Future<void> onBeveragesThcChange(thcs) async {
    _selectedBeveragesThc = thcs;
    notifyListeners();
  }

  Future<void> onBeveragesCbdChange(cbds) async {
    _selectedBeveragesCbd = cbds;
    notifyListeners();
  }

  Future<void> onBeveragesPriceRangeChange(priceRange) async {
    _selectedBeveragesPriceRange = priceRange;
    notifyListeners();
  }

  Future<void> onBeveragesTypeChange(types) async {
    _selectedBeveragesTypes = types;
    notifyListeners();
  }

  // Topicals
  Future<void> onTopicalsBrandChange(brands) async {
    _selectedTopicalsBrands = brands;
    notifyListeners();
  }

  Future<void> onTopicalsPriceRangeChange(priceRange) async {
    _selectedTopicalsPriceRange = priceRange;
    notifyListeners();
  }

  Future<void> onTopicalsTypeChange(types) async {
    _selectedTopicalsTypes = types;
    notifyListeners();
  }

  // Tinctures
  Future<void> onTincturesBrandChange(brands) async {
    _selectedTincturesBrands = brands;
    notifyListeners();
  }

  Future<void> onTincturesThcPotencyChange(thcRange) async {
    _selectedTincturesThcRange = thcRange;
    notifyListeners();
  }

  Future<void> onTincturesCbdPotencyChange(cbdRange) async {
    _selectedTincturesCbdRange = cbdRange;
    notifyListeners();
  }

  Future<void> onTincturesPriceRangeChange(priceRange) async {
    _selectedTincturesPriceRange = priceRange;
    notifyListeners();
  }

  Future<void> onTincturesTypeChange(types) async {
    _selectedTincturesTypes = types;
    notifyListeners();
  }

  //Growing
  Future<void> onGrowingBrandChange(brands) async {
    _selectedGrowingBrands = brands;
    notifyListeners();
  }

  Future<void> onGrowingPriceRangeChange(priceRange) async {
    _selectedGrowingPriceRange = priceRange;
    notifyListeners();
  }

  //CBD
  Future<void> onCbdBrandChange(brands) async {
    _selectedCbdBrands = brands;
    notifyListeners();
  }

  Future<void> onCbdPriceRangeChange(priceRange) async {
    _selectedCbdPriceRange = priceRange;
    notifyListeners();
  }

  Future<void> onCbdTypeChange(types) async {
    _selectedCbdTypes = types;
    notifyListeners();
  }

  //Accessories
  Future<void> onAccessoriesBrandChange(brands) async {
    _selectedAccessoriesBrands = brands;
    notifyListeners();
  }

  Future<void> onAccessoriesPriceRangeChange(priceRange) async {
    _selectedAccessoriesPriceRange = priceRange;
    notifyListeners();
  }

  Future<void> onAccessoriesTypeChange(types) async {
    _selectedAccessoriesTypes = types;
    notifyListeners();
  }

  // Apparel
  Future<void> onApparelBrandChange(brands) async {
    _selectedApparelBrands = brands;
    notifyListeners();
  }

  Future<void> onApparelPriceRangeChange(priceRange) async {
    _selectedApparelPriceRange = priceRange;
    notifyListeners();
  }

  Future<void> onApparelSizeChange(sizes) async {
    _selectedApparelSizes = sizes;
    notifyListeners();
  }
}

List<List<Product>> productList = [
  flowersProducts,
  preRollProducts,
  concentratesProducts,
  vaporizersProducts,
  ediblesProducts,
  beveragesProducts,
  topicalsProducts,
  tincturesProducts,
  growingProducts,
  cbdProducts,
  accessoriesProducts,
  apparelProducts
];

///

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
List<String> _typeList = ['Indica', 'Sativa', 'Hybrid'];
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
